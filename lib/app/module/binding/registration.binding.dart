import 'package:consumer_app/app/data/controller/controller.dart';
import 'package:get/get.dart';

class RegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RegistrationController(),
    );
    Get.lazyPut(
      () => RegistrationUserController(),
    );
    Get.lazyPut(
      () => RegistrationAddressrController(),
    );
    Get.lazyPut(
      () => RegistrationAdditionalInfoController(),
    );
  }
}
