import 'package:flutter/material.dart';
import 'package:flutterpretest/base/BaseController.dart';
import 'package:flutterpretest/models/key_card_model.dart';
import 'package:flutterpretest/models/room_hotel_model.dart';
import 'package:flutterpretest/router/app_link.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends BaseController {
  final formKey = GlobalKey<FormState>();
  TextEditingController flowInput = TextEditingController();
  TextEditingController roomInput = TextEditingController();

  void setupRoom() {
    if (formKey.currentState!.validate()) {
      final int flow = int.parse(flowInput.text);
      final int room = int.parse(roomInput.text);

      var numberKey = 1;
      roomHotel.clear();
      keyCardRoom.clear();

      for (var f = 1; f <= flow; f++) {
        for (var r = 1; r <= room; r++) {
          roomHotel.add(RoomHotelModel(
              floor: f.toString(),
              room: f.toString() + r.toString().padLeft(2, '0'),
              status: false));
          keyCardRoom.add(
              KeyCardModel(keycardnumber: numberKey.toString(), status: false));

          numberKey++;
        }
      }

      GetStorage().write("roomHotel", roomHotel);
      GetStorage().write("keyCardRoom", keyCardRoom);

      Get.toNamed(AppLink.LISTROOM);
    }
  }
}
