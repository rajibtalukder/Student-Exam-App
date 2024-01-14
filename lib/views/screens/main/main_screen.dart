import 'package:lexam/lexam.dart';
import 'package:lexam/controllers/main_screen_controller.dart';
import 'package:lexam/controllers/get_controllers.dart';
import 'package:get/get.dart';
import 'package:lexam/views/screens/home/home_screen.dart';
import 'package:lexam/views/screens/practice/practice_screen.dart';
import 'package:lexam/views/screens/profile/profile_screen.dart';
import 'package:lexam/views/screens/resource/resource_screen.dart';
import 'package:lexam/views/widgets/custom_bottom_navigation_bar.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final MainScreenController controller =
      GetControllers.instance.getMainScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarStyles.white,
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller.navController.pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return HomeScreen();
                  case 1:
                    return PracticeScreen();
                  case 2:
                    return ResourceScreen();
                  case 3:
                    return ProfileScreen();
                  default:
                    return const Placeholder();
                }
              },
            ),
          ),
          navigationBarWidget(),
        ],
      ),
    );
  }

  CustomBottomNavigationBar navigationBarWidget() {
    return CustomBottomNavigationBar(
      controller: controller.navController,
      backgroundColor: AppColors.white,
      height: 80.h,
      items: [
        CustomBNBItem(
          icon: AppIcons.homeFill,
          inactiveIcon: AppIcons.home,
          title: 'হোম',
        ),
        CustomBNBItem(
          icon: AppIcons.practiceFill,
          inactiveIcon: AppIcons.practice,
          title: 'প্র্যাক্টিস',
        ),
        CustomBNBItem(
          icon: AppIcons.resourceFill,
          inactiveIcon: AppIcons.resource,
          title: 'রিসোর্স',
        ),
        CustomBNBItem(
          icon: AppIcons.profileFill,
          inactiveIcon: AppIcons.profile,
          title: 'প্রোফাইল',
        ),
      ],
      activeStyle: (item) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                item.icon,
                width: 28.h,
                height: 28.h,
              ),
              SizedBox(height: 4.h),
              Text(item.title, style: AppTextStyles.navBarActive),
            ],
          ),
        );
      },
      inactiveStyle: (item) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                item.inactiveIcon,
                width: 28.h,
                height: 28.h,
              ),
              SizedBox(height: 4.h),
              Text(item.title, style: AppTextStyles.navBarInactive),
            ],
          ),
        );
      },
    );
  }
}
