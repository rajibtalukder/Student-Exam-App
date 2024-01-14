import 'package:lexam/lexam.dart';

class AppColors {
  AppColors._();

  static Color get transparent =>  Colors.transparent;
  static Color get white => const Color(0xffffffff);
  static Color get blue => const Color(0xff0F4B8F);
  static Color get lightBlue => const Color(0xff0D99FF);
  static Color get blueAccent => const Color(0xff96C3E7);
  static Color get lightBlueAccent => const Color(0xffEAF4FF);
  static Color get black => const Color(0xff343434);
  static Color get gray => const Color(0xffABABAB);
  static Color get lightGray => const Color(0xffD8D8D8);

  static Color get green => const Color(0xff70C568);
  static Color get red => const Color(0xffC32C3B);
  static Color get yellow => const Color(0xffFFB72A);
  static Color custom(String code) {
    final color = code.replaceAll('#', '');
    return Color(int.parse('0xFF$color'));
  }

  static Color get random {
    return Color(Random().nextInt(0xffffffff)).withAlpha(0xff);
  }
}

