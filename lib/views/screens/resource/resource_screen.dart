import 'package:lexam/lexam.dart';
import 'package:lexam/controllers/resource_screen_controller.dart';
import 'package:lexam/controllers/get_controllers.dart';
import 'package:lexam/views/widgets/common_header_widget.dart';
import 'components/book_widget.dart';
import 'components/note_widget.dart';
  
class ResourceScreen extends StatelessWidget {
  ResourceScreen({Key? key}) : super(key: key);
  
  final ResourceScreenController controller =
      GetControllers.instance.getResourceScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarStyles.white,
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 16.h),
            const CommonHeaderWidget(),
            SizedBox(height: 20.h),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                color: AppColors.lightBlueAccent,
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    // SizedBox(height: 16.h),
                    // ClassRecordWidget(),
                    SizedBox(height: 24.h),
                    BookWidget(),
                    SizedBox(height: 24.h),
                    NoteWidget(),
                    SizedBox(height: 24.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: GestureDetector(
                        onTap: (){
                          controller.openUrl();
                        },
                        child: Image.asset(
                          'assets/images/youtube.png',
                          width: double.infinity,
                          height: 100.h,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    // GradientButton(
                    //   name: 'অন্যান্য',
                    //   onPressed: () {},
                    // ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

  