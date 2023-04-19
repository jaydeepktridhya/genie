//
//  OpenAIViewModel.swift
//  GenieKeyboard
//
//  Created by MAC on 27/03/23.
//

import Foundation


class OpenAIViewModel {
    // MARK: Properties
    
    var error: GenieError? {
        didSet {
            if error != nil {
                self.showAlertClosure?()
            }
        }
    }
    
    var isLoading: Bool = false {
        didSet { self.updateLoadingStatus?() }
    }
    
    var message: String?
    var reponseText :String?
    var featureType : FeatureType = .none
    var showAlertClosure: (() -> Void)?
    var updateLoadingStatus: (() -> Void)?
    var arrSuggestions = [String]()
    var didFinishFetch: ((_ type:FeatureType) -> Void)?
    
    func openAIAPI(prompt:String, type : FeatureType, temperature : Float = 0.6, max_tokens:Float = 2000, frequency_penalty:Float = 1, presence_penalty:Float = 1) {
        print(prompt)
        let requestModel = RequestModel(model: APIUrl.modelName, prompt: prompt, temperature:temperature, max_tokens: max_tokens, frequency_penalty: frequency_penalty, presence_penalty: presence_penalty)
            
            featureType = type
            isLoading = true
            let dictionaryParam = requestModel.dictionary ?? [:]
            let data = try! JSONSerialization.data(withJSONObject: dictionaryParam, options: [])
        let request = APIRequest(baseURL:URL(string: APIUrl.Base_URL.baseUrl),method: .post, path: APIUrl.EndPoints.completions,type: type ,params: data)
            APIClient().perform(request) { (result) in
                switch result {
                case .success(let response):
                    if let response = try? response.decode(to: Reponse.self) {
                        let data = response.body
                        print(data)
                        var responseText = data.choices?.first?.text ?? ""
                        if responseText.hasPrefix("\n\n") {
                            responseText.remove(at: responseText.startIndex)
                            responseText.remove(at: responseText.startIndex)
                        }
                        self.reponseText = responseText
                        self.isLoading = false
                        self.didFinishFetch?(type)
                    } else {
                        print(self.error as Any)
                        self.isLoading = false
                        self.error = GenieError(strMessage: self.error?.strMessage ?? "Error on decode value", code: nil, type: self.error?.type ?? "")
                    }
                case .failure(let error):
                    self.isLoading = false
                    print(error.localizedDescription)
                    self.error = error as? GenieError
                }
            }
    }
    
    func suggestionAPI(prompt:String, type : FeatureType) {
        print(prompt)
            featureType = type
            isLoading = true
            let dictionaryParam = [ "text": prompt,
                                    "correctTypoInPartialWord": false,
                                    "language": "en",
                                    "maxNumberOfPredictions": 8] as [String : Any]
            let data = try! JSONSerialization.data(withJSONObject: dictionaryParam, options: [])
        let request = APIRequest(baseURL:URL(string: APIUrl.Base_URL.suggestionBaseUrl),method: .post, path: APIUrl.EndPoints.suggestion,type: type,params: data)
            APIClient().perform(request) { (result) in
                switch result {
                case .success(let response):
                    if let response = try? response.decode(to: SuggestionResponse.self) {
                        let data = response.body
                        print(data)
                       
                        let arrSuggestion = data.predictions?.map({ prediction in
                            return prediction.text ?? ""
                        }).removingDuplicates()
                        self.arrSuggestions = arrSuggestion ?? []
                        self.isLoading = false
                        self.didFinishFetch?(type)
                    } else {
                        print(self.error as Any)
                        self.isLoading = false
                        self.error = GenieError(strMessage: self.error?.strMessage ?? "Error on decode value", code: nil, type: self.error?.type ?? "")
                    }
                case .failure(let error):
                    self.isLoading = false
                    print(error.localizedDescription)
                    self.error = error as? GenieError
                }
            }
    }
    
}
