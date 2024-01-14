import 'package:get/get.dart';
import 'package:lexam/controllers/authentication_screen_controller.dart';
import 'package:lexam/controllers/get_controllers.dart';
import 'package:lexam/lexam.dart';
import 'package:lexam/views/screens/authentication/forget_screen.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({Key? key}) : super(key: key);

  final AuthenticationScreenController controller =
      GetControllers.instance.getAuthenticationScreenController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 34.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.w),
            child: Form(
              key: controller.logFormKey,
              child: Column(
                children: [
                  AppTextFieldStyles.number(
                      hint: 'Number',
                      controller: controller.logNumberController),
                  SizedBox(height: 24.h),
                  AppTextFieldStyles.password(
                      hint: 'Password',
                      controller: controller.logPasswordController),
                  SizedBox(height: 16.h),
                  GestureDetector(
                    onTap: (){
                      Get.to(ForgetScreen());
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forget password?',
                        style: AppTextStyles.title
                            .copyWith(color: AppColors.lightBlue),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24.h),

          InkWell(
            onTap: () {
              controller.login();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 12.w),
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(2.r),
              ),
              child: RotatedBox(
                quarterTurns: 2,
                child: SvgPicture.asset(
                  AppIcons.backArrow,
                  color: Colors.white,
                  width: 24.h,
                  height: 24.h,
                ),
              ),
            ),
          ),
          SizedBox(height: 24.h),
          // orWidget(),
          // SizedBox(height: 24.h),
          // facebookAndGoogleWidget(),
          SizedBox(height: 24.h),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'By signing in, you agree to the ',
                style: AppTextStyles.body,
                children: [
                  TextSpan(
                    text: 'Terms and Conditions',
                    style:
                        AppTextStyles.body.copyWith(color: AppColors.lightBlue),
                  ),
                  TextSpan(
                    text: ',\n',
                    style: AppTextStyles.body,
                  ),
                  TextSpan(
                    text: 'User Agreement',
                    style:
                        AppTextStyles.body.copyWith(color: AppColors.lightBlue),
                  ),
                  TextSpan(
                    text: ' and ',
                    style: AppTextStyles.body,
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    style:
                        AppTextStyles.body.copyWith(color: AppColors.lightBlue),
                  ),
                ]),
          ),
        ],
      ),
    );
  }

  Widget orWidget() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 40.w,
          height: 1.h,
          color: AppColors.blueAccent,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            'Or',
            style: AppTextStyles.title.copyWith(color: AppColors.blueAccent),
          ),
        ),
        Container(
          width: 40.w,
          height: 1.h,
          color: AppColors.blueAccent,
        ),
      ],
    );
  }

  Widget facebookAndGoogleWidget() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          AppIcons.facebookLogo,
          width: 35.h,
          height: 35.h,
        ),
        SizedBox(width: 16.w),
        SvgPicture.asset(
          AppIcons.googleLogo,
          width: 35.h,
          height: 35.h,
        ),
      ],
    );
  }
}
