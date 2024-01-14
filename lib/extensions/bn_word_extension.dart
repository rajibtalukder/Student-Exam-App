extension BnWordExtension on String {
  String get enNumToBeWord {
    String text = this;
    text = text.replaceAll('1', 'ক');
    text = text.replaceAll('2', 'খ');
    text = text.replaceAll('3', 'গ');
    text = text.replaceAll('4', 'ঘ');
    return text;
  }
}
