package ai.genie.app

// others
const val SPLASH_TIME_OUT: Long = 2500
const val REQUEST_CODE: Int = 1111
const val GOOGLE_SIGN_IN_CODE: Int = 0
const val GALLERY: Int = 0x51
const val CAMERA: Int = 0x50

//Drawable Sides
const val DRAWABLE_LEFT = 0x29
const val DRAWABLE_RIGHT = 0x2A
const val DRAWABLE_TOP = 0x2B
const val DRAWABLE_BOTTOM = 0x2C

const val UPDATE_INTERVAL_IN_MILLISECONDS: Long = 6000
const val FASTEST_UPDATE_INTERVAL_IN_MILLISECONDS: Long = 1000
const val REQUEST_CHECK_SETTINGS = 1045

// Shared preferences
const val PREF_IS_USER_LOGGED_IN = "PREF_IS_USER_LOGGED_IN"
const val PREF_IMEI = "pref_imei"
const val PREF_DEVICE_TOKEN = "pref_device_token"
const val PREF_FCM_TOKEN = "pref_fcm_token"
const val PREF_USERNAME = "pref_username"
const val PREF_PASSWORD = "pref_password"
const val PREF_IS_REMEMBER_ME = "pref_is_remember_me"
const val PREF_IS_USER_DETA = "pref_is_user_deta"
const val PREF_LATITUDE = "pref_latitude"
const val PREF_LONGITUDE = "pref_longitude"
const val PREF_CUSTOMER_BALANCE = "pref_customer_balance"
const val PREF_NOTIFICATION_UNREAD_COUNT = "pref_notification_unread_count"

// Extras
const val EXTRAS_BUSINESS_ID = "extras_business_id"
const val EXTRAS_WEB_CONTENT_URL = "extras_web_content_url"
const val EXTRAS_EMAIL = "extras_email"
const val EXTRAS_OTP = "extras_otp"
const val EXTRAS_SCREEN = "extras_screen"
const val EXTRAS_NOTIFICATION_SCREEN = "extras_notification_screen"
const val EXTRAS_VERIFICATION_TYPE = "extras_verification_type"

//Web content type
const val EXTRAS_REGISTER_VALUE = "1"
const val EXTRAS_LOGIN_VALUE = "2"
const val EXTRAS_FORGOT_VALUE = "3"

//Web content type
const val TERMS_AND_CONDITION = "terms_and_condition"
const val PRIVACY_POLICY = "privacy_policy"
const val CONTACT_US = "contact_us"

//Api Params
//const val URL_DOMAIN: String = "http://162.243.162.181/ezycarrot/public/" // Local URL domain
const val URL_DOMAIN: String = "https://www.ezycarrot.com.au/" // Live URL domain

const val BASE_URL: String = URL_DOMAIN + "api/"
const val TERMS_AND_CONDITIONS_URL = URL_DOMAIN + "terms-of-use-mobile"
const val PRIVACY_POLICY_URL = URL_DOMAIN + "privacy-policy-mobile"
const val CONTACT_US_URL = URL_DOMAIN + "contact-us-mobile"

const val PAGE_SIZE_BUSINESS_LIST = 10
const val PAGE_SIZE_NOTIFICATION_LIST = 10
const val PAGE_SIZE_TRANSACTION_LIST = 10

const val STATUS = "Status"
const val MESSAGE = "Message"
const val MESSAGE_SMALL = "message"
const val RESPONSE_CODE_SUCCESS_200 = 200
const val RESPONSE_CODE_SUCCESS_201 = 201
const val RESPONSE_CODE_400 = 400
const val RESPONSE_CODE_404 = 404
const val RESPONSE_CODE_401 = 401


const val OS_TYPE = "Android"

//Date Formats
const val DISPLAY_DATE_FORMAT = "hh:mmaa dd/MM/yyyy"

//const val API_DATE_FORMAT = "yyyy-MM-dd'T'HH:mm:ss.Z"
const val API_DATE_FORMAT = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
const val API_DATE_FORMAT_TRANSACTION = "dd-MM-yyyy hh:mm aa"

//
const val TYPE_CANCEL = "0"
const val TYPE_SHARE = "1"

// Transaction TYPE
const val TRANSACTION_TYPE_ALL = "All"
const val TRANSACTION_TYPE_EARNED = "Earned"
const val TRANSACTION_TYPE_REDEEMED = "Reedemed"

// Verification TYPE
const val VERIFICATION_TYPE_LOGIN = "login"
const val VERIFICATION_TYPE_REGISTER = "register"
const val VERIFICATION_TYPE_FORGOT_PASSWORD = "forgotPassword"


// Dialog
const val DIALOG_FORGOT_PASSWORD: String = "dialog_forgot_password"
const val REDEEM_NOW_Dialog: String = "redeem_now_dialog"
const val BUSINESS_FILTER_DIALOG: String = "business_filter_dialog"

// Fragments
const val DASHBOARD_FRAGMENT: String = "dashboard_fragment"
const val REDEEM_NOW_FRAGMENT: String = "redeem_now_fragment"
const val BUSINESS_FILTER__FRAGMENT: String = "business_filter__fragment"
const val TRANSACTION__FRAGMENT: String = "transaction__fragment"


class AppConstants {
}