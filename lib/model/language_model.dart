import 'package:get/get.dart';

class LanguageModel {
  String icon;
  String text;
  var isChecked = false.obs;

  LanguageModel(this.icon, this.text, {required this.isChecked});
}
