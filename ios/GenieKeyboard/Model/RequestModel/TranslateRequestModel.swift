//
//  TranslateRequestModel.swift
//  GenieKeyboard
//
//  Created by MAC on 27/03/23.
//

import Foundation

struct RequestModel : Encodable {
    let model:String
    let prompt:String
    let temperature:Float
    let max_tokens:Float
    let frequency_penalty : Float
    let presence_penalty:Float
    
    enum CodingKeys: String,CodingKey {
        case model
        case prompt
        case temperature
        case max_tokens
        case frequency_penalty
        case presence_penalty
    }
   
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(model, forKey: .model)
        try container.encode(prompt, forKey: .prompt)
        try container.encode(temperature, forKey: .temperature)
        try container.encode(max_tokens, forKey: .max_tokens)
        try container.encode(frequency_penalty, forKey: .frequency_penalty)
        try container.encode(presence_penalty, forKey: .presence_penalty)
    }
}

