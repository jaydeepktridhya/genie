//
//  KeyboardViewController+Actions.swift
//  GenieKeyboard
//
//  Created by MAC on 27/03/23.
//

import Foundation
import UIKit
extension KeyboardViewController {
    @objc func singleTapAction(_ sender: UIButton){
       
        if iscapitalize{
            iscapitalize = false
            isSwiftPressed = false
            counter = false
           
        }
        else{
            isSwiftPressed = !isSwiftPressed
            counter = true
           
        }
        
        if isSwiftPressed {
            if let button = keyboardView.viewWithTag(39) as? UIButton {
                button.setImage(UIImage(named: "Shift"), for: .normal)
                button.backgroundColor = UIColor.appColor(.shiftKeyBackground)
            }
        } else {
            if let button = keyboardView.viewWithTag(39) as? UIButton {
                button.setImage(UIImage(named: "smallLetter"), for: .normal)
                button.backgroundColor = UIColor.appColor(.actionKeyBackground)
            }
        }
        
      
        for iTag in buttons.allCases {
            if let iButton = self.keyboardView.viewWithTag(iTag.rawValue) as? UIButton{
                guard let btnTitle = isSwiftPressed ?  iButton.titleLabel?.text?.uppercased() : iButton.titleLabel?.text?.lowercased() else {
                    return
                }
                iButton.setTitle(btnTitle, for: .normal)
            }
        }
    }
    
    @objc func doubleTapAction(_ sender: UIButton){
        iscapitalize = !iscapitalize
        counter = false
        isSwiftPressed = false
        if let button = keyboardView.viewWithTag(39) as? UIButton {
            button.setImage(UIImage(named: "capsLock"), for: .normal)
            button.backgroundColor = UIColor.appColor(.shiftKeyBackground)
        }
       
        for iTag in buttons.allCases {
            if let iButton = self.keyboardView.viewWithTag(iTag.rawValue) as? UIButton{
                guard let btnTitle =   iButton.titleLabel?.text?.uppercased() else {
                    return
                }
                iButton.setTitle(btnTitle, for: .normal)
            }
        }
    }
    @objc func emojieBtnTapped(_ sender: UIButton){
        if let keyboardStackView  = keyboardView.viewWithTag(996) as? UIStackView, let emojiView  = keyboardView.viewWithTag(997) {
            keyboardStackView.isHidden = true
            emojiView.isHidden = false
            if let emojieCollectionView  = keyboardView.viewWithTag(998) as? UICollectionView{
                emojieCollectionView.reloadData()
            }
        }
    }
    
    @objc func btnMoveToSpecialChar(_ sender: UIButton){
        print("Move to special")
        if isNumberSelected {
            isNumberSelected = false
            if let numberstackView = self.keyboardView.viewWithTag(1001) as? UIStackView{
                numberstackView.isHidden = true
            }
            if let specialCharView = self.keyboardView.viewWithTag(1002) as? UIStackView{
                specialCharView.isHidden = false
            }
            if let numberBackView = self.keyboardView.viewWithTag(1005){
                numberBackView.isHidden = false
            }
            if let iButton = self.keyboardView.viewWithTag(57) as? UIButton{
                iButton.setTitle(Constants.STRINGS.oneTwoThree, for: .normal)
            }
        } else {
            isNumberSelected = true
            if let numberstackView = self.keyboardView.viewWithTag(1001) as? UIStackView{
                numberstackView.isHidden = false
            }
            if let specialCharView = self.keyboardView.viewWithTag(1002) as? UIStackView{
                specialCharView.isHidden = true
            }
            if let numberBackView = self.keyboardView.viewWithTag(1005){
                numberBackView.isHidden = false
            }
            if let iButton = self.keyboardView.viewWithTag(57) as? UIButton{
                iButton.setTitle(Constants.STRINGS.hashKey, for: .normal)
            }
        }
    }
    
