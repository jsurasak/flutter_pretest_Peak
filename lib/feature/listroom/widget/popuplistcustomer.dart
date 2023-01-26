import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterpretest/feature/listroom/listroomcontroller.dart';
import 'package:flutterpretest/models/room_hotel_model.dart';
import 'package:get/get.dart';

class PopupListCustomer extends StatefulWidget {
  PopupListCustomer({Key? key}) : super(key: key);

  @override
  State<PopupListCustomer> createState() => _PopupListCustomerState();
}

class _PopupListCustomerState extends State<PopupListCustomer> {
  final ListRoomController controller = Get.find<ListRoomController>();
  List<Map<String, dynamic>> listcustomer = [];
  List<String> typeSearch = ["age", "room"];
  String selectSearch = "";
  TextEditingController startage = TextEditingController();
  TextEditingController endage = TextEditingController();
  TextEditingController roomSearch = TextEditingController();

  @override
  void initState() {
    getCustomer(false);
    // TODO: implement initState
    selectSearch = typeSearch.first;
    super.initState();
  }

  void getCustomer(bool search) {
    List<Map<String, dynamic>> items = [];
    List<RoomHotelModel> roomcheckin =
        controller.roomHotel.where((p) => p.status == true).toList();

    if (search) {
      if (selectSearch == "age") {
        roomcheckin = roomcheckin
            .where((e) =>
                int.parse(startage.text) <=
                    int.parse(e.customerAge.toString()) &&
                int.parse(e.customerAge.toString()) <= int.parse(endage.text))
            .toList();
      } else {
        roomcheckin = roomcheckin
            .where((e) => e.room.toString() == roomSearch.text.toString())
            .toList();
      }
    }

    for (var element in roomcheckin) {
      var check =
          items.indexWhere((e) => e['customer_name'] == element.customerName);

      if (check == -1) {
        items.add({
          "customer_name": element.customerName,
          "customer_age": element.customerAge,
          "customer_room": element.room,
        });
      } else {
        items[check]['customer_room'] =
            '${items[check]['customer_room']},${element.room}';
      }
    }

    setState(() {
      listcustomer = items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("รายชื่อผู้เข้าพัก")),
      body: Container(
        padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
        child: Column(
          children: [
            Container(
              child: DropdownButton<String>(
                  isExpanded: true,
                  value: selectSearch,
                  items:
                      typeSearch.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? e) {
                    setState(() {
                      selectSearch = e.toString();
                    });
                  }),
            ),
            selectSearch == "age"
                ? Container(
                    child: Row(
                      children: [
                        Expanded(
                            child: TextFormField(
                          controller: startage,
                          keyboardType: TextInputType.phone,
                          decoration:
                              const InputDecoration(hintText: "เริ่มต้น"),
                        )),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                            child: TextFormField(
                          controller: endage,
                          keyboardType: TextInputType.phone,
                          decoration:
                              const InputDecoration(hintText: "สิ้นสุด"),
                        ))
                      ],
                    ),
                  )
                : Container(
                    child: TextFormField(
                      controller: roomSearch,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(hintText: "ห้อง"),
                    ),
                  ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              width: 1.sw,
              child: OutlinedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue)),
                  onPressed: () {
                    getCustomer(true);
                  },
                  child: Text("ค้นหา",
                      style: TextStyle(fontSize: 14.sp, color: Colors.white))),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: listcustomer.length,
                    itemBuilder: (_, index) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'name : ${listcustomer[index]['customer_name']}',
                              style: const TextStyle(fontSize: 14),
                            ),
                            Text(
                              'age : ${listcustomer[index]['customer_age']}',
                              style: const TextStyle(fontSize: 14),
                            ),
                            Text(
                              'room : ${listcustomer[index]['customer_room']}',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
