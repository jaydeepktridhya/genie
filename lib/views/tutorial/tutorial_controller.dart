import 'package:genie/controller/base_controller.dart';
import 'package:genie/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:video_player/video_player.dart';

import '../../utils/video_path.dart';

class TutorialController extends BaseController {
  late VideoPlayerController videoPlayerController;
  String path = '';
  List<String> urls = [];
  List<String> androidUrls = [];
  List<String> iosUrls = [];
  List<String> subtitle = [];
  List<String> title = [];
  late PreloadPageController preloadPageController;
  int current = 0;
  var isOnPageTurning = false.obs;

  @override
  void onInit() {
    isLoading.value = true;
    androidUrls = [
      VideoPath.androidTutorialOne,
      VideoPath.androidTutorialTwo,
      VideoPath.androidTutorialThree,
      VideoPath.androidTutorialFour,
      VideoPath.androidTutorialFive,
      VideoPath.androidTutorialSix,
      VideoPath.androidTutorialSeven,
      VideoPath.androidTutorialEight,
    ];
    iosUrls = [
      VideoPath.iosTutorialOne,
      VideoPath.iosTutorialTwo,
      VideoPath.iosTutorialThree,
      VideoPath.iosTutorialFour,
      VideoPath.iosTutorialFive,
      VideoPath.iosTutorialSix,
      VideoPath.iosTutorialSeven,
      VideoPath.iosTutorialEight,
    ];
    urls = GetPlatform.isIOS ? iosUrls : androidUrls;
    title = [
      AppConstants.contentTitleOne,
      AppConstants.contentTitleTwo,
      AppConstants.contentTitleThree,
      AppConstants.contentTitleFour,
      AppConstants.contentTitleFive,
      AppConstants.contentTitleSix,
      AppConstants.contentTitleSeven,
      AppConstants.contentTitleEight,
    ];
    subtitle = [
      AppConstants.contentSubtitleOne,
      AppConstants.contentSubtitleTwo,
      AppConstants.contentSubtitleThree,
      AppConstants.contentSubtitleFour,
      AppConstants.contentSubtitleFive,
      AppConstants.contentSubtitleSix,
      AppConstants.contentSubtitleSeven,
      AppConstants.contentSubtitleEight,
    ];
    isLoading.value = false;
    super.onInit();
  }

  void scrollListener() {
    if (isOnPageTurning.value &&
        preloadPageController.page ==
            preloadPageController.page!.roundToDouble()) {
      current = preloadPageController.page!.toInt();
      isOnPageTurning.value = false;
      update();
    } else if (!isOnPageTurning.value &&
        current.toDouble() != preloadPageController.page) {
      if ((current.toDouble() - preloadPageController.page!.toDouble()).abs() >
          0.1) {
        isOnPageTurning.value = true;
        update();
      }
    }
  }
}
