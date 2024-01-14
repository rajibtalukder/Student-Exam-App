import 'package:lexam/lexam.dart';
import 'package:get/get.dart';
import 'package:lexam/models/chapter_model.dart';
import 'package:lexam/models/question_model.dart';
import 'package:lexam/models/subject_model.dart';
import 'package:lexam/services/core_service.dart';

class ExerciseViewScreenController extends GetxController {
  RxBool loading = RxBool(true);
  RxString name = RxString('');
  RxString subject = RxString('');

  RxList<QuestionModel> questions = RxList([]);

  setData(String subjectName, String chapterName, url) async {
    name.value = chapterName;
    subject.value = subjectName;
    await getQuestions(url);
    loading.value = false;
    update();
  }

  Future getQuestions(url) async {

    try {
      questions.value = [];
      final response = await CoreService().getRequest(url: url);
      final data = response.body as List;
      data.shuffle();

      for (int index = 0; index < data.length; index++) {
        final item = QuestionModel.fromMap(data[index]);
        questions.add(item);

      }
    } catch (error) {
      debugPrint("Error:- ${error.toString()}");
    }
  }
}
