package ai.genie.app.apiCall;

import static ai.genie.app.util.Constant.BASE_URL;
import static ai.genie.app.util.Constant.BASE_URL_TYPEWISE;

import java.io.IOException;
import java.util.Collections;

import okhttp3.Interceptor;
import okhttp3.OkHttpClient;
import okhttp3.Protocol;
import okhttp3.Request;
import okhttp3.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class ApiRetrofit {

    public static RetrofitInterface getClient() {

        OkHttpClient.Builder httpClient = new OkHttpClient.Builder();
        httpClient.addInterceptor(new Interceptor() {
            @Override
            public Response intercept(Chain chain) throws IOException {
                Request original = chain.request();

                Request request = original.newBuilder()
                        .build();

                return chain.proceed(request);
            }
        });
        // change your base URL
        Retrofit adapter = new Retrofit.Builder()
                .baseUrl(BASE_URL)
                .client(httpClient.build())
                .addConverterFactory(GsonConverterFactory.create())
                .build(); //Finally building the adapter

        //Creating object for our interface
        RetrofitInterface api = adapter.create(RetrofitInterface.class);
        return api; // return the APIInterface object
    }

    public static RetrofitInterface getSuggestionClient() {

        OkHttpClient.Builder httpClient = new OkHttpClient.Builder();
        httpClient.addInterceptor(new Interceptor() {
            @Override
            public Response intercept(Chain chain) throws IOException {
                Request original = chain.request();

                Request request = original.newBuilder()
                        .build();

                return chain.proceed(request);
            }
        });
        // change your base URL
        Retrofit adapter = new Retrofit.Builder()
                .baseUrl(BASE_URL_TYPEWISE)
                .client(httpClient.build())
                .addConverterFactory(GsonConverterFactory.create())
                .build(); //Finally building the adapter

        //Creating object for our interface
        RetrofitInterface api = adapter.create(RetrofitInterface.class);
        return api; // return the APIInterface object
    }
}
