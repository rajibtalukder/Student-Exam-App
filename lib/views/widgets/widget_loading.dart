import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lexam/controllers/get_controllers.dart';
import 'package:lexam/controllers/loading_controller.dart';
import 'package:lexam/lexam.dart';

class WidgetLoading extends StatelessWidget {
  final Widget child;
  final RxBool loading;

  const WidgetLoading({Key? key, required this.child, required this.loading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (loading.isTrue) {
        return Center(
          child: CupertinoActivityIndicator(
            color: AppColors.blue,
          ),
        );
      } else {
        return child;
      }
    });
  }
}
