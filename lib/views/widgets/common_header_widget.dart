import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lexam/lexam.dart';
import 'package:marquee/marquee.dart';

import '../../controllers/get_controllers.dart';
import '../../controllers/home_screen_controller.dart';

class CommonHeaderWidget extends StatelessWidget {
  final bool showNews;

  const CommonHeaderWidget({Key? key, this.showNews = false}) : super(key: key);

  static HomeScreenController controller =
      GetControllers.instance.getHomeScreenController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                AppLogos.logo,
                width: 50.w,
                height: 45.h,
              ),
              // SvgPicture.asset(
              //   AppIcons.notification,
              //   width: 24.h,
              //   height: 24.h,
              // ),
            ],
          ),
          newsWidget(),
        ],
      ),
    );
  }

  Widget newsWidget() {
    if (showNews == false) {
      return Container();
    }
    return Obx(
      () => Container(
        margin: EdgeInsets.only(top: 18.h),
        height: 36.h,
        decoration: BoxDecoration(
          color: AppColors.lightBlueAccent,
          borderRadius: BorderRadius.circular(4.r),
        ),
        alignment: Alignment.center,
        child: controller.breakingNews.isEmpty
            ? const SizedBox()
            : SizedBox(
                height: 16.h,
                child: Marquee(
                  text: controller.breakingNews[0].breakingNews,
                  //'আমাদের সার্ভিস সম্পর্কে জানতে কল করুন ০১৭০০০০ ০০০০',
                  style: AppTextStyles.searchWidget
                      .copyWith(color: AppColors.blue),
                  scrollAxis: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  blankSpace: 40.0.w,
                  pauseAfterRound: const Duration(seconds: 0),
                  accelerationCurve: Curves.linear,
                  decelerationCurve: Curves.easeOut,
                ),
              ),
      ),
    );
  }

  Widget searchWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.lightBlueAccent,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            AppIcons.search,
            width: 24.h,
            height: 24.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12.w),
            color: AppColors.blueAccent,
            height: 21.h,
            width: 1.5.w,
          ),
          Expanded(
              child: TextFormField(
            readOnly: true,
            decoration: InputDecoration.collapsed(
              hintText: 'অনুসন্ধান করুন',
              hintStyle: AppTextStyles.searchWidget,
            ),
            style: AppTextStyles.searchWidget.copyWith(color: AppColors.blue),
          )),
        ],
      ),
    );
  }
}
