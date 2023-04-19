//
//  APIUrl.swift
//  GenieKeyboard
//
//  Created by MAC on 27/03/23.
//

import Foundation
struct APIUrl {
    
    static let modelName = "text-davinci-003"
    
    struct Base_URL {
        static let baseUrl = "https://api.openai.com"
        static let suggestionBaseUrl = "https://typewise-ai.p.rapidapi.com"
    }
   
    struct EndPoints {
        static let completions = "/v1/completions"
        static let suggestion = "/completion/complete"
    }
    
    struct HeaderConfig  {
        static let rapidAPIKey = "340d3275bdmshaf84670e55123fcp182958jsn6f5b4c32bfe1"
        static let rapidAPIHost = "typewise-ai.p.rapidapi.com"
        static let openAIAPIAuthToken = "Bearer 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"
      
    }
    struct OpenAIQuery {
        static let suggestion = "Suggest comma separated result of similar word for "
    }
}

struct GenieError: Error {
    var strMessage: String
    var code: String?
    var param : String?
    var type : String
}


extension GenieError: LocalizedError {
    var errorDescription: String? {
        return strMessage
    }
}

extension Error {
    var errorCode: Int {
        return Int((self as! GenieError).code ?? "404") ?? 404
    }
}
