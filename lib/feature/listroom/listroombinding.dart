import 'package:flutterpretest/feature/listroom/listroomcontroller.dart';
import 'package:get/get.dart';

class ListRoomBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ListRoomController>(() => ListRoomController());
  }
}
