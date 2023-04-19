package ai.genie.app

import android.content.Context
import org.json.JSONException
import org.json.JSONObject
import retrofit2.Response
import java.io.IOException


class ApiCallMethods(private var mContext: Context) {

    private fun checkResponseCodes(
        response: Response<*>,
        onApiCallCompleted: OnApiCallCompleted<*>
    ): Boolean {
        try {
            return if (response.code() == RESPONSE_CODE_SUCCESS_200 ||
                response.code() == RESPONSE_CODE_SUCCESS_201
            ) {
                if (response.body() != null) {
                    true
                } else {
                    onApiCallCompleted.apiFailure(mContext.getString(R.string.msg_server_error))
                    false
                }
            } else {
                val errorBody = response.errorBody()
                if (errorBody != null) {
                    val jsonObject = JSONObject(errorBody.string())

                    if (response.code() == RESPONSE_CODE_401) {
                        //                        onApiCallCompleted.apiFailure(jsonObject.getString(MESSAGE_SMALL))
//                        logoutDialog()
                    } else {
                        onApiCallCompleted.apiFailureWithCode(jsonObject, response.code())
                    }
                    //                    onApiCallCompleted.apiFailureWithCode(jsonObject, response.code())
                } else {
                    onApiCallCompleted.apiFailure(mContext.getString(R.string.msg_server_error))
                }
                false
            }
        } catch (e: JSONException) {
            e.printStackTrace()
            onApiCallCompleted.apiFailure(mContext.getString(R.string.msg_server_error))
        } catch (e: IOException) {
            e.printStackTrace()
            onApiCallCompleted.apiFailure(mContext.getString(R.string.msg_server_error))
        }
        return false
    }

    //    //API CALL
//    fun login(
//        email: String?,
//        password: String?,
//        deviceId: String?,
//        osType: String?,
//        deviceModel: String?,
//        appVersion: String?,
//        fcmToken: String?,
//        onApiCallCompleted: OnApiCallCompleted<ClsLoginResponse>
//    ) {
//        try {
//            if (!Utils.isNetworkConnected(mContext)) {
//                onApiCallCompleted.apiFailure(mContext.getString(R.string.msg_network_error))
//                return
//            }
//            showProgress(mContext)
//
//            val call: Call<ClsLoginResponse?> = RetrofitClient.getClient(BASE_URL).login(
//                email,
//                password,
//                deviceId,
//                osType,
//                deviceModel,
//                appVersion,
//                fcmToken
//            )
//
//            call.enqueue(object : Callback<ClsLoginResponse?> {
//                override fun onResponse(
//                    call: Call<ClsLoginResponse?>,
//                    response: Response<ClsLoginResponse?>
//                ) {
//                    cancelProgress()
//                    if (checkResponseCodes(response, onApiCallCompleted)) {
//                        val body: ClsLoginResponse? = response.body()
//                        if (body != null) {
//                            if (body.success) {
//                                onApiCallCompleted.apiSuccess(body)
//                            } else {
//                                onApiCallCompleted.apiFailure(body.message.toString())
//                            }
//                        }
//                    }
//                }
//
//                override fun onFailure(call: Call<ClsLoginResponse?>, t: Throwable) {
//                    cancelProgress()
//                    onApiCallCompleted.apiFailure(t.message!!)
//                }
//            })
//        } catch (e: Exception) {
//            e.printStackTrace()
//        }
//    }
//

//        call.enqueue(new Callback < JsonElement >() {
//            @Override
//            public void onResponse(Call<JsonElement> call, Response<JsonElement> response) {
//                if (response.isSuccessful()) {
//                    JsonElement jsonElement = response . body ()
//                    if (jsonObject.isJsonObject()) {
//                        //use any json deserializer to convert to your class.
//                    } else {
//                        System.out.println(response.message())
//                    }
//                }
//                @Override
//                public void onFailure(Call<JsonElement> call, Throwable t) {
//                    System.out.println("Failed")
//                }
//            })
//        }
}
//}
