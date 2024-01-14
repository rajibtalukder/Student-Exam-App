import 'package:lexam/lexam.dart';
import 'package:lexam/controllers/authentication_screen_controller.dart';
import 'package:lexam/controllers/get_controllers.dart';

class RegisterWidget extends StatelessWidget {
  RegisterWidget({Key? key}) : super(key: key);

  final AuthenticationScreenController controller =
      GetControllers.instance.getAuthenticationScreenController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Column(
        children: [
          SizedBox(height: 10.h),
          Form(
            key: controller.regFormKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.w),
              child: Column(
                children: [
                  AppTextFieldStyles.text(
                    hint: 'Name',
                    controller: controller.regNameController,
                  ),
                  SizedBox(height: 16.h),
                  AppTextFieldStyles.email(
                    hint: 'Email',
                    controller: controller.regEmailController,
                  ),
                  SizedBox(height: 16.h),
                  AppTextFieldStyles.number(
                    hint: 'Number',
                    controller: controller.regNumberController,
                  ),
                  SizedBox(height: 16.h),
                  AppTextFieldStyles.dob(
                    hint: 'Date of Birth',
                    controller: controller.regDobController,
                  ),
                  SizedBox(height: 16.h),
                  AppTextFieldStyles.password(
                    hint: 'Password',
                    controller: controller.regPasswordController,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24.h),
          InkWell(
            onTap: () {
              controller.createAccount();
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
          SizedBox(height: 16.h),
          // orWidget(),
          // SizedBox(height: 16.h),
          // facebookAndGoogleWidget(),
          SizedBox(height: 16.h),
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