    @objc func btnMoveToNumber(_ sender: UIButton){
        if isAlphaSelected {
            isAlphaSelected = false
            isNumberSelected = true
            if let iButton = self.keyboardView.viewWithTag(57) as? UIButton{
                iButton.setTitle(Constants.STRINGS.hashKey, for: .normal)
            }
            if let iButton = self.keyboardView.viewWithTag(41) as? UIButton{
                iButton.setTitle(Constants.STRINGS.abc, for: .normal)
            }
            if let alphastackView = self.keyboardView.viewWithTag(1000) as? UIStackView{
                alphastackView.isHidden = true
            }
            if isNumberSelected {
                if let numberstackView = self.keyboardView.viewWithTag(1001) as? UIStackView{
                    numberstackView.isHidden = false
                }
                if let specialCharView = self.keyboardView.viewWithTag(1002) as? UIStackView{
                    specialCharView.isHidden = true
                }
            }
            if let numberBackView = self.keyboardView.viewWithTag(1005){
                numberBackView.isHidden = false
            }
//            if let btnEmojie = self.keyboardView.viewWithTag(45) as? UIButton {
////                btnComma.isHidden = false
////                btnFullStop.isHidden = false
//                btnEmojie.isHidden = true
//            }
        } else {
            isAlphaSelected = true
            isNumberSelected = true
            if let iButton = self.keyboardView.viewWithTag(57) as? UIButton{
                iButton.setTitle(Constants.STRINGS.oneTwoThree, for: .normal)
            }
            if let iButton = self.keyboardView.viewWithTag(41) as? UIButton{
                iButton.setTitle(Constants.STRINGS.oneTwoThree, for: .normal)
            }
            if let alphastackView = self.keyboardView.viewWithTag(1000) as? UIStackView{
                alphastackView.isHidden = false
            }
            if let numberstackView = self.keyboardView.viewWithTag(1001) as? UIStackView{
                numberstackView.isHidden = true
            }
            if let specialCharView = self.keyboardView.viewWithTag(1002) as? UIStackView{
                specialCharView.isHidden = true
            }
            if let numberBackView = self.keyboardView.viewWithTag(1005){
                numberBackView.isHidden = true
            }
//            if let btnEmojie = self.keyboardView.viewWithTag(45) as? UIButton {
////                btnComma.isHidden = true
////                btnFullStop.isHidden = true
//                btnEmojie.isHidden = false
//            }
        }
    }
    @objc func handleLongPress(_ gestureRecognizer: UIGestureRecognizer) {
        (textDocumentProxy as UIKeyInput).deleteBackward()
   }
    @objc func backBtnTapped(_ sender: UIButton){
        if !self.isShowContinueWriting {
            (textDocumentProxy as UIKeyInput).deleteBackward()
            
            if let lastWord = textDocumentProxy.documentContextBeforeInput?.components(separatedBy: " ").last , lastWord != "" {
                if hasAccess && !isShowContinueWriting{
                    guard let viewModel = self.viewModel else {
                        return
                    }
                    let promptString = APIUrl.OpenAIQuery.suggestion + "'\(lastWord)'"
                    print(promptString)
//                    viewModel.openAIAPI(prompt: promptString, type: .suggestion,temperature: 0,max_tokens: 1000,frequency_penalty: 0, presence_penalty: 0)
                    viewModel.suggestionAPI(prompt: lastWord, type: .suggestion)
                }
            } else {
                self.arrSuggestionString.removeAll()
                if let  collectionView = keyboardView.viewWithTag(1006) as? UICollectionView {
                    collectionView.reloadData()
                }
            }
        }
        else{
            if let txtSuggestion = self.keyboardView.viewWithTag(1111) as? UITextField {
                txtSuggestion.deleteBackward()
            }
        }
    }
    
