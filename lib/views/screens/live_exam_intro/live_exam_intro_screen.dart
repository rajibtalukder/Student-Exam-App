import 'package:intl/intl.dart';
import 'package:lexam/lexam.dart';
import 'package:lexam/controllers/live_exam_intro_screen_controller.dart';
import 'package:lexam/controllers/get_controllers.dart';
import 'package:get/get.dart';
import 'package:lexam/views/widgets/widget_loading.dart';

class LiveExamIntroScreen extends StatelessWidget {
  LiveExamIntroScreen({Key? key}) : super(key: key);

  final LiveExamIntroScreenController controller =
      GetControllers.instance.getLiveExamIntroScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarStyles.white,
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
          ),
          child: WidgetLoading(
            loading: controller.loading,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 16.h),
                Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset(
                      AppIcons.backArrow,
                      color: AppColors.black,
                      width: 24.h,
                      height: 24.h,
                    ),
                  ),
                ),
                SizedBox(height: 56.h),
                Text(
                  DateFormat('dd MMMM, yyyy').format(DateTime.now()),
                  style: AppTextStyles.hint.copyWith(color: AppColors.gray),
                ),
                SizedBox(height: 36.h),
                Text(
                  controller.currentExam.value.examName.toString(),
                  style: AppTextStyles.screenTitle,
                ),
                SizedBox(height: 4.h),
                Text(
                  'প্রশ্ন - ${controller.currentExam.value.totalQuestion.toString().enNumToBeNum} টি',
                  style: AppTextStyles.title.copyWith(
                    color: AppColors.black,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'সময় - ${controller.currentExam.value.examTime!.enNumToBeNum} মিনিট',
                  style: AppTextStyles.title.copyWith(
                    color: AppColors.black,
                    fontSize: 12.sp,
                  ),
                ),
                const Spacer(),
                Visibility(
                  visible: controller.alreadyAttended.value,
                  child: Text(
                    'আপনি ইতিমধ্যে এই পরীক্ষায়\nঅংশগ্রহণ করেছেন!',
                    style: AppTextStyles.widgetTitle.copyWith(
                      color: AppColors.blue,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Visibility(
                  visible: controller.alreadyAttended.isTrue
                      ? false
                      : !controller.examStarted.value,
                  child: Column(
                    children: [
                      Text(
                        '- এই পরীক্ষাটি শুরু হবে -',
                        style: AppTextStyles.widgetTitle
                            .copyWith(color: AppColors.black, fontSize: 14.sp),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        DateFormat('dd MMMM, yyyy  hh:mm a')
                            .format(controller.dateTime)
                            .toLowerCase(),
                        style: AppTextStyles.widgetTitle.copyWith(
                          color: AppColors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Visibility(
                  visible: controller.examStarted.value,
                  child: InkWell(
                    onTap: () {
                      controller.goToExamScreen();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 18.h, horizontal: 33.w),
                      decoration: BoxDecoration(
                        color: AppColors.blue,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        'শুরু করুন',
                        style: AppTextStyles.buttonText,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 18.h, horizontal: 33.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Text(
                      'বাতিল করুন',
                      style: AppTextStyles.buttonText
                          .copyWith(color: AppColors.gray),
                    ),
                  ),
                ),
                SizedBox(height: 56.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
