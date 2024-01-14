import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:lexam/controllers/get_controllers.dart';
import 'package:lexam/controllers/home_screen_controller.dart';
import 'package:lexam/lexam.dart';
import 'package:lexam/views/widgets/exam_item_widget.dart';

import '../../result/exam_result_screen.dart';

class LiveMCQExamWidget extends StatelessWidget {
  LiveMCQExamWidget({
    Key? key,
  }) : super(key: key);

  final HomeScreenController controller =
      GetControllers.instance.getHomeScreenController();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.examController.liveExams.isEmpty) {
          return const Text('No Live Exam');
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'লাইভ MCQ পরীক্ষা',
                    style: AppTextStyles.widgetTitle,
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(const ExamResultScreen());
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(color: AppColors.green)),
                      child: Text(
                        'Check Result',
                        style:
                        AppTextStyles.examOption.copyWith(color: AppColors.green),
                      ),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.examController.liveExams.length,
                  itemBuilder: (context, index) {
                    return ExamItemWidget(
                      padding: EdgeInsets.zero,
                      exam: controller.examController.liveExams[index],
                      onPressed: () {
                        controller.onPressedLiveExam(
                            controller.examController.liveExams[index]);
                      },
                    );
                  })
            ],
          ),
        );
      },
    );
  }
}
