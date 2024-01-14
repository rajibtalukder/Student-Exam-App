extension StringExtension on String {
  String get enNumToBeNum {
    String text = this;
    text = text.replaceAll('0', '০');
    text = text.replaceAll('1', '১');
    text = text.replaceAll('2', '২');
    text = text.replaceAll('3', '৩');
    text = text.replaceAll('4', '৪');
    text = text.replaceAll('5', '৫');
    text = text.replaceAll('6', '৬');
    text = text.replaceAll('7', '৭');
    text = text.replaceAll('8', '৮');
    text = text.replaceAll('9', '৯');
    return text;
  }
}
