import 'package:lexam/lexam.dart';

class NoInternetDialog extends StatelessWidget {
  final Function onPressed;

  const NoInternetDialog({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.r),
        color: AppColors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.portable_wifi_off, size: 38.h, color: AppColors.black),
          SizedBox(height: 5.h),
          Text(
            'Device Offline',
            style: AppTextStyles.title.copyWith(
              fontSize: 20.sp,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'Your device has no internet \nconnection, please check your \ninternet connection.',
            textAlign: TextAlign.center,
            style: AppTextStyles.title.copyWith(
              fontSize: 14.sp,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 24.h),
          InkWell(
            onTap: () {
              onPressed();
            },
            child: Container(
              height: 50.h,
              width: AppSize.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.blue,
              ),
              alignment: Alignment.center,
              child: Text(
                'Try Again',
                style: AppTextStyles.title.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
