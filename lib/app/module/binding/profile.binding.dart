import 'package:consumer_app/app/data/controller/controller.dart';
import 'package:get/get.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      ProfileController(),
    );
  }
}
