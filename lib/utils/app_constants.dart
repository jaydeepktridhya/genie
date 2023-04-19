import 'package:genie/utils/image_paths.dart';

class AppConstants {
  //App related
  static const String appName = 'Genie';
  static const int appVersion = 1;

  //Languages
  static const String languageEnglish = "en";
  static const String languageGerman = "de";

  //API related
  //local
  // static const String baseApi = 'http://209.145.50.228:6565/api';

  //live
  static const String baseApi = 'http://209.145.50.228:1818/api';
  static const String loginApiUrl = '$baseApi/Account/authenticate';
  static const String registerApiUrl = '$baseApi/Account/Register';
  static const String socialLoginApiUrl = '$baseApi/Account/auth/sociallogin';
  static const String forgetPasswordApiUrl = '$baseApi/Account/forgotpassword';
  static const String deleteAccountApiUrl =
      '$baseApi/UserMaster/DeleteUserMaster?UserMasterId=';
  static const String getProfileApiUrl =
      '$baseApi/UserMaster/GetProfile?UserMasterId=';
  static const String updateProfileApiUrl = '$baseApi/UserMaster/UpdateProfile';

  //API results
  static const String checkInFail = 'Check-In Failed';
  static const String noInternet = "No internet connected!";
  static const String somethingWentWrong = "Something went wrong!";

  /*
Shared Pref
  */
  static const String apiKey = 'apiKey';
  static const String openAIApiKey =
      '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';

  // App Strings
  static const version = 'Version 1.0';
  static const skip = 'Skip';
  static const aiSmartKeyboard = 'AI Smart Keyboard';
  static const introContent =
      'Welcome to AI Smart Keyboard - the keyboard that makes typing smarter, faster, and easier.';
  static const loginHeading = 'Login';
  static const registerHeading = 'Register';
  static const emailHeading = 'Email';
  static const passwordHeading = 'Password';
  static const passwordRepeatHeading = 'Repeat Password';
  static const hintEmail = 'Enter your email';
  static const hintPwd = 'Enter password';
  static const headingRemember = 'Remember me';
  static const headingForgotPwd = 'Forgot Password?';
  static const btnLogin = 'Login';
  static const btnRegister = 'Register';
  static const btnNext = 'Next';
  static const headingName = 'Your Name';
  static const hintName = 'Enter your name';
  static const setting = 'Settings';
  static const genie = 'Genie';
  static const upgradetoPro = 'Upgrade to Pro';
  static const restorePurchases = 'Restore Purchases';
  static const restoreUnsuccessful = 'Restore Unsuccessful';
  static const purchasesFoundtoRestore =
      'No previous purchases found to\n restore';
  static const oK = 'OK';
  static const keyboardSettings = 'Keyboard Settings';
  static const keyboardEnabled = 'Keyboard is enabled';
  static const keyboardDisable = 'Keyboard is disabled';
  static const fullAccessEnabled = 'Full Access is enable';
  static const fullAccessDisabled = 'Full Access is disabled';
  static const systemSettings = 'System Settings';
  static const keyboardInfo = 'Keyboard Info';
  static const keyboardThemes = 'Keyboard Themes';
  static const keyboardLanguages = 'Keyboard Languages';
  static const hapticFeedback = 'Haptic Feedback';
  static const profile = 'Profile';
  static const profileInfo = 'Profile Info';
  static const signOut = 'Sign Out';
  static const signoutConfirm = 'Are you sure you want to Sign out?';
  static const cancel = 'Cancel';
  static const socialMedia = 'Social Media';
  static const genieOnFb = '@genie on Facebook';
  static const genieonTikTok = '@genie on TikTok';
  static const genieonInstagram = '@genie on Instagram';
  static const spreadTheWord = 'Spread the word';
  static const loveGenie = 'Love Genie';
  static const sharewithaFriend = 'Share with a Friend';
  static const shareWithContent = 'Hey There! \nCheck out this new Genie App ';
  static const supportandPrivacy = 'Support and Privacy';
  static const needHelp = 'Need Help';
  static const needHelpUrl = 'http://209.145.50.228:1414/#/faq?type=iframe';
  static const aboutGenie = 'About Genie';
  static const aboutGenieUrl =
      'http://209.145.50.228:1414/#/about-us?type=iframe';
  static const privacyPolicy = 'Privacy Policy';
  static const privacyPolicyUrl =
      'http://209.145.50.228:1414/#/privacy-policy?type=iframe';
  static const termsofUse = 'Terms of Use';
  static const termsofUseUrl =
      'http://209.145.50.228:1414/#/terms-use?type=iframe';
  static const janeCooper = 'Jane Cooper';
  static const janeCoopermail = 'jane22cooper@gmail.com';
  static const freePlan = 'Free Plan';
  static const editProfile = 'Edit Profile';
  static const editYourProfile = 'Edit Your Profile';
  static const save = 'Save';
  static const upgradeInfo = 'Unlock Your Writing Superpower';
  static const translateInfo = 'Translate to 20+ Languages';
  static const magicInfo = 'Correct Grammar & Spelling';
  static const editInfo = 'Paraphrase Any Text in 10+ Ways';
  static const themeInfo = '20+ Keyboard Themes';
  static const messageInfo = 'Email Replies any email app';
  static const receiptInfo = 'Unlimited Text Summary';
  static const startFreeTrial = 'Start Free Trial';
  static const loginWithApple = 'Login with Apple';
  static const signupWithApple = 'Register with Apple';
  static const loginWithGoogle = 'Login with Google';
  static const registerWithGoogle = 'Register with Google';
  static const forgotPassword = 'Forgot your password?';
  static const forgotPasswordInfo =
      'Enter your email address to retrieve your password';
  static const submit = 'Submit';
  static const deleteInfo = "You are logged in as\n";
  static const deleteInfo2 =
      ", Deleting your account will delete all content and remove your information from the database.";
  static const deleteInfo1 = 'You must first re-authenticate.';
  static const authenticate = 'Authenticate';
  static const setUp = 'Set Up';
  static const featuresTips = 'Features & Tips';
  static const help = 'Help';
  static const keyboardStatus = 'Keyboard Status : ';
  static const keyboardStatusInfo = 'How to set up Genie Keyboard';
  static const keyboardFeaturesTitle =
      'You can access the main keyboard features by tapping on one of the toolbar buttons:';
  static const tipsForBestExp = 'Tips for the best experience';
  static const howToSwitchGenieKey =
      'How to switch to Genie AI - Make a Wish! Keyboard';
  static const freeTrialText = 'Currently you are on free trial';
  static const setupGenie = 'Let\'s set up';
  static const comingSoon = 'Coming soon';
  static const keyboardFeatures = 'Keyboard Features';
  static const keyboardHelp = 'Common Issues & How to Fix Them';
  static const btnCreateNew = 'Create New';
  static const howToUse = 'How to Use?';
  static const clientID =
      '500527138758-dm2g3g3eumv0fcrk34ju8r989kvk0gm9.apps.googleusercontent.com';
  static const secretID = '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';

