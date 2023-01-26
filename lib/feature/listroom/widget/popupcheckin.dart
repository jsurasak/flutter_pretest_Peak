import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterpretest/feature/listroom/listroomcontroller.dart';
import 'package:get/get.dart';

class PopUpCheckin extends StatefulWidget {
  final int room;

  const PopUpCheckin({Key? key, required this.room}) : super(key: key);

  @override
  State<PopUpCheckin> createState() => _PopUpCheckinState();
}

class _PopUpCheckinState extends State<PopUpCheckin> {
  final ListRoomController controller = Get.find<ListRoomController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.85),
      body: Container(
        width: 1.sw,
        height: 1.sh,
        alignment: Alignment.center,
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          width: 0.9.sw,
          height: 250.h,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const Text("Check in"),
                const Spacer(),
                Form(
                  key: controller.checkin,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.customerName,
                        validator: (value) {
                          if (value == "") {
                            return "กรุณาชื่อผู้เข้าพัก";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration:
                            const InputDecoration(hintText: "ชื่อลูกค้า"),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextFormField(
                        controller: controller.customerAge,
                        validator: (value) {
                          if (value == "") {
                            return "กรุณากรอกอายุ";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(hintText: "อายุ"),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        width: 1.sw,
                        child: OutlinedButton(
                            onPressed: () {
                              controller.checkinRoom(widget.room);
                            },
                            child: const Text(
                              "ยืนยัน",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.green),
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        width: 1.sw,
                        child: OutlinedButton(
                            onPressed: () {
                              controller.customerName.clear();
                              controller.customerAge.clear();
                              Get.back();
                            },
                            child: const Text("ยกเลิก",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.red))),
                      ),
                    )
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
