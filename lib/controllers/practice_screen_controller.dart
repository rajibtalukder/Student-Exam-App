import 'package:lexam/controllers/get_controllers.dart';
import 'package:lexam/lexam.dart';
import 'package:get/get.dart';

class PracticeScreenController extends GetxController {
  final examController = GetControllers.instance.getExamController();
  final subjectWiseExamScreenController =
      GetControllers.instance.getExamMenuScreenController();

  @override
  void onReady() async {
    examController.getLiveTypes();
    super.onReady();
  }
}
