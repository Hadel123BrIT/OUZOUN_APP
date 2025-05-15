import 'dart:ui';

import 'package:get/get.dart';

import '../Services/services.dart';

class ChangeLangController extends GetxController{
  Services services=Get.find();

  Locale?Lang;
  changLang(String language){
    Locale locale=Locale(language);
    services.prefs.setString("lang", language);
    Get.updateLocale(locale);
  }
  @override
  void onInit() {
    super.onInit();
  String?myLang=services.prefs.getString("lang");
  if(myLang=="ar"){
    Lang=Locale(myLang!);
  }else if(myLang=="en"){
    Lang=Locale(myLang!);
  }else{
    Lang=Locale(Get.deviceLocale!.languageCode);
  }
  }
}