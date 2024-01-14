import 'package:get/get.dart';
import 'package:lexam/controllers/get_controllers.dart';
import 'package:lexam/lexam.dart';
import 'package:lexam/views/screens/authentication/authentication_screen.dart';
import 'package:lexam/views/screens/main/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetControllers.instance.getUserController().getUserData();
  runApp(Lexam());
}

class Lexam extends StatelessWidget {
  Lexam({Key? key}) : super(key: key);

  final userController = GetControllers.instance.getUserController();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      useInheritedMediaQuery: true,
      builder: (context, widget) {
        return GetMaterialApp(
          title: 'Lexam',
          debugShowCheckedModeBanner: false,
          navigatorKey: AppKeys.navigation,
          theme: ThemeData(
            // ignore: deprecated_member_use
            androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
          ),
          home: widget,
        );
      },
      child: userController.offlineAuth.isLoggedIn
          ? MainScreen()
          : AuthenticationScreen(),
    );
  }
}
