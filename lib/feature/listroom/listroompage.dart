import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterpretest/feature/listroom/listroomcontroller.dart';
import 'package:flutterpretest/feature/listroom/widget/popupcheckin.dart';
import 'package:flutterpretest/feature/listroom/widget/popupcheckout.dart';
import 'package:flutterpretest/feature/listroom/widget/popuplistcustomer.dart';
import 'package:get/get.dart';

class ListRoomPage extends StatefulWidget {
  const ListRoomPage({super.key});

  @override
  State<ListRoomPage> createState() => _ListRoomPageState();
}

class _ListRoomPageState extends State<ListRoomPage> {
  ListRoomController _ = Get.find<ListRoomController>();
  int selectRoom = -99;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> card = [];

    for (var i = 0; i < _.roomHotel.length; i++) {
      card.add(Obx(() => GestureDetector(
            onTap: () {
              setState(() {
                selectRoom = i;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  color: _.roomHotel[i].status == true
                      ? Colors.red.shade300
                      : Colors.green.shade300,
                  borderRadius: BorderRadius.circular(8),
                  border: i == selectRoom
                      ? Border.all(color: Colors.red, width: 2.w)
                      : Border.all(color: Colors.black, width: 1.w)),
              width: 150.w,
              height: 100.h,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ชั้นที่ :  ${_.roomHotel[i].floor}"),
                    Text("ห้องที่ : ${_.roomHotel[i].room}"),
                    Text(
                        "ลูกค้า :${_.roomHotel[i].customerName != null ? _.roomHotel[i].customerName : ' - '}"),
                    Text(
                        "KeyNumber : ${_.roomHotel[i].keyCardNumber != null ? _.roomHotel[i].keyCardNumber : ' - '}"),
                  ],
                ),
              ),
            ),
          )));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("รายชื่อห้อง"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Wrap(
                runAlignment: WrapAlignment.spaceAround,
                spacing: 30,
                runSpacing: 20,
                children: [...card],
              ),
              SizedBox(
                height: 100.h,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: 80.h,
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                        flex: 1,
                        child: Container(
                          width: 1.sw,
                          child: OutlinedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green)),
                              onPressed: () {
                                print(_.roomHotel[selectRoom].status);

                                if (_.roomHotel[selectRoom].status == false) {
                                  Get.to(() => PopUpCheckin(room: selectRoom),
                                      fullscreenDialog: true, opaque: false);
                                }
                              },
                              child: Text(
                                "Check In",
                                style: TextStyle(
                                    fontSize: 14.sp, color: Colors.white),
                              )),
                        )),
                    SizedBox(
                      width: 10.w,
                    ),
                    Flexible(
                        flex: 1,
                        child: Container(
                          width: 1.sw,
                          child: OutlinedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.red)),
                              onPressed: () {
                                Get.to(() => PopUpCheckOut(room: selectRoom),
                                    fullscreenDialog: true, opaque: false);
                              },
                              child: Text("Check Out",
                                  style: TextStyle(
                                      fontSize: 14.sp, color: Colors.white))),
                        )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      width: 1.sw,
                      child: OutlinedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blue)),
                          onPressed: () {
                            Get.to(() => PopupListCustomer(),
                                fullscreenDialog: true, opaque: false);
                          },
                          child: Text("รายชื่อ แขกที่เข้าเช็คอิน",
                              style: TextStyle(
                                  fontSize: 14.sp, color: Colors.white))),
                    )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
