import 'package:get/get.dart';
import 'package:lexam/controllers/buy_package_screen_controller.dart';
import 'package:lexam/controllers/free_trial_duration_controller.dart';
import 'package:lexam/views/screens/buy_package/buy_package_screen.dart';
import 'check_result_screen_controller.dart';
import 'enrolled_course_view_screen_controller.dart';
import 'exam_screen_controller.dart';
import 'exercise_view_screen_controller.dart';
import 'exam_menu_screen_controller.dart';
import 'exam_review_screen_controller.dart';
import 'main_screen_controller.dart';
import 'exam_complete_screen_controller.dart';
import 'video_view_screen_controller.dart';
import 'filter_screen_controller.dart';
import 'authentication_screen_controller.dart';
import 'loading_controller.dart';
import 'buy_course_screen_controller.dart';
import 'exam_controller.dart';
import 'practice_screen_controller.dart';
import 'user_controller.dart';
import 'profile_screen_controller.dart';
import 'live_exam_intro_screen_controller.dart';
import 'books_screen_controller.dart';
import 'home_screen_controller.dart';
import 'edit_profile_screen_controller.dart';
import 'pdf_view_screen_controller.dart';
import 'resource_screen_controller.dart';
import 'course_detail_screen_controller.dart';
import 'courses_screen_controller.dart';
import 'notes_screen_controller.dart';


class GetControllers {
  static final GetControllers _singleton = GetControllers._internal();

  GetControllers._internal();

  static GetControllers get instance => _singleton;

  
  EnrolledCourseViewScreenController getEnrolledCourseViewScreenController() {
    if (!Get.isRegistered<EnrolledCourseViewScreenController>()) {
      Get.put(EnrolledCourseViewScreenController());
    }
    return Get.find<EnrolledCourseViewScreenController>();
  }
          
  ExamScreenController getExamScreenController() {
    if (!Get.isRegistered<ExamScreenController>()) {
      Get.put(ExamScreenController());
    }
    return Get.find<ExamScreenController>();
  }
          
  ExerciseViewScreenController getExerciseViewScreenController() {
    if (!Get.isRegistered<ExerciseViewScreenController>()) {
      Get.put(ExerciseViewScreenController());
    }
    return Get.find<ExerciseViewScreenController>();
  }
          
  ExamMenuScreenController getExamMenuScreenController() {
    if (!Get.isRegistered<ExamMenuScreenController>()) {
      Get.put(ExamMenuScreenController());
    }
    return Get.find<ExamMenuScreenController>();
  }
          
  ExamReviewScreenController getExamReviewScreenController() {
    if (!Get.isRegistered<ExamReviewScreenController>()) {
      Get.put(ExamReviewScreenController());
    }
    return Get.find<ExamReviewScreenController>();
  }
          
  MainScreenController getMainScreenController() {
    if (!Get.isRegistered<MainScreenController>()) {
      Get.put(MainScreenController());
    }
    return Get.find<MainScreenController>();
  }
          
  ExamCompleteScreenController getExamCompleteScreenController() {
    if (!Get.isRegistered<ExamCompleteScreenController>()) {
      Get.put(ExamCompleteScreenController());
    }
    return Get.find<ExamCompleteScreenController>();
  }
          
  VideoViewScreenController getVideoViewScreenController() {
    if (!Get.isRegistered<VideoViewScreenController>()) {
      Get.put(VideoViewScreenController());
    }
    return Get.find<VideoViewScreenController>();
  }
          
  FilterScreenController getFilterScreenController() {
    if (!Get.isRegistered<FilterScreenController>()) {
      Get.put(FilterScreenController());
    }
    return Get.find<FilterScreenController>();
  }
          
  AuthenticationScreenController getAuthenticationScreenController() {
    if (!Get.isRegistered<AuthenticationScreenController>()) {
      Get.put(AuthenticationScreenController());
    }
    return Get.find<AuthenticationScreenController>();
  }
          
