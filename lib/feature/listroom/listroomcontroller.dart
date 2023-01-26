import 'package:flutter/material.dart';
import 'package:flutterpretest/base/BaseController.dart';
import 'package:flutterpretest/models/key_card_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ListRoomController extends BaseController {
  final checkin = GlobalKey<FormState>();

  final TextEditingController customerName = TextEditingController();
  final TextEditingController customerAge = TextEditingController();
  final TextEditingController keycardnumber = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit

    roomHotel.value = GetStorage().read('roomHotel');
    keyCardRoom.value = GetStorage().read('keyCardRoom');

    super.onInit();
  }

  void checkinRoom(int indexRoom) {
    if (checkin.currentState!.validate()) {
      List<KeyCardModel> keycard =
          keyCardRoom.where((e) => e.status == false).toList();

      roomHotel[indexRoom].customerName = customerName.text;
      roomHotel[indexRoom].customerAge = customerAge.text;
      roomHotel[indexRoom].keyCardNumber = keycard[0].keycardnumber;
      roomHotel[indexRoom].status = true;

      final indexkey = keyCardRoom
          .indexWhere((e) => e.keycardnumber == keycard[0].keycardnumber);
      keyCardRoom[indexkey].status = true;

      roomHotel.refresh();
      keyCardRoom.refresh();
      customerName.clear();
      customerAge.clear();
      Get.back();
    }
  }

  Map<String, Object> checkoutRoom(int roomIndex) {
    var output = {"status": false, "message": ""};

    if (customerName.text == roomHotel[roomIndex].customerName &&
        keycardnumber.text == roomHotel[roomIndex].keyCardNumber) {
      output['status'] = true;

      final indexkey = keyCardRoom.indexWhere(
          (e) => e.keycardnumber == roomHotel[roomIndex].keyCardNumber);

      keyCardRoom[indexkey].status = false;
      roomHotel[roomIndex].customerName = null;
      roomHotel[roomIndex].keyCardNumber = null;
      roomHotel[roomIndex].status = false;

      customerName.clear();
      keycardnumber.clear();
      roomHotel.refresh();
      keyCardRoom.refresh();
    } else {
      output['message'] =
          'Only ${roomHotel[roomIndex].customerName} can checkout with keycard number ${roomHotel[roomIndex].keyCardNumber}';
    }

    return output;
  }
}
