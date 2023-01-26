// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterpretest/feature/home/homecontroller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController _ = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Room"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
                flex: 1,
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "กรุณากรอกจำนวนห้องแล้วจำนวนชั้นของโรงแรม",
                      style: TextStyle(fontSize: 16.sp),
                    ))),
            Flexible(
                flex: 2,
                child: Form(
                  key: _.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _.flowInput,
                        validator: (value) {
                          if (value == '' || value == "0") {
                            return 'กรุณากรอกจำนวนชั้น';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(hintText: "จำนวนชั้น"),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextFormField(
                        controller: _.roomInput,
                        validator: (value) {
                          if (value == '' || value == "0") {
                            return 'กรุณากรอกจำนวนห้อง';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(hintText: "จำนวนห้อง"),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        width: 1.sw,
                        child: OutlinedButton(
                            onPressed: _.setupRoom,
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all<double>(2.0),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            child: Text(
                              "บันทึก",
                              style: TextStyle(fontSize: 14.sp),
                            )),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
