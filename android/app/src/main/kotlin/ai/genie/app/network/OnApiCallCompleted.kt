package ai.genie.app

import org.json.JSONObject

/**
 * API call back response with success or failure
 */
interface OnApiCallCompleted<T> {
    fun apiSuccess(obj: Any?)

    fun apiFailure(errorMessage: String)

    fun apiFailureWithCode(errorObject: JSONObject, code: Int)
}