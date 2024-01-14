import 'package:lexam/controllers/home_screen_controller.dart';
import 'package:lexam/lexam.dart';
import 'package:get/get.dart';
import 'package:lexam/models/books_model.dart';
import 'package:lexam/services/core_service.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/notes_model.dart';
import 'get_controllers.dart';

class ResourceScreenController extends GetxController {
  RxList<Book> books = RxList([]);
  RxList<Note> notes = RxList([]);
  final HomeScreenController homeController =
  GetControllers.instance.getHomeScreenController();

  @override
  void onReady() async {
    getData();
    super.onReady();
  }

  void getData() async {
    try {
      final booksResponse = await CoreService().getRequest(url: bookUrl);
      final booksModel = BooksModel.fromMap(booksResponse.body);
      books.addAll(booksModel.books!);
      final notesResponse = await CoreService().getRequest(url: noteUrl);
      final notesModel = NotesModel.fromMap(notesResponse.body);
      notes.addAll(notesModel.notes!);
      books.refresh();
      notes.refresh();
    } catch (error) {
      debugPrint("Error:- ${error.toString()}");
    }
  }

  void openUrl() async {
    String url = homeController.breakingNews[0].youtubePlayList;

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}
