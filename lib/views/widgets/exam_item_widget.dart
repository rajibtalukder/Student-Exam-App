import 'package:intl/intl.dart';
import 'package:lexam/lexam.dart';
import 'package:lexam/models/live_exam_model.dart';

import 'floating_widget.dart';

class ExamItemWidget extends StatelessWidget {
  final Color? color;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;
  final Function? onPressed;
  final LiveExam exam;

  const ExamItemWidget(
      {Key? key,
      this.color,
      this.borderColor,
      this.padding,
      this.onPressed,
      required this.exam})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 8.h),
      child: InkWell(
        onTap: () {
          if (onPressed != null) {
            onPressed!();
          }
        },
        child: Padding(
          padding: padding ?? EdgeInsets.symmetric(horizontal: 14.w),
          child: FloatingWidget(
            alignment: Alignment.topRight,
            floatingChild: Container(
              margin: EdgeInsets.only(right: 16.w),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: color ?? AppColors.custom('#96C3E7'),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    AppIcons.clock,
                    width: 24.h,
                    height: 24.h,
                  ),
                  Text(
                      DateFormat('hh:mm a')
                          .format(DateTime.parse(exam.schedule.toString()))
                          .toLowerCase(),
                      style: AppTextStyles.widgetTitle.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.sp,
                      )),
                ],
              ),
            ),
            floatingBody: Container(
              height: 86.h,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(4.r),
                border: borderColor != null
                    ? Border.all(
                        color: borderColor!,
                      )
                    : null,
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        exam.examName!,
                        style: AppTextStyles.title,
                      ),
                      const Spacer(),
                      Text(
                        'প্রশ্ন - ${exam.totalQuestion}',
                        style: AppTextStyles.body,
                      ),
                      Text(
                        'সময় - ${exam.examDuration}',
                        style: AppTextStyles.body,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Spacer(),
                      Text(
                        'পপরীক্ষার্থী : ${exam.examineeNum}',
                        style: AppTextStyles.body,
                      ),
                      const Spacer(),
                      Text(
                        DateFormat('dd MMMM, yyyy')
                            .format(DateTime.parse(exam.schedule.toString())),
                        style: AppTextStyles.body,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