    @objc func spaceBtnTapped(_ sender: UIButton){
        if !self.isShowContinueWriting {
                    let proxy = textDocumentProxy as UITextDocumentProxy
                    proxy.insertText(" ")
                }
                else{
                    if let txtSuggestion = self.keyboardView.viewWithTag(1111) as? UITextField {
                        txtSuggestion.insertText(" ")
                    }
                }
         
        if !arrSuggestionString.isEmpty {
            self.arrSuggestionString.removeAll()
            if let  collectionView = keyboardView.viewWithTag(1006) as? UICollectionView {
                collectionView.reloadData()
            }
        }
       
        
    }
    @objc func returnBtntapped(_ sender: UIButton){
        let proxy = textDocumentProxy as UITextDocumentProxy
        proxy.insertText("\n")
        
    }
    @objc func btnWasTapped(_ sender: UIButton){
        let proxy = textDocumentProxy as UITextDocumentProxy
               if let input = sender.titleLabel?.text as String? {
                   if !self.isShowContinueWriting {
                       proxy.insertText(input)
                   }
                   else{
                       if let txtSuggestion = self.keyboardView.viewWithTag(1111) as? UITextField {
                           txtSuggestion.insertText(input)
                       }
                   }
               }
        guard let viewModel = self.viewModel else {
            return
        }
        if hasAccess && !isShowContinueWriting{
            let lastWord = proxy.documentContextBeforeInput?.components(separatedBy: " ").last ?? ""
            let promptString = APIUrl.OpenAIQuery.suggestion + "'\(lastWord)'"
//            viewModel.openAIAPI(prompt: promptString, type: .suggestion,temperature: 0,max_tokens: 1000,frequency_penalty: 0, presence_penalty: 0)
            viewModel.suggestionAPI(prompt: lastWord, type: .suggestion)
        }
        if counter == true {
            for iTag in buttons.allCases {
                if let iButton = self.keyboardView.viewWithTag(iTag.rawValue) as? UIButton{
                    
                    guard let btnTitle = iButton.titleLabel?.text?.lowercased() else {
                        return
                    }
                    iButton.setTitle(btnTitle, for: .normal)
                    isSwiftPressed = false
                }
            }
        }
       
       
    }
    
    @objc func btnSettingTapped(_ sender: UIButton){
        openApp("Genie://com.tridhya.genie")
        makeHiddenDropDownList()
    }
    @objc func openURL(_ url: URL) {
           return
        }

        func openApp(_ urlstring:String) {
           var responder: UIResponder? = self as UIResponder
           let selector = #selector(openURL(_:))
           while responder != nil {
              if responder!.responds(to: selector) && responder != self {
                 responder!.perform(selector, with: URL(string: urlstring)!)
                 return
              }
              responder = responder?.next
            }
         }

    @objc func btnTranslateTapped(_ sender: UIButton){
        if hasAccess {
            sender.isEnabled = !sender.isEnabled
            dropDownType = .translate
            currentDropListArray = self.arrTranslate
            if let popUpTableView  = keyboardView.viewWithTag(103) as? UITableView{
                popUpTableView.snp.removeConstraints()
                if let btnTranslate = keyboardView.viewWithTag(95) as? UIButton{
                    popUpTableView.snp.makeConstraints { make in
                        make.left.equalTo(btnTranslate.snp.left).offset(0)
    //                    make.right.equalTo(btnTranslate.snp.right).offset(0)
                        make.top.equalTo(btnTranslate.snp.bottom).offset(0)
                        make.width.equalTo(150)
                        make.height.equalTo(self.arrTranslate.count <= 5 ? self.arrTranslate.count * 40 : 5*40)
                    }
                    manageLayout()
                  
                }
                popUpTableView.isHidden = false
                if let dropDownContainerView  = keyboardView.viewWithTag(104){
                    dropDownContainerView.isHidden = false
                }
                changeActionButtonState(sender: sender)
                popUpTableView.reloadData()
               
            }
        } else {
            self.allowAccessPopUpView()
//            let alert = UIAlertController(title: "Alert", message: "Allow Full Access to your keyboard", preferredStyle: UIAlertController.Style.alert)
//            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
        }
       
    }
    @objc func btnMagicPenTapped(_ sender: UIButton){
        if hasAccess {
            changeActionButtonState(sender: nil)
            makeHiddenDropDownList()
            self.handleDropOptionSelection(type: FeatureType.grammerCheck)
        } else {
            self.allowAccessPopUpView()
        }
      
        
    }
    @objc func btnParaphraseTapped(_ sender: UIButton){
        if hasAccess {
            dropDownType = .paraphrase
            currentDropListArray = self.arrParaphraseList
            if let popUpTableView  = keyboardView.viewWithTag(103) as? UITableView{
                popUpTableView.snp.removeConstraints()
                if let button = keyboardView.viewWithTag(97) as? UIButton{
                    popUpTableView.snp.makeConstraints { make in
                        make.left.equalTo(button.snp.left).offset(0)
                        make.top.equalTo(button.snp.bottom).offset(0)
                        make.width.equalTo(150)
                        make.height.equalTo(self.arrParaphraseList.count <= 5 ? self.arrParaphraseList.count * 40 : 5*40)
                    }
                    manageLayout()
                }
                popUpTableView.isHidden = false
                if let dropDownContainerView  = keyboardView.viewWithTag(104){
                    dropDownContainerView.isHidden = false
                }
                changeActionButtonState(sender: sender)
                popUpTableView.reloadData()
            }
        }  else {
            self.allowAccessPopUpView()
        }
       
        
    }
    @objc func btnContinueWritingTapped(_ sender: UIButton){
        if hasAccess {
            changeActionButtonState(sender: nil)
            setUpTextInputView()
        } else {
            self.allowAccessPopUpView()
        }
        
        
    }
    
