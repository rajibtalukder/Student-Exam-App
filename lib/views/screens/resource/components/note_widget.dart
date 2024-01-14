import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:lexam/models/notes_model.dart';
import 'package:lexam/views/screens/notes/notes_screen.dart';
import 'package:lexam/views/screens/pdf_view/pdf_view_screen.dart';
import 'package:lexam/views/widgets/floating_widget.dart';
import 'package:lexam/lexam.dart';

import '../../../../controllers/get_controllers.dart';
import '../../../../controllers/resource_screen_controller.dart';

class NoteWidget extends StatelessWidget {
  NoteWidget({
    Key? key,
  }) : super(key: key);
  final ResourceScreenController controller =
      GetControllers.instance.getResourceScreenController();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.notes.isEmpty) {
        return Container();
      }

      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 14.w,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'রুটিন',
                  style: AppTextStyles.widgetTitle,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => NotesScreen());
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
            SizedBox(height: 10.h),
            AlignedGridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 1,
              mainAxisSpacing: 10.h,
              crossAxisSpacing: 10.w,
              itemCount:
                  controller.notes.length <= 4 ? controller.notes.length : 4,
              itemBuilder: (context, index) {
                return itemWidget(controller.notes[index]);
              },
            ),
          ],
        ),
      );
    });
  }

  Widget itemWidget(Note note) {
    return InkWell(
      onTap: () {
        Get.to(() => PdfViewScreen(
              name: note.noteName.toString(),
              url: note.noteFileUrl.toString(),
            ));
      },
      child: FloatingWidget(
        alignment: Alignment.centerLeft,
        floatingChild: SvgPicture.asset(
          AppIcons.file,
          width: 38.h,
          height: 38.h,
        ),
        floatingBody: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Row(
            children: [
              SizedBox(width: 16.w),
              Text(
                note.noteId.toString(),
                style: AppTextStyles.title,
                maxLines: 2,
                overflow: TextOverflow.clip,
              ),
              const Spacer(),
              RotatedBox(
                quarterTurns: 50,
                child: SvgPicture.asset(
                  AppIcons.backArrow,
                  width: 24.h,
                  height: 24.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
