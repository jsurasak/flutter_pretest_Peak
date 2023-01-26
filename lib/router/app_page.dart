import 'package:flutterpretest/feature/home/homebinding.dart';
import 'package:flutterpretest/feature/home/homepage.dart';
import 'package:flutterpretest/feature/listroom/listroombinding.dart';
import 'package:flutterpretest/feature/listroom/listroompage.dart';
import 'package:flutterpretest/router/app_link.dart';
import 'package:get/route_manager.dart';

class AppRoute {
  static final pages = [
    GetPage(name: AppLink.HOME, page: () => HomePage(), binding: HomeBinding()),
    GetPage(
        name: AppLink.LISTROOM,
        page: () => ListRoomPage(),
        binding: ListRoomBinding())
  ];
}
