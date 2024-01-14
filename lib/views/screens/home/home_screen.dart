import 'package:lexam/lexam.dart';
import 'package:lexam/controllers/home_screen_controller.dart';
import 'package:lexam/controllers/get_controllers.dart';
import 'package:lexam/views/screens/resource/components/note_widget.dart';
import 'package:lexam/views/widgets/common_header_widget.dart';

import '../../../controllers/practice_screen_controller.dart';
import '../../../controllers/user_controller.dart';
import '../practice/components/option_exam_widget.dart';
import 'components/courses_widget.dart';
import 'components/image_slider_widget.dart';
import 'components/live_mcq_exam_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeScreenController controller =
  GetControllers.instance.getHomeScreenController();
  final PracticeScreenController practiceController =
  GetControllers.instance.getPracticeScreenController();
  final UserController userController =
  GetControllers.instance.getUserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarStyles.white,
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 16.h),
            const CommonHeaderWidget(
              showNews: true,
            ),
            SizedBox(height: 20.h),
            ImageSliderWidget(),
            SizedBox(height: 24.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              padding: EdgeInsets.symmetric(vertical: 16.h),
              color: AppColors.lightBlueAccent,
              child: Column(
                children: [
                  CoursesWidget(),
                  SizedBox(height: 24.h),
                  LiveMCQExamWidget(),
                  SizedBox(height: 24.h),
                  OptionExamWidget(
                    title: 'বার কাউন্সিল পরীক্ষা',
                    isBGJ: false,
                  ),
                  SizedBox(height: 34.h),
                  NoteWidget()
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

  