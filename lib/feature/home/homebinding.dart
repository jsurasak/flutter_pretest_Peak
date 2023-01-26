import 'package:flutterpretest/feature/home/homecontroller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    // TODO: implement dependencies
  }
}
