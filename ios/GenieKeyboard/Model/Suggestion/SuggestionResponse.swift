//
//  SuggestionResponse.swift
//  GenieKeyboard
//
//  Created by Nidhi's Macbook Pro on 18/04/23.
//

import Foundation
struct SuggestionResponse : Codable {

    let language : String?
    let predictions : [Prediction]?
    let text : String?


    enum CodingKeys: String, CodingKey {
        case language = "language"
        case predictions = "predictions"
        case text = "text"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        language = try values.decodeIfPresent(String.self, forKey: .language)
        predictions = try values.decodeIfPresent([Prediction].self, forKey: .predictions)
        text = try values.decodeIfPresent(String.self, forKey: .text)
    }


}

// MARK: - Prediction
struct Prediction : Codable {

    let completionStartingIndex : Int?
    let modelUniqueIdentifier : String?
    let score : Double?
    let scoreBeforeRescoring : Double?
    let source : String?
    let text : String?


    enum CodingKeys: String, CodingKey {
        case completionStartingIndex = "completionStartingIndex"
        case modelUniqueIdentifier = "model_unique_identifier"
        case score = "score"
        case scoreBeforeRescoring = "scoreBeforeRescoring"
        case source = "source"
        case text = "text"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        completionStartingIndex = try values.decodeIfPresent(Int.self, forKey: .completionStartingIndex)
        modelUniqueIdentifier = try values.decodeIfPresent(String.self, forKey: .modelUniqueIdentifier)
        score = try values.decodeIfPresent(Double.self, forKey: .score)
        scoreBeforeRescoring = try values.decodeIfPresent(Double.self, forKey: .scoreBeforeRescoring)
        source = try values.decodeIfPresent(String.self, forKey: .source)
        text = try values.decodeIfPresent(String.self, forKey: .text)
    }


}
