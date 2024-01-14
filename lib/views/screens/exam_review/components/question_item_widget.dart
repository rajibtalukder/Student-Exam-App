import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lexam/extensions/bn_word_extension.dart';
import 'package:lexam/lexam.dart';
import 'package:lexam/models/question_model.dart';

class QuestionItemWidget extends StatefulWidget {
  final QuestionModel question;
  final int index;
  final bool onlyQuestion;

  const QuestionItemWidget({
    Key? key,
    this.index = 0,
    required this.question,
    required this.onlyQuestion,
  }) : super(key: key);

  @override
  State<QuestionItemWidget> createState() => _QuestionItemWidgetState();
}

class _QuestionItemWidgetState extends State<QuestionItemWidget> {

  bool showAns = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 46.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${(widget.index + 1).toString().enNumToBeNum}।  '),
              questionContentWidget(widget.question.ques),
              SizedBox(width: 16.w),
              getStatueWidget(),
            ],
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: AlignedGridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 10.h,
              crossAxisSpacing: 10.w,
              itemCount: widget.question.option!.length,
              itemBuilder: (context, index) {
                return optionContentWidget(widget.question.option![index]);
              },
            ),
          ),
          SizedBox(height: 24.h),
          InkWell(
             onTap: (){
                setState(() {
                  showAns=!showAns;
                });
             },
            child: Container(
              height: 20.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.r),
                color: AppColors.black.withOpacity(0.4),
              ),
              child: Center(
                child: Text(
                  'উত্তর দেখুন',
                  style: TextStyle(fontSize: 12.sp, color: AppColors.white),
                ),
              ),
            ),
          ),
         showAns? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 10.h),
              Text('উত্তরঃ   ${widget.question.option![widget.question.ans!].data}',
                  style: AppTextStyles.textFieldStyle.copyWith(
                      color: AppColors.green)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ব্যাখ্যাঃ  ',
                      style: AppTextStyles.textFieldStyle.copyWith(
                          color: AppColors.gray, fontStyle: FontStyle.italic)),
                  explanationContentWidget(),
                ],
              ),
            ],
          ): const SizedBox(),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }

  Widget questionContentWidget(Ques? ques) {
    if (ques!.type == Type.IMAGE) {
      return Expanded(
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.h),
            child: CachedNetworkImage(
              imageUrl: ques.data!,
              width: 130.w,
              height: 130.h,
              fit: BoxFit.cover,
              placeholder: (context, url) {
                return Container(
                  width: 130.w,
                  height: 130.h,
                  decoration: BoxDecoration(
                      color: AppColors.lightGray,
                      borderRadius: BorderRadius.circular(8.r)),
                );
              },
              errorWidget: (context, url, error) {
                return Container(
                  width: 130.w,
                  height: 130.h,
                  decoration: BoxDecoration(
                      color: AppColors.lightGray,
                      borderRadius: BorderRadius.circular(8.r)),
                );
              },
            ),
          ),
        ),
      );
    }
    return Expanded(
      child: Text(
        ques.data!,
        style: AppTextStyles.textFieldStyle,
      ),
    );
  }

  Widget optionContentWidget(Option option) {
    if (option.type == Type.IMAGE) {
      return Expanded(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: getOptionColor(option, true),
              width: 2.w,
            ),
          ),
          clipBehavior: Clip.hardEdge,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CachedNetworkImage(
              imageUrl: option.data!,
              width: 130.w,
              height: 130.h,
              fit: BoxFit.cover,
              placeholder: (context, url) {
                return Container(
                  width: 130.w,
                  height: 130.h,
                  decoration: BoxDecoration(
                      color: AppColors.lightGray,
                      borderRadius: BorderRadius.circular(8.r)),
                );
              },
              errorWidget: (context, url, error) {
                return Container(
                  width: 130.w,
                  height: 130.h,
                  decoration: BoxDecoration(
                      color: AppColors.lightGray,
                      borderRadius: BorderRadius.circular(8.r)),
                );
              },
            ),
          ),
        ),
      );
    }
    return Text(
      '${(option.index! +1.toInt()).toString().enNumToBeWord}. ${option.data}',
      style: AppTextStyles.textFieldStyle.copyWith(
        color: getOptionColor(option, false),
      ),
    );
  }

  Widget explanationContentWidget() {
    if (widget.question.explanation!.type == Type.IMAGE) {
      return Expanded(
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.h),
            child: CachedNetworkImage(
              imageUrl:
                  'https://lexam.adminpanel.soykothosen.com/ques_image/1681657752447q.jpeg',
              width: 130.w,
              height: 130.h,
              fit: BoxFit.cover,
              placeholder: (context, url) {
                return Container(
                  width: 130.w,
                  height: 130.h,
                  decoration: BoxDecoration(
                      color: AppColors.lightGray,
                      borderRadius: BorderRadius.circular(8.r)),
                );
              },
              errorWidget: (context, url, error) {
                return Container(
                  width: 130.w,
                  height: 130.h,
                  decoration: BoxDecoration(
                      color: AppColors.lightGray,
                      borderRadius: BorderRadius.circular(8.r)),
                );
              },
            ),
          ),
        ),
      );
    }
    return Expanded(
      child: Text(widget.question.explanation!.data.toString(),
          style: AppTextStyles.textFieldStyle
              .copyWith(color: AppColors.gray, fontStyle: FontStyle.italic)),
    );
  }

  Color getOptionColor(Option option, bool isImage) {
    if (isImage) {
      if (widget.question.ans! == option.index) {
        return AppColors.transparent;
      } else {
        if (widget.question.selectedAnsIndex == option.index) {
          return AppColors.red;
        } else {
          return AppColors.transparent;
        }
      }
    } else {
      if (widget.question.ans! == option.index) {
        return AppColors.black;
      } else {
        if (widget.question.selectedAnsIndex == option.index) {
          return AppColors.red;
        } else {
          return AppColors.black;
        }
      }
    }
  }

  Widget getStatueWidget() {
    if (widget.question.selectedAnsIndex != null) {
      if (widget.question.selectedAnsIndex == widget.question.ans) {
        return Text(
          'সঠিক',
          style: AppTextStyles.textFieldStyle.copyWith(color: AppColors.green),
        );
      } else {
        return Text(
          'ভুল',
          style: AppTextStyles.textFieldStyle.copyWith(color: AppColors.red),
        );
      }
    } else {
      if (widget.onlyQuestion) {
        return Container();
      } else {
        return Text(
          'অনুুত্তরিত',
          style: AppTextStyles.textFieldStyle.copyWith(color: AppColors.gray),
        );
      }
    }
  }
}