  //Social Media accounts
  static const fbUrl = 'https://www.facebook.com/GenieAi2';
  static const tiktokUrl = 'https://www.tiktok.com/@usegenie.ai';
  static const instagramUrl = 'https://www.instagram.com/usegenie.ai/';

  //Keyboard setup
  static const setupStep1a = 'Go to ';
  static const setupStep1b = ' or tap System Settings from Genie';
  static const setupStep2aios = 'Scroll down and select';
  static const setupStep2Android1 = 'Scroll down and select';
  static const setupStep2bios = ' Genie';
  static const setupStep2Android2 = 'System -> Languages & input -> Keyboards ';
  static const notOperational = ' Not Operational';
  static const upAndRunning = ' Up and Running';

  static List<String> keyboardIconPathList = [
    ImagePath.headerTranslate,
    ImagePath.headerGrammar,
    ImagePath.headerParaphrase,
    ImagePath.headerContinueWrite,
    ImagePath.icEmailReplyWhite,
    ImagePath.headerHelpWrite,
  ];

  static List<String> keyboardHeaderTitleList = [
    "Translation: ",
    "Fix Grammar & Spelling: ",
    "Paraphrase: ",
    "Continue Writing: ",
    "Email Replies: ",
    "Help Me Write: ",
  ];

  static List<String> keyboardHeaderDetailsList = [
    "Translate your messages to and from over 20 languages.",
    "One tap, and I'll fix any mistakes in your writing in any language.",
    "Select the style, and I'll rephrase your writing.",
    "Write something, tap the button, and I'll write the next few sentences.",
    "Choose the tone, and I'll draft a response in almost any email app.",
    "Tell me your topic, and I'll write about it for you.",
  ];

