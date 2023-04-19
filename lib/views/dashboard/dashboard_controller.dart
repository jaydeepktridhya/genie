import 'package:genie/controller/base_controller.dart';
import 'package:genie/database/app_preferences.dart';
import 'package:genie/database/database.dart';
import 'package:genie/model/chat_model.dart';
import 'package:genie/model/login_master.dart';
import 'package:genie/views/settings/settings_controller.dart';
import 'package:get/get.dart';

import '../../utils/utility.dart';

class DashBoardController extends BaseController {
  var rootPageIndex = 0.obs;
  LoginDetails details = LoginDetails();
  List<ChatMessage> messages = <ChatMessage>[].obs;
  var totalPages = 0.obs;
  SettingsController settingsController = Get.put(SettingsController());

  void changeRootPageIndex(int index) {
    rootPageIndex(index);
  }

  @override
  void onInit() {
    printf("INIT called in Dashboard");
    getListData();
    super.onInit();
  }

  Future<void> getListData() async {
    details = (await AppPreferences().getLoginDetails())!;
    messages = await getChats();
    totalPages.value = await getTotalPage();
  }

  Future<List<ChatMessage>> getChats() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final dao = database.chatDao;
    var page = 1;
    var offset = (page - 1) * 30;
    List<ChatMessage> allChatsWithLimit =
        await dao.getChatsByIdWithLimit(details.userId!, offset);
    messages = allChatsWithLimit;
    messages.sort((a, b) =>
        DateTime.parse(b.dateTime).compareTo(DateTime.parse(a.dateTime)));
    return messages;
  }

  Future<int> getTotalPage() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final dao = database.chatDao;
    var totalPage = 0;
    List<ChatMessage> allChats = await dao.getChatsById(details.userId!);
    if (allChats.isNotEmpty) {
      if (allChats.length.toInt() > 30) {
        totalPages.value = (allChats.length.toInt() ~/ 30).floor() + 1;
      } else {
        totalPages.value = 1;
      }
    } else {
      totalPages.value = 0;
    }
    totalPage = allChats.length;
    return totalPage;
  }
}
