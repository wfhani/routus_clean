import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'widgets/face_id_action_button.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:routus_clean/core/preferences_helper.dart';
import 'dart:io';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FaceIdScreen extends StatefulWidget {
  const FaceIdScreen({super.key});

  @override
  State<FaceIdScreen> createState() => _FaceIdScreenState();
}

class _FaceIdScreenState extends State<FaceIdScreen> {
  List<XFile> _selectedImages = [];
  String? _selectedMethod; // 'gallery' or 'camera'
  bool _isLoading = false;
  List<String> _uploadedPhotoUrls = [];

  final ImagePicker _picker = ImagePicker();
  final int maxPhotos = 3;

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Future<int?> _getStudentId() async {
    final user = await PreferencesHelper().getUser();
    return user?.id;
  }

  Future<String?> _uploadToFirebase(XFile file) async {
    try {
      final ref = FirebaseStorage.instance.ref().child('face_photos/${DateTime.now().millisecondsSinceEpoch}_${file.name}');
      final uploadTask = await ref.putFile(File(file.path));
      return await uploadTask.ref.getDownloadURL();
    } catch (e) {
      print('Firebase upload error: $e');
      return null;
    }
  }

  Future<void> _sendPhotoUrlToBackend(String url) async {
    final token = await _getToken();
    final studentId = await _getStudentId();
    if (studentId == null) {
      print('No student ID found');
      return;
    }
    final dio = Dio();
    try {
      final response = await dio.post(
        'http://127.0.0.1:8000/api/student/photo',
        data: {
          'student_id': studentId,
          'photo_url': url,
        },
        options: Options(
          headers: token != null ? {'Authorization': 'Bearer $token'} : {},
        ),
      );
      if (response.statusCode == 200) {
        print('Photo URL sent successfully');
      } else {
        print('Failed to send photo URL: \\${response.statusCode}');
      }
    } catch (e) {
      print('Backend upload error: $e');
    }
  }

  Future<void> _fetchUploadedPhotos() async {
    setState(() => _isLoading = true);
    final token = await _getToken();
    final studentId = await _getStudentId();
    if (studentId == null) {
      print('No student ID found');
      setState(() => _isLoading = false);
      return;
    }
    final dio = Dio();
    try {
      final response = await dio.get(
        'http://127.0.0.1:8000/api/student/$studentId/photos',
        options: Options(
          headers: token != null ? {'Authorization': 'Bearer $token'} : {},
        ),
      );
      if (response.statusCode == 200 && response.data is List) {
        setState(() {
          _uploadedPhotoUrls = List<String>.from(response.data.map((e) => e['photo_url']));
        });
      }
    } catch (e) {
      print('Fetch photos error: $e');
    }
    setState(() => _isLoading = false);
  }

