import 'package:flick_video_player/flick_video_player.dart';
import 'package:lexam/controllers/course_detail_screen_controller.dart';
import 'package:lexam/controllers/get_controllers.dart';
import 'package:lexam/lexam.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class PromoViewWidget extends StatefulWidget {
  const PromoViewWidget({Key? key}) : super(key: key);

  @override
  State<PromoViewWidget> createState() => _PromoViewWidgetState();
}

class _PromoViewWidgetState extends State<PromoViewWidget> {
  late FlickManager flickManager;

  final CourseDetailScreenController controller =
      GetControllers.instance.getCourseDetailScreenController();

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(
        controller.courseDetail.courseVideo![0].courseVideoLink!,
      ),
      autoPlay: false,
      autoInitialize: true,
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'প্রোমো ভিডিও',
          style: AppTextStyles.widgetTitle,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 8.h,
          ),
          height: 160.h,
          child: VisibilityDetector(
            key: ObjectKey(flickManager),
            onVisibilityChanged: (visibility) {
              // if (visibility.visibleFraction == 0 && mounted) {
              //   flickManager.flickControlManager?.autoPause();
              // } else if (visibility.visibleFraction == 1) {
              //   flickManager.flickControlManager?.autoResume();
              // }
            },
            child: ClipRRect(
              borderRadius: BorderRadiusDirectional.circular(8.r),
              child: Theme(
                data: ThemeData(
                  primaryColor: AppColors.blue,
                  progressIndicatorTheme:
                      ProgressIndicatorThemeData(color: AppColors.blue),
                ),
                child: FlickVideoPlayer(
                  flickManager: flickManager,
                  flickVideoWithControlsFullscreen:
                      const FlickVideoWithControls(
                    controls: FlickLandscapeControls(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
