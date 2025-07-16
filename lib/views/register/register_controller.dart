import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ouzoun/core/services/api_services.dart';
import '../../Routes/app_routes.dart';
import 'package:get_storage/get_storage.dart';
class RegisterController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final locationController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var isLoading = false.obs;
  var selectedLocation = Rxn<LatLng>();
  var errorMessage="".obs;
  final ApiServices apiServices=ApiServices();

  void updateLocation(LatLng coords, String address) {
    selectedLocation.value = coords;
    locationController.text = address;
  }

  Future<void> register()async {
    // الصحيح:
    if(formKey.currentState!.validate() && selectedLocation.value != null){
     isLoading(true);
     try{
       final response=await apiServices.registerUser(
           userName: nameController.text,
           email: emailController.text,
           phoneNumber: phoneController.text,
           password: passwordController.text,
           longitude: selectedLocation.value!.longitude,
           latitude: selectedLocation.value!.latitude,
       );
       if(response.statusCode==200|| response.statusCode==201){
         if (response.data['token'] != null) {
           final box = GetStorage();
           box.write('token', response.data['token']);
         }
         print("----------------------------------------sucess");
         Get.snackbar('Success', 'Registration successful');
         Get.offAllNamed(AppRoutes.firstchoice);
       }
     }
     catch(e){
       Get.snackbar('Error', 'An error occurred: $e');
       print(e.toString());
     }
     finally {
       isLoading(false);
     }
   }
   else {
     Get.snackbar('Error', 'Please fill all fields and select a location');
   }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    locationController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}