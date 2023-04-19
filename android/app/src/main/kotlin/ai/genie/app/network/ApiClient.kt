package ai.genie.app.network

import okhttp3.Interceptor
import okhttp3.OkHttpClient
import okhttp3.RequestBody
import okhttp3.ResponseBody
import retrofit2.Call
import retrofit2.Retrofit
import retrofit2.http.Body
import retrofit2.http.Header
import retrofit2.http.Headers
import retrofit2.http.POST


object RetrofitClient {

    var retrofit: Retrofit? = null

    var apiKey: String = "Bearer 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"

    interface APIService {
        // ...
        @Headers("Accept: application/json")
        @POST("/v1/completions")
        fun request(
            @Header("Authorization:") api_key: String,
            @Body requestBody: RequestBody,
        ): Call<ResponseBody>

        // ...
    }

    class OAuthInterceptor(private val tokenType: String, private val acceessToken: String) :
        Interceptor {

        override fun intercept(chain: Interceptor.Chain): okhttp3.Response {
            var request = chain.request()
            request =
                request.newBuilder().header("Authorization", " $tokenType $acceessToken").build()

            return chain.proceed(request)
        }
    }

    val client = OkHttpClient.Builder()
        .addInterceptor(OAuthInterceptor("Bearer ", apiKey))
        .build()

//    fun generateResponse(prompt: String?) {
//
//        val retrofit = Retrofit.Builder()
//            .baseUrl("https://api.openai.com")
//            .client(client)
//            .build()
//
//        val service = retrofit.create(APIService::class.java)
//
//        val jsonObject = JSONObject()
//        jsonObject.put("model", "text-davinci-003")
//        jsonObject.put("prompt  ", prompt)
//        jsonObject.put("temperature", 0)
//        jsonObject.put("max_tokens", 150)
//        jsonObject.put("top_p", 1)
//        jsonObject.put("frequency_penalty", 0)
//        jsonObject.put("presence_penalty", 0.6)
//        jsonObject.put("stop", JSONArray(arrayOf<Any>(" Human:", " AI:")))
//
//        val jsonObjectString = jsonObject.toString()
//        val requestBody = jsonObjectString.toRequestBody("application/json".toMediaTypeOrNull())
//        val call: retrofit2.Call<ResponseBody> = service.request(requestBody)
//        call.enqueue(object : Callback<ResponseBody?> {
//            override fun onResponse(call: Call<ResponseBody?>, response: Response<ResponseBody?>) {
//                val resultData = JsonObject()[response.body().toString()].asJsonObject
//                /*resultData.get("model")
//                resultData.get("prompt")
//                resultData.get("temperature")
//                resultData.get("max_tokens")
//                resultData.get("top_p")
//                resultData.get("frequency_penalty")
//                resultData.get("presence_penalty")
//                resultData.get("stop")*/
//            }
//
//            override fun onFailure(call: Call<ResponseBody?>, t: Throwable) {
//                TODO("Not yet implemented")
//            }
//
//        })
//    }
}