  LoadingController getLoadingController() {
    if (!Get.isRegistered<LoadingController>()) {
      Get.put(LoadingController());
    }
    return Get.find<LoadingController>();
  }
          
  BuyCourseScreenController getBuyCourseScreenController() {
    if (!Get.isRegistered<BuyCourseScreenController>()) {
      Get.put(BuyCourseScreenController());
    }
    return Get.find<BuyCourseScreenController>();
  }

  BuyPackageScreenController getBuyPackageScreenController() {
    if (!Get.isRegistered<BuyPackageScreenController>()) {
      Get.put(BuyPackageScreenController());
    }
    return Get.find<BuyPackageScreenController>();
  }
          
  ExamController getExamController() {
    if (!Get.isRegistered<ExamController>()) {
      Get.put(ExamController());
    }
    return Get.find<ExamController>();
  }
          
  PracticeScreenController getPracticeScreenController() {
    if (!Get.isRegistered<PracticeScreenController>()) {
      Get.put(PracticeScreenController());
    }
    return Get.find<PracticeScreenController>();
  }
          
  UserController getUserController() {
    if (!Get.isRegistered<UserController>()) {
      Get.put(UserController());
    }
    return Get.find<UserController>();
  }
          
  ProfileScreenController getProfileScreenController() {
    if (!Get.isRegistered<ProfileScreenController>()) {
      Get.put(ProfileScreenController());
    }
    return Get.find<ProfileScreenController>();
  }
          
  LiveExamIntroScreenController getLiveExamIntroScreenController() {
    if (!Get.isRegistered<LiveExamIntroScreenController>()) {
      Get.put(LiveExamIntroScreenController());
    }
    return Get.find<LiveExamIntroScreenController>();
  }
          
  BooksScreenController getBooksScreenController() {
    if (!Get.isRegistered<BooksScreenController>()) {
      Get.put(BooksScreenController());
    }
    return Get.find<BooksScreenController>();
  }
          
  HomeScreenController getHomeScreenController() {
    if (!Get.isRegistered<HomeScreenController>()) {
      Get.put(HomeScreenController());
    }
    return Get.find<HomeScreenController>();
  }
          
  EditProfileScreenController getEditProfileScreenController() {
    if (!Get.isRegistered<EditProfileScreenController>()) {
      Get.put(EditProfileScreenController());
    }
    return Get.find<EditProfileScreenController>();
  }
          
  PdfViewScreenController getPdfViewScreenController() {
    if (!Get.isRegistered<PdfViewScreenController>()) {
      Get.put(PdfViewScreenController());
    }
    return Get.find<PdfViewScreenController>();
  }
          
  ResourceScreenController getResourceScreenController() {
    if (!Get.isRegistered<ResourceScreenController>()) {
      Get.put(ResourceScreenController());
    }
    return Get.find<ResourceScreenController>();
  }
          
  CourseDetailScreenController getCourseDetailScreenController() {
    if (!Get.isRegistered<CourseDetailScreenController>()) {
      Get.put(CourseDetailScreenController());
    }
    return Get.find<CourseDetailScreenController>();
  }
          
  CoursesScreenController getCoursesScreenController() {
    if (!Get.isRegistered<CoursesScreenController>()) {
      Get.put(CoursesScreenController());
    }
    return Get.find<CoursesScreenController>();
  }
          
  NotesScreenController getNotesScreenController() {
    if (!Get.isRegistered<NotesScreenController>()) {
      Get.put(NotesScreenController());
    }
    return Get.find<NotesScreenController>();
  }

  CheckResultScreenController getCheckResultController() {
    if (!Get.isRegistered<CheckResultScreenController>()) {
      Get.put(CheckResultScreenController());
    }
    return Get.find<CheckResultScreenController>();
  }

  FreeTrialDurationController getFreeTrialDurationController() {
    if (!Get.isRegistered<FreeTrialDurationController>()) {
      Get.put(FreeTrialDurationController());
    }
    return Get.find<FreeTrialDurationController>();
  }
          
  
}
    