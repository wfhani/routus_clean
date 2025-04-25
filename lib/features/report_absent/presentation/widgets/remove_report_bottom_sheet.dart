import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../data/models/absence_model.dart';
import '../cubit/absence_cubit.dart';

class RemoveReportBottomSheet extends StatelessWidget {
  final List<Absence> absences;
  final int studentId;
  final VoidCallback onReportRemoved;

  const RemoveReportBottomSheet({
    super.key,
    required this.absences,
    required this.studentId,
    required this.onReportRemoved,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 18.h),

          SizedBox(
            width: 300.w,
            height: 180.h,
            child: SvgPicture.asset(
              'assets/icons/report_absent/delete_report.svg',
              fit: BoxFit.contain,
            ),
          ),
          Spacer(),

          // 📝 Message
          Text(
            'The absence report for your child is active. Do you want to cancel it?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.sp,
              fontFamily: 'Comfortaa',
              color: const Color(0xFF052A43),
            ),
          ),

          Spacer(),

          // 🧭 Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Cancel Button
              SizedBox(
                width: 140.w,
                height: 44.h,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context); // Auto-close
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Color(0xFF052A43), width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF052A43),
                    ),
                  ),
                ),
              ),

              // Remove Report Button
              SizedBox(
                width: 180.w,
                height: 44.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFC700),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  onPressed: () async {
                    final cubit = context.read<AbsenceCubit>();

                    try {
                      cubit.emit(AbsenceLoading());

                      for (final absence in absences) {
                        await cubit.repo.deleteAbsence(studentId, absence.id);
                      }

                      final refreshed = await cubit.repo.fetchAbsences(studentId);
                      cubit.emit(AbsenceLoaded(refreshed));

                      onReportRemoved();
                    } catch (e) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error: ${e.toString()}')),
                        );
                      }
                    }

                    if (context.mounted) {
                      Navigator.of(context).pop(); // Auto-close after success or error
                    }
                  },
                  child: Text(
                    'Remove report',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF052A43),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
