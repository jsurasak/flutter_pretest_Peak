import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterpretest/feature/listroom/listroomcontroller.dart';
import 'package:get/get.dart';

class PopUpCheckOut extends StatefulWidget {
  final int room;

  const PopUpCheckOut({Key? key, required this.room}) : super(key: key);

  @override
  State<PopUpCheckOut> createState() => _PopUpCheckOutState();
}

class _PopUpCheckOutState extends State<PopUpCheckOut> {
  final ListRoomController controller = Get.find<ListRoomController>();
  final checkout = GlobalKey<FormState>();
  late String errorString = "";

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
                const Text("Check Out"),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  errorString.toString(),
                  style: TextStyle(fontSize: 14.sp, color: Colors.red),
                ),
                const Spacer(),
                Form(
                  key: checkout,
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
                        controller: controller.keycardnumber,
                        validator: (value) {
                          if (value == "") {
                            return "กรุณากรอก keyCardNumber";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        decoration:
                            const InputDecoration(hintText: "keyCardNumber"),
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
                            onPressed: () async {
                              if (checkout.currentState!.validate()) {
                                final statuscheckout =
                                    controller.checkoutRoom(widget.room);

                                if (statuscheckout['status'] == true) {
                                  Get.back();
                                } else {
                                  setState(() {
                                    errorString =
                                        statuscheckout['message'].toString();
                                  });
                                }
                              }
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
                              controller.keycardnumber.clear();
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
