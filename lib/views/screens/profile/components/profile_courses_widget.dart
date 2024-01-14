import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:lexam/controllers/get_controllers.dart';
import 'package:lexam/controllers/user_controller.dart';
import 'package:lexam/lexam.dart';
import 'package:lexam/models/user_course_model.dart';
import 'package:lexam/views/screens/enrolled_course_view/enrolled_course_view_screen.dart';

class ProfileCoursesWidget extends StatelessWidget {
  ProfileCoursesWidget({Key? key}) : super(key: key);

  final UserController userController =
      GetControllers.instance.getUserController();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (userController.usersCourses.isEmpty) {
        return Center(
          child: Text(
            'খুব শীঘ্রই এপসটি থেকে ভিডিও কোর্স করা যাবে',
            style: AppTextStyles.examOption,
          ),
        );
      }

      return AlignedGridView.count(
        padding: EdgeInsets.symmetric(vertical: 24.h),
        shrinkWrap: true,
        crossAxisCount: 2,
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 16.w,
        itemCount: userController.usersCourses.length,
        itemBuilder: (context, index) {
          return itemWidget(userController.usersCourses[index]);
        },
      );
    });
  }

  Widget itemWidget(UserCourseModel course) {
    return InkWell(
      onTap: () {
        GetControllers.instance
            .getEnrolledCourseViewScreenController()
            .setData(course.courseId!);
        Get.to(() => EnrolledCourseViewScreen());
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.lightBlueAccent)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(8.r),
              ),
              child: CachedNetworkImage(
                imageUrl: course.courseBanner!,
                placeholder: (context, url) {
                  return Container(
                    width: 200.w,
                    height: 90.h,
                    color: AppColors.lightGray,
                  );
                },
                errorWidget: (context, url, error) {
                  return Container(
                    width: 200.w,
                    height: 90.h,
                    color: AppColors.lightGray,
                  );
                },
                width: 200.w,
                height: 90.h,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
              child: Text(
                course.courseName!,
                textAlign: TextAlign.start,
                style: AppTextStyles.title,
                maxLines: 2,
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
