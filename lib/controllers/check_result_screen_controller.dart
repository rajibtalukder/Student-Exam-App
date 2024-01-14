import 'package:get/get.dart';

import '../lexam.dart';
import '../models/check_result_model.dart';
import '../services/core_service.dart';


class CheckResultScreenController extends GetxController{

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
  }

  RxList<ExamResult> checkResultList = RxList([]);
  RxBool isLoading = false.obs;

  Future<void> getFavQuestions(int examId) async {
    try {
      isLoading.value = true;
      final response = await CoreService().getRequest(
          url: '$checkResultGetUrl?exam_id=$examId');
      checkResultList.value = CheckResultModel.fromJson(response.body).data.examResult;
      isLoading.value = false;
      update(['updateCheckResult']);
    } catch (error) {
      debugPrint("Error: ${error.toString()}");
    }
  }

}