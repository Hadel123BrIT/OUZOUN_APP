import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Services extends GetxService {

  late SharedPreferences prefs;

 Future<Services>initialize()async {
    prefs= await SharedPreferences.getInstance();
    return this;
  }
}

initialServices()async{
  await Get.putAsync(()=>Services().initialize());
}