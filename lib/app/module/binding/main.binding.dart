import 'package:consumer_app/app/data/controller/controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      MainController(),
    );
    Get.put(
      CategoryController(),
    );
  }
}
