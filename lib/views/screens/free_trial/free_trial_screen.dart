import 'package:get/get.dart';

import '../../../controllers/get_controllers.dart';
import '../../../lexam.dart';
import '../main/main_screen.dart';

class FreeTrialScreen extends StatelessWidget {
  FreeTrialScreen({super.key});

  final durationController =
  GetControllers.instance.getFreeTrialDurationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarStyles.white,
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: Obx(
                () => Column(
              children: [
                durationController.isLoading.isTrue
                    ? const Center(child: CircularProgressIndicator())
                    : checkResultItemWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget checkResultItemWidget() {
    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: InkWell(
        onTap: () async {},
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'ID : ',
                        style: AppTextStyles.widgetOption
                            .copyWith(color: AppColors.black),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        durationController.freeDuration!.data.id.toString(),
                        style: AppTextStyles.widgetOption
                            .copyWith(color: AppColors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Description : ',
                        style: AppTextStyles.widgetOption
                            .copyWith(color: AppColors.black),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        durationController.freeDuration!.data.description,
                        style: AppTextStyles.widgetOption
                            .copyWith(color: AppColors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Duration : ',
                        style: AppTextStyles.widgetOption
                            .copyWith(color: AppColors.black),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        durationController.freeDuration!.data.duration
                            .toString(),
                        style: AppTextStyles.widgetOption
                            .copyWith(color: AppColors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                InkWell(
                  onTap: () {
                    durationController.postFreeTrial(
                        durationController.freeDuration!.data.duration).then((value) {
                      Get.offAll(MainScreen());
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.h,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.blue,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          spreadRadius: 0,
                          offset: Offset(0, 1.h),
                          color: AppColors.black.withOpacity(0.25),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Text(
                      'সাবমিট ',
                      style: AppTextStyles.title.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

// Row(
// children: [
// Expanded(
// child: Text('jjj',
// style:
// AppTextStyles.semiBold14.copyWith(color: AppColors.black),
// ),
// ),
// //const Spacer(),
// SvgPicture.asset(
// AppIcons.forwardArrow,
// color: AppColors.black,
// width: 24.h,
// height: 24.h,
// ),
// ],
// ),
