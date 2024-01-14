import 'package:get/get.dart';
import 'package:lexam/lexam.dart';
import 'package:lexam/controllers/practice_screen_controller.dart';
import 'package:lexam/controllers/get_controllers.dart';
import 'package:lexam/views/screens/free_trial/free_trial_screen.dart';
import 'package:lexam/views/widgets/common_header_widget.dart';

import 'components/option_exam_widget.dart';

class PracticeScreen extends StatelessWidget {
  PracticeScreen({Key? key}) : super(key: key);

  final PracticeScreenController controller =
      GetControllers.instance.getPracticeScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarStyles.white,
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 16.h),
            const CommonHeaderWidget(),
            GestureDetector(
              onTap:(){
                Get.to(FreeTrialScreen());
              },
              child: Padding(
                padding: EdgeInsets.all(10.h),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: AppColors.blue,
                  ),
                  child: Text('Free Trial',
                      style: AppTextStyles.widgetTitle.copyWith(
                        color: AppColors.white,
                      )),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                color: AppColors.lightBlueAccent,
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    SizedBox(height: 16.h),
                    OptionExamWidget(
                      title: 'বার কাউন্সিল পরীক্ষা',
                      isBGJ: false,
                    ),
                    SizedBox(height: 34.h),
                    OptionExamWidget(
                      title: 'বি জে এস পরীক্ষা',
                      isBGJ: true,
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
