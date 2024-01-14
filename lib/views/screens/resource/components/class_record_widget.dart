
import 'package:lexam/views/widgets/floating_widget.dart';
import 'package:lexam/lexam.dart';

class ClassRecordWidget extends StatelessWidget {
  const ClassRecordWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 14.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'ক্লাস রেকর্ড',
                style: AppTextStyles.widgetTitle,
              ),
              InkWell(
                onTap: (){
                  // Navigator.pushNamed(
                  //     context, CustomRoute.classRecordingsScreen);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'আরো দেখুন',
                      style: AppTextStyles.widgetOption,
                    ),
                    SvgPicture.asset(
                      AppIcons.forwardArrow,
                      width: 12.h,
                      height: 12.h,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        itemWidget(),
        SizedBox(height: 16.h),
        itemWidget(),
      ],
    );
  }

  Widget itemWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: FloatingWidget(
        alignment: Alignment.centerLeft,
        floatingChild: Container(
          margin: EdgeInsets.only(bottom: 10.h),
          child: SvgPicture.asset(
            AppIcons.video,
            width: 44.h,
            height: 44.h,
          ),
        ),
        floatingBody: Container(
          height: 80.h,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Row(
            children: [
              SizedBox(width:16.w),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ক্লাসের নাম',
                    style: AppTextStyles.title,
                  ),

                  Text(
                    'মোঃ গোলাম কিবরিয়া',
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.black
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'বিষয়ঃ বাংলা',
                    style: AppTextStyles.body,
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Spacer(),
                  Text('18 : 36',style: AppTextStyles.widgetTitle.copyWith(
                    color: AppColors.blueAccent,
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp,

                  )),
                  const Spacer(),
                  Text(
                    '9 February, 2023',
                    style: AppTextStyles.body,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
