import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:genie/controller/base_controller.dart';
import 'package:genie/database/app_preferences.dart';
import 'package:genie/services/open_ai_api.dart';
import 'package:genie/utils/utility.dart';
import 'package:get/get.dart';

import '../../database/database.dart';
import '../../model/chat_model.dart';
import '../../model/login_master.dart';

class ChatController extends BaseController {
  TextEditingController messageCtl = TextEditingController();
  FocusNode messageFn = FocusNode();

  // final scrollController = ScrollController();
  var botMessage = "";
  var isUser = true.obs;
  var isBot = false.obs;
  late ScrollController listScrollController;
  var isChatLoading = false.obs;
  var currentPage = 1.obs;
  var totalPages = 0.obs;
  late Rx<ChatMessage> model;
  List<ChatMessage> messages = <ChatMessage>[].obs;
  ChatMessageType? chatMessageType;
  final sendMessageKey = GlobalKey<FormState>();
  var isSending = false.obs;
  LoginDetails? details = LoginDetails();
  static const pageSize = 30;

  Future<void> insertChatsInDB(ChatMessage chats) async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final dao = database.chatDao;
    dao.insertSingleChatMessage(chats);
  }

  @override
  void onInit() {
    initDb();
    super.onInit();
    listScrollController = ScrollController()
      ..addListener(() {
        if (listScrollController.position.pixels ==
                listScrollController.position.maxScrollExtent &&
            currentPage.value < totalPages.value) {
          loadData();
        }
      });
  }

  void initDb() async {
    details = (await AppPreferences().getLoginDetails())!;
  }

  void loadData() async {
    isChatLoading = true.obs;
    currentPage = currentPage + 1;
    // perform fetching data delay
    await Future.delayed(const Duration(seconds: 2));
    printf("load more chat");
    var offset = (currentPage.value - 1) * 10;
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final dao = database.chatDao;
    List<ChatMessage> allChatsWithLimit =
        await dao.getChatsByIdWithLimit(details!.userId!, offset);
    // update data and loading status
    messages.addAll(allChatsWithLimit);
    messages.sort((a, b) =>
        DateTime.parse(b.dateTime).compareTo(DateTime.parse(a.dateTime)));
    update();
    isChatLoading = false.obs;
  }

  void sendMessage(BuildContext context) async {
    String msg = messageCtl.value.text;
    if (msg != "") {
      isLoading.value = true;
      messages.insert(
          0,
          ChatMessage(
              userId: details!.userId!,
              text: msg,
              dateLabel: "",
              dateTime: DateTime.now().toString(),
              chatMessageType: ChatMessageType.user));
      var input = msg;
      messageCtl.clear();
      final chatResult = ChatMessage(
          userId: details!.userId!,
          text: msg,
          dateLabel: "",
          dateTime: DateTime.now().toString(),
          chatMessageType: ChatMessageType.user);
      insertChatsInDB(chatResult);

      // Future.delayed(const Duration(milliseconds: 50))
      //     .then((value) => scrollDown());
      ChatGtpApi().generateChatResponse(input).then((value) {
        messages.insert(
            0,
            ChatMessage(
                userId: details!.userId!,
                text: value,
                dateLabel: "",
                dateTime: DateTime.now().toString(),
                chatMessageType: ChatMessageType.bot));
        final chatResultBot = ChatMessage(
            userId: details!.userId!,
            text: value,
            dateLabel: "",
            dateTime: DateTime.now().toString(),
            chatMessageType: ChatMessageType.bot);
        insertChatsInDB(chatResultBot);
        isLoading.value = false;

        // Future.delayed(const Duration(milliseconds: 50))
        //     .then((value) => scrollDown());
      });
    } else {
      Utility.snackBar('Please type a message', context);
    }
  }

  @override
  void dispose() {
    listScrollController.dispose();
    super.dispose();
  }

  Future<void> scrollMax() async {
    if (GetPlatform.isAndroid) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (listScrollController.hasClients) {
          listScrollController.animateTo(
            listScrollController.position.maxScrollExtent,
            duration: const Duration(
              milliseconds: 200,
            ),
            curve: Curves.easeInOut,
          );
        }
      });
    } else {
      listScrollController
          .jumpTo(listScrollController.position.maxScrollExtent + 300);
    }
  }

  void scrollDown() {
    listScrollController.jumpTo(listScrollController.position.maxScrollExtent);
  }
}