  static List<String> keyboardTipsList = [
    "All Keyboard Features except 'Continue Writing', 'Help Me Write', and 'Email Replies' "
        "work on the entire text and on a selected part of it. However, due to iOS limitations, "
        "when you select longer texts, parts of it may get omitted. For better results, "
        "I recommend applying Keyboard Features to a selected text only if it's a few words long.",
    "To select text: Double-tap on a word or triple-tap to select the entire line; "
        "Drag the handles that appear to the beginning and end of the text you want to select.",
    "Write something, tap the button, and I'll write the next few sentences.",
    "The 'Email Replies' feature will work only if the cursor can access the entire text. While this is the case in most email apps such as Apple Mail "
        "and Gmail, in some apps, the cursor can only access the first line of an email, so it won't work.",
    "I'm using some very new and experimental technologies that might not always work correctly. There may be some bugs every now and then, so please bear that in mind when using Keyboard Features :)"
  ];

  static List<String> helpQuestions = [
    "Is Genie AI free or not?",
    "Do you manage any sensitive information?",
    "What does “Allow Full Access” mean? ",
    "Can I retrieve my original text after using the Rewriting, Translation, or Grammar Correction features?",
    "How do I set Genie AI as the default keyboard?",
    "Is the Genie AI Keyboard compatible with all applications?",
  ];
  static List<String> helpAnswers = [
    "Yes! At the moment, you can access all features, such as grammar corrections, email responses, sentence completions, rewriting, translations, and the write for me feature, entirely for free!",
    "No, I do not. I prioritize privacy and data safety, incorporating multiple precautions to stop the gathering of sensitive data when operating the Genie AI Keyboard.",
    "Granting Full Access allows the keyboard to establish an internet connection. Without this access, you can continue typing with the keyboard, but all AI functions — such as grammar corrections, email responses, sentence completions, rewriting, and translations — will be unavailable. The Genie AI Keyboard prioritizes privacy and is designed accordingly: "
        "it cannot access password or credit card fields and does not gather any user data.",
    "Certainly! Your initial text is securely retained on the clipboard. To access it, simply perform the 'Paste' function by tapping and holding in a text field.",
    "To switch to Genie AI Keyboard:\n\n1.Press and hold the keyboard change icon.\n\n2.Choose Genie AI from the list. ",
    "The Genie AI Keyboard seamlessly integrates with a wide range "
        "of popular applications and browsers. Enjoy its AI-driven capabilities on platforms like "
        "WhatsApp, Facebook, Instagram, Gmail, Apple Mail, Twitter, Telegram, TikTok, LinkedIn, YouTube, Reddit, "
        "Pinterest, Snapchat, iMessage, "
        "Messenger, Roblox, Twitch, Discord, Kik, Microsoft Teams, and countless other apps and websites.",
  ];

  // tutorial content
  static const contentSubtitleOne =
      "Press the button, share your topic, and I'll generate content for you in any app and language.";
  static const contentSubtitleTwo =
      "Select one of the styles, and I'll draft an email response in almost any email app.";
  static const contentSubtitleThree =
      "Struggling to find the right words? Tap the button, and let me generate the following sentences for you.";
  static const contentSubtitleFour =
      "I can seamlessly reword your sentences in various styles and even transform them into poems.";
  static const contentSubtitleFive =
      "I can help you fix any mistakes in your writing in any language with just one tap.";
  static const contentSubtitleSix =
      "I can effortlessly translate your messages between more than 32 languages.";
  static const contentSubtitleSeven =
      "You can always open the app and ask any questions, brainstorm ideas, or chat with me.";
  static const contentSubtitleEight = "Add Genie AI keyboard in your keyboard list";

  static const contentTitleOne = "Help Me Write";
  static const contentTitleTwo = "Easy Email Responses";
  static const contentTitleThree = "Continue Writing";
  static const contentTitleFour = "Paraphrase";
  static const contentTitleFive = "Magical grammar check";
  static const contentTitleSix = "Experience the global translation";
  static const contentTitleSeven = "Feel free to ask questions";
  static const contentTitleEight = "One last step";
}
