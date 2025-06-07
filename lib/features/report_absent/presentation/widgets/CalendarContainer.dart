import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CalendarContainer extends StatelessWidget {
  final DateRangePickerController controller;
  final List<DateTime> selectedDates;
  final void Function(DateRangePickerSelectionChangedArgs)? onSelectionChanged;
  final void Function(bool isForward) onArrowTap;
  final VoidCallback? onEditTap;
  final bool showEditIcon;

  const CalendarContainer({
    super.key,
    required this.controller,
    required this.selectedDates,
    required this.onArrowTap,
    this.onSelectionChanged,
    this.onEditTap,
    this.showEditIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    final currentDate = controller.displayDate ?? DateTime.now();

    return SizedBox(
      width: 340.w,
      height: 388.h,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 20.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildArrow(false),
                    Text(
                      "${_monthName(currentDate)} ${currentDate.year}",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF052A43),
                      ),
                    ),
                    _buildArrow(true),
                  ],
                ),
                SizedBox(height: 20.h),
                Divider(
                  thickness: 1.2,
                  height: 0.2,
                  indent: 16.w,
                  endIndent: 16.w,
                  color: const Color(0x5C052A43),
                ),
                SizedBox(height: 16.h),
                Expanded(
                  child: SfDateRangePicker(
                    controller: controller,
                    view: DateRangePickerView.month,
                    selectionMode: DateRangePickerSelectionMode.multiple,
                    onSelectionChanged: onSelectionChanged,
                    minDate: DateTime.now(),
                    selectionColor: Colors.transparent,
                    todayHighlightColor: Colors.transparent,
                    showNavigationArrow: false,
                    allowViewNavigation: false,
                    backgroundColor: Colors.white,
                    headerHeight: 0,
                    monthViewSettings: DateRangePickerMonthViewSettings(
                      firstDayOfWeek: 1,
                      dayFormat: 'EEE',
                      showTrailingAndLeadingDates: true,
                      viewHeaderStyle: DateRangePickerViewHeaderStyle(
                        textStyle: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF052A43),
                        ),
                      ),
                    ),
                    monthCellStyle: DateRangePickerMonthCellStyle(
                      textStyle: TextStyle(
                        fontSize: 20.sp,
                        fontFamily: 'Comfortaa',
                        color: const Color(0xFF052A43),
                      ),
                      leadingDatesTextStyle: TextStyle(
                        fontSize: 20.sp,
                        fontFamily: 'Comfortaa',
                        color: const Color(0xFFA3B0B9),
                      ),
                      trailingDatesTextStyle: TextStyle(
                        fontSize: 20.sp,
                        fontFamily: 'Comfortaa',
                        color: const Color(0xFFA3B0B9),
                      ),
                    ),
                    cellBuilder: (context, details) {
                      final isSelected = selectedDates.any((d) =>
                      d.year == details.date.year &&
                          d.month == details.date.month &&
                          d.day == details.date.day);
                      final isInMonth = details.date.month == currentDate.month;
                      final isTrailing = !isInMonth;

                      return Container(
                        margin: EdgeInsets.all(2.w),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFFA2BDFF) : Colors.transparent,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '${details.date.day}',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontFamily: 'Comfortaa',
                            color: isSelected
                                ? const Color(0xFF052A43)
                                : isTrailing
                                ? const Color(0xFFA3B0B9)
                                : const Color(0xFF052A43),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          if (showEditIcon)
            Positioned(
              top: 12.h,
              right: 12.w,
              child: GestureDetector(
                onTap: onEditTap,
                child: SvgPicture.asset(
                  'assets/icons/edit.svg',
                  width: 24.w,
                  height: 24.h,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildArrow(bool isForward) {
    return InkWell(
      onTap: () => onArrowTap(isForward),
      child: Container(
        width: 36.w,
        height: 36.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.20),
              blurRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(
          isForward ? Icons.chevron_right : Icons.chevron_left,
          color: const Color(0xFF052A43),
        ),
      ),
    );
  }

  String _monthName(DateTime date) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December',
    ];
    return months[date.month - 1];
  }
}
