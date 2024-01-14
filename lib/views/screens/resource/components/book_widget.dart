import 'package:get/get.dart';
import 'package:lexam/controllers/get_controllers.dart';
import 'package:lexam/controllers/resource_screen_controller.dart';
import 'package:lexam/models/books_model.dart';
import 'package:lexam/views/screens/books/books_screen.dart';
import 'package:lexam/views/screens/pdf_view/pdf_view_screen.dart';
import 'package:lexam/views/widgets/floating_widget.dart';
import 'package:lexam/lexam.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class BookWidget extends StatelessWidget {
  BookWidget({
    Key? key,
  }) : super(key: key);
  final ResourceScreenController controller =
      GetControllers.instance.getResourceScreenController();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.books.isEmpty) {
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
                  'বই',
                  style: AppTextStyles.widgetTitle,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => BooksScreen());
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
              crossAxisCount: 2,
              mainAxisSpacing: 10.h,
              crossAxisSpacing: 10.w,
              itemCount:
                  controller.books.length <= 4 ? controller.books.length : 4,
              itemBuilder: (context, index) {
                return itemWidget(controller.books[index]);
              },
            ),
          ],
        ),
      );
    });
  }

  Widget itemWidget(Book book) {
    return InkWell(
      onTap: () {
        Get.to(() => PdfViewScreen(
              name: book.bookName.toString(),
              url: book.fileUrl.toString(),
            ));
      },
      child: FloatingWidget(
        alignment: Alignment.centerLeft,
        floatingChild: Container(
          margin: EdgeInsets.only(bottom: 16.h),
          child: SvgPicture.asset(
            AppIcons.book,
            width: 34.h,
            height: 34.h,
          ),
        ),
        floatingBody: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '',
                    textAlign: TextAlign.end,
                    style: AppTextStyles.body
                        .copyWith(color: AppColors.blueAccent, fontSize: 1),
                  ),
                ),
                Text(
                  book.bookName.toString(),
                  style: AppTextStyles.title,
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                ),
                Text(
                  book.writerName.toString(),
                  style: AppTextStyles.body.copyWith(color: AppColors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
