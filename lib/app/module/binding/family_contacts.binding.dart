import 'package:consumer_app/app/data/controller/controller.dart';
import 'package:get/get.dart';

class FamilyContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => FamilyContactController(),
    );
  }
}
