import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genie/utils/ui_utils.dart';
import 'package:get/get.dart';

import '../../model/chat_model.dart';
import '../../style/dimensions.dart';
import '../../style/text_styles.dart';
import '../../utils/colors.dart';
import '../../utils/image_paths.dart';
import '../dashboard/dashboard_controller.dart';
import 'chat_controller.dart';

class ChatView extends GetView<ChatController> {
  ChatView({Key? key}) : super(key: key);
  final ChatController chatController = Get.put(ChatController());
  final DashBoardController dashboardController =
      Get.put(DashBoardController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ChatController(),
        initState: (i) async {
          chatController.messages = dashboardController.messages;
          chatController.totalPages = dashboardController.totalPages;
          // chatController.scrollMax();
        },
        builder: (ChatController controller) {
          return Container(
            height: Dimensions.screenHeight,
            width: Dimensions.screenWidth,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                primary4D,
                primary81,
              ],
            )),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  title: Text(
                    'Smart Chat',
                    style: textRegularLight.copyWith(
                        fontSize: Dimensions.fontSize18),
                  ),
                  centerTitle: true,
                  actions: [
                    /*Row(
                      children: [
                        SvgPicture.asset(
                          ImagePath.icOptions,
                        ),
                        18.horizontalSpace,
                        InkWell(
                          onTap: () {
                            // Get.toNamed(Routes.GRAMMAR);
                          },
                          child: SvgPicture.asset(
                            ImagePath.icBox,
                          ),
                        ),
                        27.horizontalSpace,
                      ],
                    )*/
                  ],
                ),
                body: Obx(
                  () => Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 0, left: 24, right: 24),
                          child: ListView.builder(
                            shrinkWrap: true,
                            reverse: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            controller: controller.listScrollController,
                            itemCount: controller.messages.length,
                            itemBuilder: (context, index) {
                              var message = controller.messages[index];
                              return Column(
                                children: [
                                  Container(
                                    alignment: controller.chatMessageType ==
                                            ChatMessageType.user
                                        ? Alignment.centerLeft
                                        : Alignment.centerRight,
                                    child: chatMessage(
                                        message.text.trim(),
                                        message.chatMessageType,
                                        index,
                                        controller.messages),
                                  ),
                                  Visibility(
                                    visible: controller.isLoading.value &&
                                        index == 0,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 16.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            ImagePath.botIcon,
                                            height: 28,
                                            width: 28,
                                            alignment: Alignment.topLeft,
                                          ),
                                          8.horizontalSpace,
                                          const Text('Typing...',
                                              style: textRegularLight),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      Form(
                        key: controller.sendMessageKey,
                        child: TextFormField(
                          controller: controller.messageCtl,
                          focusNode: controller.messageFn,
                          cursorColor: white,
                          maxLines: null,
                          style: textRegularLight,
                          onSaved: (value) {
                            controller.messageCtl.text = value!;
                          },
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                  borderRadius: BorderRadius.zero),
                              suffixIcon: controller.isLoading.value
                                  ? Visibility(
                                      visible: controller.isLoading.value,
                                      child: SvgPicture.asset(
                                        ImagePath.sendIcon,
                                        height: 24,
                                        width: 24,
                                        color: Colors.white,
                                      ).paddingOnly(right: 14),
                                    )
                                  : Visibility(
                                      visible: !controller.isLoading.value,
                                      child: InkWell(
                                        splashFactory: NoSplash.splashFactory,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          controller.sendMessage(context);
                                        },
                                        child: SvgPicture.asset(
                                          ImagePath.sendIcon,
                                          height: 24,
                                          width: 24,
                                          color: Colors.white,
                                        ).paddingOnly(right: 14),
                                      ),
                                    ),
                              suffixIconConstraints: const BoxConstraints(
                                  minHeight: 25, minWidth: 25),
                              contentPadding: const EdgeInsets.all(16),
                              hintText: 'Type your message',
                              hintStyle: textRegularLight.copyWith(
                                  color: white.withOpacity(0.8)),
                              filled: true,
                              fillColor: white.withOpacity(0.1)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget chatMessage(String text, ChatMessageType chatMessageType, int index,
      List<dynamic> messages) {
    return chatMessageType == ChatMessageType.user
        ? Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Container(
                      decoration: BoxDecoration(
                        color: white.withOpacity(0.1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      padding: const EdgeInsets.all(15),
                      child: Text(text, style: textRegularLight)),
                ),
                8.horizontalSpace,
                ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Container(
                    height: 26.0,
                    width: 26.0,
                    decoration: BoxDecoration(
                      color: white.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: dashboardController.details.profilePicPath
                            .toString()
                            .startsWith("http")
                        ? Image.network(
                            dashboardController.details.profilePicPath
                                .toString(),
                            height: 18.0,
                            width: 18.0,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            height: 18.0,
                            width: 18.0,
                            ImagePath.profilePic,
                            fit: BoxFit.cover,
                          ).paddingAll(5),
                  ),
                ).paddingOnly(top: 2),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  ImagePath.botIcon,
                  height: 28,
                  width: 28,
                  alignment: Alignment.topLeft,
                ).paddingOnly(top: 2),
                8.horizontalSpace,
                Flexible(
                  child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            blueBC.withOpacity(0.6),
                            blueBD.withOpacity(0.6),
                          ],
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      padding: const EdgeInsets.all(15),
                      child: Text(text, style: textRegularLight)),
                ),
              ],
            ),
          );
  }

  Widget newPageProgressIndicator(BuildContext context) {
    return const SizedBox(
        height: 40, width: 40, child: CircularProgressIndicator());
  }
}
