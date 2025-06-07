import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../../../components/custom_button.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../contacts/widgets/child_selector_bottom_sheet.dart';
import '../../data/models/absence_model.dart';
import '../cubit/absence_cubit.dart';
import '../widgets/CalendarContainer.dart';
import '../widgets/remove_report_bottom_sheet.dart';

class ReportAbsentScreen extends StatefulWidget {
  const ReportAbsentScreen({super.key});

  @override
  State<ReportAbsentScreen> createState() => ReportAbsentScreenState();
}

class ReportAbsentScreenState extends State<ReportAbsentScreen> {
  final DateRangePickerController _controller = DateRangePickerController();
  List<DateTime> _selectedDates = [];
  int studentId = 242502;
  bool _isEditMode = false;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _controller.selectedDates = [];
    context.read<AbsenceCubit>().loadAbsences(studentId);
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is List<DateTime>) {
      final selected = (args.value as List<DateTime>)
          .map((d) => DateTime(d.year, d.month, d.day))
          .toList();
      setState(() {
        _selectedDates = selected;
        _controller.selectedDates = selected;
      });
    }
  }

  void _navigateMonth(bool forward) {
    forward ? _controller.forward!() : _controller.backward!();
  }

  void _showChildFilterSheet() {
    showChildSelectorBottomSheet(context);
  }

  void _showRemoveBottomSheet(List<Absence> absences) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      builder: (_) => RemoveReportBottomSheet(
        absences: absences,
        studentId: studentId,
        onReportRemoved: resetReportState,
      ),
    );
  }

  void resetReportState() {
    setState(() {
      _isEditMode = false;
      _selectedDates.clear();
      _controller.selectedDates = [];
    });
    context.read<AbsenceCubit>().loadAbsences(studentId);
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Report Absent'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: IconButton(
                onPressed: _showChildFilterSheet,
                icon: SvgPicture.asset(
                  'assets/icons/filter.svg',
                  width: 24.w,
                  height: 24.h,
                ),
              ),
            ),
          ],
        ),
        body: BlocBuilder<AbsenceCubit, AbsenceState>(
          builder: (context, state) {
            List<Absence> absences = [];
            if (state is AbsenceLoaded) absences = state.absences;
            final hasReport = absences.isNotEmpty;

            final displayDates = _isEditMode || !hasReport
                ? _selectedDates
                : absences.map((e) => e.date).toList();

            final isViewMode = hasReport && !_isEditMode && !_isSubmitting;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 12.h),
                  Text(
                    isViewMode
                        ? "Here are the dates your child will be absent."
                        : "Select the dates your child will be absent and save the report.",
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),

                  if (isViewMode)
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(bottom:18.h),
                        child: GestureDetector(
                          onTap: () {
                            final existing = absences
                                .map((e) => DateTime(e.date.year, e.date.month, e.date.day))
                                .toList();
                            setState(() {
                              _isEditMode = true;
                              _selectedDates = existing;
                              _controller.selectedDates = existing;
                            });
                          },
                          child: SvgPicture.asset(
                            'assets/icons/report_absent/edit.svg',
                            width: 24.w,
                            height: 24.h,
                          ),
                        ),
                      ),
                    ),

                  CalendarContainer(
                    controller: _controller,
                    selectedDates: displayDates,
                    onSelectionChanged: _onSelectionChanged,
                    onArrowTap: _navigateMonth,
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: CustomButton(
                      text: isViewMode ? "Remove report" : "Save",
                      onPressed: () async {
                        final cubit = context.read<AbsenceCubit>();
                        final currentState = cubit.state;

                        if (_isSubmitting) return;

                        if (currentState is AbsenceLoaded) {
                          if (isViewMode) {
                            _showRemoveBottomSheet(currentState.absences);
                          } else {
                            if (_selectedDates.isEmpty) {
                              print("🚫 No dates selected, skipping save");
                              return;
                            }

                            print("💾 Submitting dates: $_selectedDates");

                            setState(() {
                              _isSubmitting = true;
                            });

                            if (_isEditMode) {
                              await cubit.editAbsences(_selectedDates, studentId);
                            } else {
                              await cubit.submitAbsences(_selectedDates, studentId);
                            }

                            setState(() {
                              _isEditMode = false;
                              _isSubmitting = false;
                              _selectedDates.clear();
                              _controller.selectedDates = [];
                            });

                            await cubit.loadAbsences(studentId);
                          }
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}