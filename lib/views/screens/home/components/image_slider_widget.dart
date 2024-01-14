import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:lexam/controllers/get_controllers.dart';
import 'package:lexam/controllers/home_screen_controller.dart';
import 'package:lexam/views/widgets/custom_images.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:lexam/lexam.dart';

class ImageSliderWidget extends StatelessWidget {
  ImageSliderWidget({Key? key}) : super(key: key);

  final carouselController = CarouselController();
  final ValueNotifier<int> currentIndex = ValueNotifier(0);

  final HomeScreenController controller =
      GetControllers.instance.getHomeScreenController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      child: Obx(() {
        return Column(
          children: [
            CarouselSlider.builder(
              options: CarouselOptions(
                height: 100.h,
                viewportFraction: 0.7,
                initialPage: 0,
                enableInfiniteScroll: true,
                autoPlay: false,
                onPageChanged: (index, reason) {
                  currentIndex.value = index;
                },
              ),
              carouselController: carouselController,
              itemCount:
                  controller.banners.isNotEmpty ? controller.banners.length : 3,
              itemBuilder: (context, index, realIndex) {
                if (controller.banners.isEmpty) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                    decoration: BoxDecoration(
                        color: AppColors.lightGray,
                        borderRadius: BorderRadius.circular(8.r)),
                  );
                }
                return CustomImages.normal(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  source: controller.banners[index].image.toString(),
                );
              },
            ),
            SizedBox(height: 12.h),
            ValueListenableBuilder(
              valueListenable: currentIndex,
              builder: (context, value, child) {
                return AnimatedSmoothIndicator(
                  count: controller.banners.isNotEmpty
                      ? controller.banners.length
                      : 3,
                  onDotClicked: (index) {
                    carouselController.jumpToPage(index);
                  },
                  effect: WormEffect(
                    activeDotColor: AppColors.blue,
                    dotColor: AppColors.blueAccent,
                    dotHeight: 8.h,
                    dotWidth: 8.h,
                  ),
                  activeIndex: value,
                );
              },
            ),
          ],
        );
      }),
    );
  }
}