  Future<void> _pickFromGallery() async {
    setState(() {
      _selectedMethod = 'gallery';
    });
    final photosStatus = await Permission.photos.request();
    final storageStatus = await Permission.storage.request(); // for older Android
    if (photosStatus.isGranted || storageStatus.isGranted) {
      final List<XFile>? images = await _picker.pickMultiImage();
      if (images != null && images.isNotEmpty) {
        setState(() {
          _selectedImages = images.take(maxPhotos).toList();
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gallery permission denied.')),
      );
    }
  }

  Future<void> _takeNewPhoto() async {
    setState(() {
      _selectedMethod = 'camera';
    });
    final cameraStatus = await Permission.camera.request();
    final photosStatus = await Permission.photos.request(); // for Android 13+
    if (cameraStatus.isGranted && (photosStatus.isGranted || photosStatus.isLimited || photosStatus.isRestricted)) {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        setState(() {
          if (_selectedImages.length < maxPhotos) {
            _selectedImages.add(image);
          }
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Camera or storage permission denied.')),
      );
    }
  }

  Future<void> _onContinue() async {
    if (_selectedImages.isEmpty) return;
    setState(() => _isLoading = true);
    for (final file in _selectedImages) {
      final url = await _uploadToFirebase(file);
      if (url != null) {
        await _sendPhotoUrlToBackend(url);
      }
    }
    await _fetchUploadedPhotos();
    setState(() => _isLoading = false);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Photos uploaded successfully!')),
    );
  }

  void _showChildFilterSheet(BuildContext context) {
    // You can implement your own filter logic or reuse the child selector bottom sheet if needed
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 200,
        child: Center(child: Text('Filter options here')), // Replace with your filter UI
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchUploadedPhotos();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF052A43),
              Color(0xFF0D6AA9),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Back arrow, title, and filter icon
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        const SizedBox(width: 55),
                        //const SizedBox(height: 10),
                        Text(
                          l10n.setFaceId,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => _showChildFilterSheet(context),
                      child: SvgPicture.asset(
                        'assets/icons/filter.svg',
                        width: 32,
                        height: 32,
                        colorFilter: const ColorFilter.mode(Color(0xFFFDC70A), BlendMode.srcIn),
                      ),
                    ),
                  ],
                ),
              ),
              // Illustration
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.22,
                child: SvgPicture.asset(
                  'assets/images/face_id.svg',
                  fit: BoxFit.contain,
                ),
              ),
              //const SizedBox(height: 16),
              // Add Face Photos text (smaller, left-aligned)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  l10n.addFacePhotos,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //const SizedBox(height: 16),
              // Action buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    FaceIdActionButton(
                      onTap: _pickFromGallery,
                      color: const Color(0xFFE6F0F8),
                      icon: Icons.photo_library,
                      title: 'Upload from gallery',
                      subtitle: 'Choose existing photos',
                      isSelected: _selectedMethod == 'gallery',
                    ),
                    const SizedBox(height: 16),
                    FaceIdActionButton(
                      onTap: _takeNewPhoto,
                      color: Colors.white,
                      icon: Icons.camera_alt,
                      title: 'Take new photos',
                      subtitle: 'Use camera to capture',
                      isSelected: _selectedMethod == 'camera',
                    ),
                  ],
                ),
              ),
              //const SizedBox(height: 24),
              // Photo requirements
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.info_outline, color: Color(0xFFFDC70A), size: 32),
                        const SizedBox(width: 8),
                        Text(
                          l10n.photoRequirements,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    //const SizedBox(height: 12),
                    _RequirementItemSvg(
                      iconPath: 'assets/icons/min.svg',
                      text: l10n.min3Photos,
                      iconSize: 20,
                      indent: 16,
                    ),
                    _RequirementItemSvg(
                      iconPath: 'assets/icons/well_lit.svg',
                      text: l10n.wellLit,
                      iconSize: 20,
                      indent: 16,
                    ),
                    _RequirementItemSvg(
                      iconPath: 'assets/icons/no.svg',
                      text: l10n.noMasks,
                      iconSize: 20,
                      indent: 16,
                    ),
                    _RequirementItemSvg(
                      iconPath: 'assets/icons/front.svg',
                      text: l10n.frontAngles,
                      iconSize: 20,
                      indent: 16,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // Continue button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _selectedMethod == null ? null : _onContinue,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedMethod == null ? const Color(0xFFB0B0B0) : const Color(0xFFFDC70A),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(color: Colors.black)
                        : const Text('Continue'),
                  ),
                ),
              ),
              if (_uploadedPhotoUrls.isNotEmpty) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                  child: SizedBox(
                    height: 80,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: _uploadedPhotoUrls.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) => ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(_uploadedPhotoUrls[index], width: 80, height: 80, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _RequirementItemSvg extends StatelessWidget {
  final String iconPath;
  final String text;
  final double iconSize;
  final double indent;
  const _RequirementItemSvg({super.key, required this.iconPath, required this.text, this.iconSize = 20, this.indent = 0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: indent, top: 4.0, bottom: 4.0),
      child: Row(
        children: [
          SvgPicture.asset(iconPath, width: iconSize, height: iconSize),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 18),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
} 