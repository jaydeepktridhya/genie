//
//  AppConstants.swift
//  keaBoardTridhya
//
//  Created by Aditya on 2022-03-10.
//

import UIKit

public enum buttons: Int , CaseIterable {

    case one = 1 ,two,three,four,five,six,seven,eight,nine,zero
    case a = 11  , b ,c ,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z
    case btnFeature = 37 , btnHide , btnshift , btnBack , btn123 , btnSpace , btnReturn , btnComma, btnEmojie, btnFullStop
    case btnAmpersat = 47, btnHash , btnDoller, btnPercentage, btnEpershand, btnStar , btnDash , btnEqual, btnRoundBrackerOpen, btnRoundBracketClose
    case btnChangeSpChar = 57, btnExclaimation, btnDoubleQuote, btnSingleQuote, btnColon, btnSemiColon, btnSlash , btnBackButton = 64
    case btTilde = 65 , btnPlusMinus, btnMultiplication,btnDivision, btnBullet, btnCelsius, btnbBackTickLeft, btnbBackTickRight, btnCurlyOpen, btnCurlyClose = 74
    
    case btnCopyRight = 75 , btnPound, btnEuro, btnFreeStanding ,btnRSign, btnY,  btnUnderScore,  btnSum, btnSquareOpen, btnSquareClose
    
    case btnInvertedExclaimation = 85 , btnLessThan, btnGreaterThan, btnCent, btnBar, btnDoubleSlash , btnInvertedQuestionMark, btnBackSpChar, btnShiftSpChar = 93
    
    case btnSetting = 94, btnTranslate , btnMaginPen, btnParaphrase, btnKeywordThemes, btnEmailReply, btnTextSummary = 100
    
    case textInputStackView = 101
    case btnBackEmoji = 102
    case dropDown = 103
    case dropDownContainerView = 104
    case btnTranslateView = 105 ,btnGrammerCheckView, btnParaphraseView,btnContinueWriting, btnReplyView , btnHelpMeWritingView , btnGlobal
    case btnSuggestionSend = 112
    case btnQuestionMark = 113
    case keyboardStackView = 996, emojiView
    case emojieCollectionView = 998
    case suggestionView = 999, alphaStackView = 1000, numberStackView = 1001 , specialChatStackView = 1002
    case fullAccessView = 1003, fullaccessContentView
    case numberBackView = 1005, collectionViewSuggestionTexts , viewSuggestionTexts
    
}

struct Constants {
    struct STRINGS {
        static let oneTwoThree = "123"
        static let abc = "ABC"
        static let hashKey = "#+="
        static let arrEmojies = Emojie.arrEmojiesValue
    }
}

enum AssetsColor {
   case actionKeyBackground
   case capsKeyBackground
   case charKeyBackground
   case header
   case keyboardKey
   case layoutBackgroud
case shiftKeyBackground
}

extension UIColor {

    static func appColor(_ name: AssetsColor) -> UIColor? {
        switch name {
        case .actionKeyBackground:
            return UIColor(named: "ActionKeyBackground")
        case .capsKeyBackground:
            return UIColor(named: "CapsKeyBackground")
        case .charKeyBackground:
            return UIColor(named: "CharKeyBackground")
        case .header:
            return UIColor(named: "Header")
        case .keyboardKey:
            return UIColor(named: "KeyboardKey")
        case .layoutBackgroud:
            return UIColor(named: "LayoutBackgroud")
        case .shiftKeyBackground:
            return UIColor(named: "ShiftKeyBackground")
        }
    }
}

enum DropDownType {
    case translate
    case replylist
    case paraphrase
    case none
}


public enum Translate : String , CaseIterable{
    case english = "English"
    case spanish = "Spanish"
    case french =  "French"
    case germen = "German"
    case japanese = "Japanese"
    case chinese = "Chinese"
    case hindi = "Hindi"
    case italian = "Italian"
    case seutsch = "Deutsch"
}

public enum ReplyType : String , CaseIterable{
    case interested = "Interested"
    case respectful = "Respectful"
    case casual = "Casual"
    case thankful = "Thankful"
    case negotiation = "Negotiation"
    case formal = "Formal"
    case explanatory = "Explanatory"
    case persuasive = "Persuasive"
    case empathetic = "Empathetic"
    case informative = "Informative"
    case argumentative = "Argumentative"
    case descriptive =  "Descriptive"
    case analytical = "Analytical"
    case suggestive = "Suggestive"
    case Inspirational = "Inspirational"
}

public enum Paraphrase : String, CaseIterable {
    case professional = "Professional"
    case plainLanguage = "Plain Language"
    case informal = "Informal"
    case formal = "Formal"
    case poetry = "Poetry"
    case funny = "Funny"
    case flitery = "Flirty"
    case pickUpLine = "Pickup line"
    case explanatory = "Explanatory"
    case persuasive = "Persuasive"
    case empathetic = "Empathetic"
    case informative = "Informative"
    case argumentative = "Argumentative"
    case descriptive =  "Descriptive"
    case analytical = "Analytical"
    case suggestive = "Suggestive"
    case Inspirational = "Inspirational"
}

enum FeatureType {
    case translate
    case emailReply
    case paraphrase
    case grammerCheck
    case continueWriting
    case helpMeWriting
    case suggestion
    case none
}
