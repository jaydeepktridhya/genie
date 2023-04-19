import 'package:flutter/material.dart';
import 'package:genie/views/intro/intro_controller.dart';
import 'package:genie/views/tutorial/tutorial_controller.dart';
import 'package:get/get.dart';
import 'package:open_settings/open_settings.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:video_player/video_player.dart';

import '../../routes/app_pages.dart';
import '../../style/dimensions.dart';
import '../../style/text_styles.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/ui_utils.dart';
import '../../utils/utility.dart';

class TutorialView extends GetView<TutorialController> {
  TutorialView({Key? key}) : super(key: key);
  TutorialController tutorialController = Get.put(TutorialController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: TutorialController(),
        initState: (i) {
          tutorialController.preloadPageController = PreloadPageController();
          tutorialController.preloadPageController
              .addListener(tutorialController.scrollListener);
        },
        builder: (TutorialController controller) {
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
              child: Scaffold(
                  backgroundColor: Colors.transparent,
                  bottomNavigationBar: UiUtils()
                      .appButton(
                        onPressFunction: () async {
                          int isViewed = 0;
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setInt('onBoard', isViewed);
                          printf(prefs.getInt('onBoard'));
                          Get.toNamed(Routes.LOGIN);
                        },
                        buttonText: AppConstants.btnNext,
                        buttonFillColor: white.withOpacity(0.1),
                        buttonBorderColor: Colors.transparent,
                        buttonTextColor: Colors.white,
                      )
                      .paddingOnly(bottom: 10, top: 8, left: 24, right: 24),
                  body: Obx(
                    () => controller.isLoading.value == false
                        ? PreloadPageView.builder(
                            controller: controller.preloadPageController,
                            itemBuilder: (context, pageIndex) => VideoScreen(
                              url: controller.urls[pageIndex],
                              text: controller.title[pageIndex],
                              subtitle: controller.subtitle[pageIndex],
                              index: pageIndex,
                              currentIndex: controller.current,
                              isPaused: controller.isOnPageTurning.value,
                            ),
                            onPageChanged: (i) {},
                            preloadPagesCount: controller.urls.length,
                            itemCount: controller.urls.length,
                            scrollDirection: Axis.horizontal,
                          )
                        : const Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.white,
                            ),
                          ),
                  )));
        });
  }
}

class VideoScreen extends StatefulWidget {
  final String url;
  final String text;
  final String subtitle;
  final int index;
  final int currentIndex;
  final bool isPaused;

  VideoScreen({
    Key? key,
    required this.url,
    required this.text,
    required this.subtitle,
    required this.index,
    required this.currentIndex,
    required this.isPaused,
  }) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  TutorialController controller = Get.put(TutorialController());
  late VideoPlayerController videoPlayerController;
  bool initialized = false;
  IntroController introController =
      Get.put(IntroController(), tag: DateTime.now().toString());

  @override
  void initState() {
    super.initState();
    printf("init: Index: ${widget.index}");
    videoPlayerController = VideoPlayerController.asset(widget.url)
      ..initialize().then((_) {
        setState(() {
          videoPlayerController.setLooping(true);
          initialized = true;
        });
      });
  }

  @override
  void dispose() {
    printf("dispose: Index: ${widget.index}");
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.index == widget.currentIndex &&
        !widget.isPaused &&
        initialized) {
      videoPlayerController.play();
    } else {
      videoPlayerController.pause();
    }
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height:MediaQuery.of(context).padding.top,
        ),
        Text(
          widget.text,
          textAlign: TextAlign.center,
          style: textBold16,
        ).paddingSymmetric(horizontal: 28),
        Container(
          height:  widget.index != 7?54:28,
          child: Text(
            widget.subtitle,
            textAlign: TextAlign.center,
            style: textRegular14,
          ).paddingSymmetric(horizontal: 40),
        ),
        Visibility(
          visible: widget.index == 7,
          child:InkWell(
    onTap: (){
    if (GetPlatform.isAndroid) {
    OpenSettings.openInputMethodSetting();
    } else {
    introController.openIOSSettings();
    }
    },
            child: Text(
                AppConstants.setupGenie,
    textAlign: TextAlign.center,
    style: textBold14.copyWith(color: blueBD,decoration: TextDecoration.underline,),
    ),
        ),),
        videoPlayerController.value.isInitialized
            ? Flexible(
              child
                  : ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: AspectRatio(
                            aspectRatio: videoPlayerController.value.aspectRatio,
                            child: VideoPlayer(
                                videoPlayerController),
                          ))
                      .marginSymmetric(horizontal: 50).paddingAll(26),
            )
            : const Flexible(
              child:SizedBox(),
            ),
        AnimatedSmoothIndicator(
          activeIndex: widget.index,
          count: controller.urls.length,
          effect: WormEffect(
            dotHeight: 10,
            dotWidth: 10,
            dotColor: Colors.white.withOpacity(0.2),
            activeDotColor: Colors.white,
            type: WormType.thin,
            // strokeWidth: 5,
          ),
        ).paddingOnly(bottom: 4),
      ],
    );
  }
}
