package ai.genie.app.apiCall;

import static ai.genie.app.util.Constant.AUTH_TOKEN;
import static ai.genie.app.util.Constant.AUTH_TOKEN_TYPEWISE;
import static ai.genie.app.util.Constant.TYPEWISE_HOST;

import com.google.gson.JsonObject;

import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.Headers;
import retrofit2.http.POST;

public interface RetrofitInterface {

    @Headers({
            "Accept: application/json",
            "Authorization: Bearer " + AUTH_TOKEN
    })
    @POST("/v1/completions")
    Call<JsonObject> request(
            @Body JsonObject value
    );

    @Headers({
            "Content-Type: application/json",
            "X-RapidAPI-Key:" + AUTH_TOKEN_TYPEWISE,
            "X-RapidAPI-Host:" + TYPEWISE_HOST
    })
    @POST("/completion/complete")
    Call<JsonObject> requestSuggestion(
            @Body JsonObject value
    );

}
