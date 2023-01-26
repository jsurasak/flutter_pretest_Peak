import 'package:flutterpretest/models/key_card_model.dart';
import 'package:flutterpretest/models/room_hotel_model.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  final roomHotel = <RoomHotelModel>[].obs;
  final keyCardRoom = <KeyCardModel>[].obs;

  @override
  void onInit() {
    super.onInit();
  }
}