    @objc func btnAboutSendTapped(_ sender: UIButton){
        self.handleDropOptionSelection(type: FeatureType.continueWriting)
        setUpTextInputView()
    }
    
    
    @objc func btnEmailReplyTapped(_ sender: UIButton){
        if hasAccess {
            dropDownType = .replylist
            currentDropListArray = self.arrReplyList
            if let popUpTableView  = keyboardView.viewWithTag(103) as? UITableView{
                popUpTableView.snp.removeConstraints()
                if let button = keyboardView.viewWithTag(99) as? UIButton{
                    popUpTableView.snp.makeConstraints { make in
                        make.right.equalTo(button.snp.right).offset(0)
                        make.top.equalTo(button.snp.bottom).offset(0)
                        make.width.equalTo(150)
                        make.height.equalTo(self.arrReplyList.count <= 5 ? self.arrReplyList.count * 40 : 5*40)
                    }
                    manageLayout()
                }
                popUpTableView.isHidden = false
                if let dropDownContainerView  = keyboardView.viewWithTag(104){
                    dropDownContainerView.isHidden = false
                }
                changeActionButtonState(sender: sender)
                popUpTableView.reloadData()
            }
        } else {
            self.allowAccessPopUpView()
        }
      
    }
    
    @objc func btnHelpMeWritingTapped(_ sender: UIButton){
        if hasAccess {
            changeActionButtonState(sender: nil)
            makeHiddenDropDownList()
            self.handleDropOptionSelection(type: FeatureType.helpMeWriting)
        }  else {
            self.allowAccessPopUpView()
        }
    }
    
    @objc func btnBackEmojiTapped(_ sender: UIButton){
        if let keyboardStackView  = keyboardView.viewWithTag(996) as? UIStackView, let emojiView  = keyboardView.viewWithTag(997) {
            keyboardStackView.isHidden = false
            emojiView.isHidden = true
        }
    }
    func changeActionButtonState(sender:UIButton?) {
        self.arrTopActionButtons.forEach { button in
            button?.isEnabled = true
        }
        if sender != nil {
            sender?.isEnabled = false
        }
    }
    
    func makeHiddenDropDownList() {
        if let popUpTableView  = keyboardView.viewWithTag(103) as? UITableView{
            popUpTableView.isHidden = true
            if let dropDownContainerView  = keyboardView.viewWithTag(104){
                dropDownContainerView.isHidden = true
            }
        }
    }
    
    @objc func dropContainerTapped(_ sender: UITapGestureRecognizer? = nil) {
            makeHiddenDropDownList()
            self.changeActionButtonState(sender: nil)
    }
}
