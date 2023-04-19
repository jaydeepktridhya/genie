//
//  KeyboardViewController.swift
//  keaBoardTridhya
//
//  Created by Aditya on 2022-03-09.
//

import UIKit
class KeyboardViewController: UIInputViewController , ActivityIndicatorPresenter{

   
    // MARK: Outlets-
    
    @IBOutlet var nextKeyboardButton: UIButton!
    
    // MARK: Variables-
    var keyboardView = UIView()
    var activityIndicator =  UIActivityIndicatorView()
    var accessPopUpView = UIView()
    var isSwiftPressed = false
    var iscapitalize = false
    var counter = false
    var isAlphaSelected = true
    var isNumberSelected = true
    var isShowContinueWriting = false
    var arrTranslate = Translate.allCases
    var arrReplyList = ReplyType.allCases
    var arrParaphraseList = Paraphrase.allCases
    var currentDropListArray = [Any]()
    var selectedOption:Any?
    var arrEmojies = [String]()
    var arrSuggestionString = [String]()
    var dropDownType :DropDownType = .translate
    var viewModel : OpenAIViewModel?
    var wholeTextString = ""
    var arrTopActionButtons = [UIButton?]()
    var hasAccess: Bool {
        get{
            if #available(iOSApplicationExtension 11.0, *) {
                return self.hasFullAccess
            } else {
                return UIDevice.current.identifierForVendor != nil
            }
        }
    }

    var userLexicon: UILexicon?
    var textInputDelegate: UITextInputDelegate?
    // MARK: View Life Cycle-
    override func loadView() {
        super.loadView()
        loadInterface()
        loadEmojies()
        setUpViewModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textInputDelegate = self
        self.requestSupplementaryLexicon { (lexicon) in
            self.userLexicon = lexicon
        }
        setUpTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setUpKeyboardHeight()
        self.preAnimationSetUpTextInputView()
    }

    
    // MARK: Functions-
    func loadInterface() {
        // load the nib file
        let customKeyBoard = UINib(nibName: "KeyBoardView", bundle: nil)
        // instantiate the view
        keyboardView = customKeyBoard.instantiate(withOwner: self, options: nil)[0] as! UIView
        keyboardView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 310)
        view.addSubview(keyboardView)
        
        for iTag in buttons.allCases {
            if let iButton  = keyboardView.viewWithTag(iTag.rawValue) as? UIButton{
                iButton.layer.cornerRadius = 6
                if iTag.rawValue < 94 || iTag.rawValue > 100 &&  iTag.rawValue != 102 && iTag.rawValue != 112 {
                    iButton.keyShadow()
                }
              
                if iTag.rawValue == 93 || iTag.rawValue == 41 || iTag.rawValue == 42 || iTag.rawValue == 43 || iTag.rawValue == 57 {
                    iButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
                } else {
                    iButton.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .regular)
                }
               
                switch iTag.rawValue {
                case 45:
                    iButton.addTarget(self, action: #selector(emojieBtnTapped(_:)), for: .touchUpInside)
                case 42:
                    iButton.addTarget(self, action: #selector(spaceBtnTapped(_:)), for: .touchUpInside)
                case 57,93:
                    iButton.addTarget(self, action: #selector(btnMoveToSpecialChar(_:)), for: .touchUpInside)
                    
                case 41:
                    iButton.addTarget(self, action: #selector(btnMoveToNumber(_:)), for: .touchUpInside)
               
                case 39:
                    iButton.isUserInteractionEnabled = true
                    let singleTap = UITapGestureRecognizer(target: self, action:#selector(self.singleTapAction(_:)))
                    singleTap.numberOfTapsRequired = 1
                    iButton.addGestureRecognizer(singleTap)

                    let doubleTap = UITapGestureRecognizer(target: self, action:#selector(self.doubleTapAction(_:)))
                    doubleTap.numberOfTapsRequired = 2
                    iButton.addGestureRecognizer(doubleTap)

                    singleTap.require(toFail: doubleTap)
//                    iButton.addTarget(self, action: #selector(shiftBtnTapped(_:event:)), for: .touchUpInside)
                case 40,64, 92:
                    iButton.isUserInteractionEnabled = true
                    let singleTap = UITapGestureRecognizer(target: self, action:#selector(self.backBtnTapped(_:)))
                    singleTap.numberOfTapsRequired = 1
                    iButton.addGestureRecognizer(singleTap)
                    
                    let longPress = UILongPressGestureRecognizer(target: self, action: #selector(backBtnTapped(_:)))
//                      longPress.minimumPressDuration = 0.5
//                      longPress.numberOfTouchesRequired = 1
//                      longPress.allowableMovement = 0.5
                        iButton.addGestureRecognizer(longPress)
//                    iButton.addTarget(self, action: #selector(backBtnTapped(_:)), for: .touchUpInside)
                case 43:
                    iButton.addTarget(self, action: #selector(returnBtntapped(_:)), for: .touchUpInside)
                case 94:
                    // Setting Button
                    iButton.addTarget(self, action: #selector(btnSettingTapped(_:)), for: .touchUpInside)
                case 95:
                    iButton.addTarget(self, action: #selector(btnTranslateTapped(_:)), for: .touchUpInside)
                case 96:
                    iButton.addTarget(self, action: #selector(btnMagicPenTapped(_:)), for: .touchUpInside)
                case 97:
                    iButton.addTarget(self, action: #selector(btnParaphraseTapped(_:)), for: .touchUpInside)
                case 98:
                    iButton.addTarget(self, action: #selector(btnContinueWritingTapped(_:)), for: .touchUpInside)
                case 99:
                    iButton.addTarget(self, action: #selector(btnEmailReplyTapped(_:)), for: .touchUpInside)
                case 100:
                    // Help me Writing
                    iButton.addTarget(self, action: #selector(btnHelpMeWritingTapped(_:)), for: .touchUpInside)
                case 102:
                    iButton.addTarget(self, action: #selector(btnBackEmojiTapped(_:)), for: .touchUpInside)
                    
                case 111:
                    iButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
                case 112:
                    iButton.addTarget(self, action: #selector(btnAboutSendTapped(_:)), for: .touchUpInside)
                    
                default:
                    iButton.addTarget(self, action: #selector(btnWasTapped(_:)), for: .touchUpInside)
                }
            }
            
        }
        if let shiftButton = keyboardView.viewWithTag(39) as? UIButton {
            self.singleTapAction(shiftButton)
        }
       
       
        
        self.arrTopActionButtons = [keyboardView.viewWithTag(95) as? UIButton,
                                    keyboardView.viewWithTag(96) as? UIButton,
                                    keyboardView.viewWithTag(97) as? UIButton,
                                    keyboardView.viewWithTag(98) as? UIButton,
                                    keyboardView.viewWithTag(99) as? UIButton,
                                    keyboardView.viewWithTag(100) as? UIButton]
//        self.allowAccessPopUpView()
        // copy the background color
        view.backgroundColor = keyboardView.backgroundColor
    }
    
    
    func setUpViewModel() {
        self.viewModel = OpenAIViewModel()
        
        guard let viewModel = viewModel else {
            return
        }
        
        viewModel.showAlertClosure = { [self] in
        
        }
        
        viewModel.updateLoadingStatus = { [self] in
            switch viewModel.featureType {
            case .translate:
                if let actionView = keyboardView.viewWithTag(105) {
                    viewModel.isLoading ? showActivityIndicator(view: actionView) : hideActivityIndicator(view: actionView)
                }
            case .grammerCheck:
                if let actionView = keyboardView.viewWithTag(106) {
                    viewModel.isLoading ? showActivityIndicator(view: actionView) : hideActivityIndicator(view: actionView)
                }
            case .paraphrase:
                if let actionView = keyboardView.viewWithTag(107) {
                    viewModel.isLoading ? showActivityIndicator(view: actionView) : hideActivityIndicator(view: actionView)
                }
            case .continueWriting:
                if let actionView = keyboardView.viewWithTag(108) {
                    viewModel.isLoading ? showActivityIndicator(view: actionView) : hideActivityIndicator(view: actionView)
                }
            case .emailReply:
                if let actionView = keyboardView.viewWithTag(109) {
                    viewModel.isLoading ? showActivityIndicator(view: actionView) : hideActivityIndicator(view: actionView)
                }
         
            case .helpMeWriting:
                if let actionView = keyboardView.viewWithTag(110) {
                    viewModel.isLoading ? showActivityIndicator(view: actionView) : hideActivityIndicator(view: actionView)
                }
            case .suggestion :
                break
            case .none:
               break
            }
            
        }
        
        viewModel.didFinishFetch = { [self] featureType in
            let responseText = viewModel.reponseText ?? ""
            if featureType != .suggestion {
                if let proxy = textDocumentProxy as? UITextDocumentProxy {
                    let beforeSelectedText = proxy.documentContextBeforeInput ?? ""
                    let afterSelectedText = proxy.documentContextAfterInput ?? ""
                    let selectedText = proxy.selectedText ?? ""
                    wholeTextString = beforeSelectedText + selectedText + afterSelectedText
                    wholeTextString.forEach { character in
                            (proxy as UIKeyInput).deleteBackward()
                    }
                    proxy.insertText(responseText)
                    if featureType == .continueWriting {
                        DispatchQueue.main.async {
                            if let txtSuggestion = self.keyboardView.viewWithTag(1111) as? UITextField {
                                txtSuggestion.text = ""
                            }
                        }
                    }
                }
            } else {
                if let arrString = viewModel.arrSuggestions as? [String] {
                    if !arrString.isEmpty {
                        self.arrSuggestionString.removeAll()
                        if arrString.count >= 3 {
                            for n in 0...2 {
                                self.arrSuggestionString.append(arrString[n])
                            }
                        } else {
                            self.arrSuggestionString = arrString
                        }
                      
                    }
                  
                    DispatchQueue.main.async {
                        if let collectionViewSuggestion  = self.keyboardView.viewWithTag(1006) as? UICollectionView{
                            collectionViewSuggestion.reloadData()
                        }
                    }
                }
      
               
            }
           
            
        }
    }
    
    func setUpKeyboardHeight() {
        var desiredHeight:CGFloat!

        if UIDevice.current.userInterfaceIdiom == .phone{

            if traitCollection.verticalSizeClass == .regular {
                desiredHeight = 310
            }
            else{
                //Keyboard is in Landscape
                desiredHeight = 250
            }

        }else{
            if UIDevice.current.orientation == .portrait{
                desiredHeight = 310

            }else {
                desiredHeight = 250

            }
        }
        
        view.snp.removeConstraints()
        view.snp.makeConstraints { make in
            make.leading.equalTo(0)
            make.top.equalTo(0)
            make.trailing.equalTo(0)
            make.height.equalTo(desiredHeight)
        }
        UIView.animate(withDuration: 0) {
            self.view.layoutIfNeeded()
        }
    }
    
    func preAnimationSetUpTextInputView() {
        if let stackView = self.keyboardView.viewWithTag(101) as? UIStackView{
            stackView.frame.origin.x = -UIScreen.main.bounds.width
            stackView.isHidden = true
        }
        if let suggestionView = self.keyboardView.viewWithTag(1007) {
            suggestionView.isHidden = false
        }
    }
    

    func handleTextInputReturnType() {
        if let returnTitle = self.textDocumentProxy.returnKeyType {
            let type = UIReturnKeyType(rawValue: returnTitle.rawValue)
            guard let retTitle = type?.get(rawValue: (type?.rawValue)!) else {return}
            if let returnButton = keyboardView.viewWithTag(43) as? UIButton   {
                returnButton.setTitle(retTitle, for: .normal)
            }
        }
    }
    func setUpTextInputView() {
        print("self.isShowContinueWriting", self.isShowContinueWriting)
        if let stackView = self.keyboardView.viewWithTag(101) as? UIStackView{
            if let suggestionView = self.keyboardView.viewWithTag(1007) {
                    if !self.isShowContinueWriting {
                        suggestionView.isHidden = true
                        stackView.isHidden = false
                    }
            }
          
            
            UIView.animate(
                withDuration: 0.4,
                delay: 0.0,
                options: .curveLinear,
                animations: {
                    if self.isShowContinueWriting {
                        stackView.frame.origin.x = stackView.frame.width
                    } else {
                        stackView.frame.origin.x += stackView.frame.width
                    }
                }) { (completed) in
                        if !self.isShowContinueWriting {
                            stackView.frame.origin.x = 0.0
                            self.isShowContinueWriting = true
                        }
                        else{
                            stackView.frame.origin.x = -(stackView.frame.width)
                            self.isShowContinueWriting = false
                            if let suggestionView = self.keyboardView.viewWithTag(1007) {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4, execute: {
                                    suggestionView.isHidden = false
                                    stackView.isHidden = true
                                })
                                
                            }
                        }
                }
//            if isShowContinueWriting {
//                if let suggestionView = self.keyboardView.viewWithTag(1007) {
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4, execute: {
//                        suggestionView.isHidden = true
//                        stackView.isHidden = false
//                    })
//
//                }
//            } else {
//                if let suggestionView = self.keyboardView.viewWithTag(1007) {
//                    suggestionView.isHidden = false
//                    stackView.isHidden = true
//                }
//            }
        }
    }
    
  
    
    
    func setUpTableView() {
        if let dropDownContainerView  = keyboardView.viewWithTag(104){
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.dropContainerTapped(_:)))
            dropDownContainerView.isUserInteractionEnabled = true
            dropDownContainerView.isHidden = true
            dropDownContainerView.addGestureRecognizer(tap)
        }
        
        if let popUpTableView  = keyboardView.viewWithTag(103) as? UITableView{
            popUpTableView.delegate = self
            popUpTableView.dataSource = self
            let nib = UINib(nibName: "DropDownCell", bundle: nil)
            popUpTableView.register(nib, forCellReuseIdentifier: "DropDownCell")
            popUpTableView.layer.cornerRadius = 8
            popUpTableView.translatesAutoresizingMaskIntoConstraints = false
            popUpTableView.snp.removeConstraints()
        }
    }
    
   
    
    func setUpCollectionView() {
        if let collectionView  = keyboardView.viewWithTag(998) as? UICollectionView{
            collectionView.delegate = self
            collectionView.dataSource = self
            let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
            collectionView.register(nib, forCellWithReuseIdentifier: "CollectionViewCell")
            collectionView.reloadData()
        }
        if let collectionViewSuggestion  = keyboardView.viewWithTag(1006) as? UICollectionView{
            collectionViewSuggestion.delegate = self
            collectionViewSuggestion.dataSource = self
            let nib = UINib(nibName: "SuggestionCell", bundle: nil)
            collectionViewSuggestion.register(nib, forCellWithReuseIdentifier: "SuggestionCell")
            collectionViewSuggestion.reloadData()
        }
    }
    
    
    
    func loadEmojies() {
        self.arrEmojies = Constants.STRINGS.arrEmojies
        setUpCollectionView()
    }

   
    func manageLayout() {
            self.keyboardView.layoutSubviews()
            self.keyboardView.layoutIfNeeded()
            self.view.layoutSubviews()
            self.view.layoutSubviews()
    }
    
    func allowAccessPopUpView() {
        if let fullAccessView  = keyboardView.viewWithTag(1003) {
            if let contentView  = keyboardView.viewWithTag(1004) {
                contentView.layer.cornerRadius = 16
                contentView.dropShadow()
            }
            fullAccessView.isHidden = false
           
            DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
                fullAccessView.isHidden = true
            })
           
        }
    }
    
    func handleDropOptionSelection(type:Any) {
        wholeTextString = ""
        
        if let featureType = type as? FeatureType, featureType == .continueWriting {
            if let txtSuggestion  = keyboardView.viewWithTag(1111) as? UITextField{
                if txtSuggestion.text != nil && txtSuggestion.text != "" {
                    let finalString = "Continue Writing on:\(txtSuggestion.text ?? "")"
                    viewModel?.openAIAPI(prompt: finalString,type: featureType)
                } else {
                    print("Field is empty")
                }
            }
        } else {
           let proxy = textDocumentProxy as UITextDocumentProxy
            if proxy.hasText {
                var finalString = ""
                let beforeSelectedText = proxy.documentContextBeforeInput ?? ""
                let afterSelectedText = proxy.documentContextAfterInput ?? ""
                let selectedText = proxy.selectedText ?? ""
                
                let fullText = beforeSelectedText + selectedText + afterSelectedText
//                if textDocumentProxy.isfull
//                let pasteboard = UIPasteboard.general
//                let string = pasteboard.string
//                guard let string = string, !string.isEmpty else {
//                    // Handle empty or nil string
//                    return
//                }
//                fullText = string

                wholeTextString =  fullText
                if let translate = type as? Translate {
                    finalString = "Translate \(wholeTextString) to \(translate.rawValue)"
                    viewModel?.openAIAPI(prompt: finalString, type: .translate)
                    
                } else if let reply = type as? ReplyType {
                    finalString = "Write an email for \(wholeTextString) in \(reply.rawValue) tone"
                    viewModel?.openAIAPI(prompt: finalString, type: .emailReply)
                    
                } else if let paraphrase = type as? Paraphrase {
                     finalString = "Paraphrase: \(wholeTextString) in \(paraphrase.rawValue) tone"
                    viewModel?.openAIAPI(prompt: finalString, type: .paraphrase)
                    
                } else if let featureType = type as? FeatureType  {
                    if featureType == .grammerCheck {
                        finalString = "Correct this to standard English: \(wholeTextString)"
                    } else if featureType == .helpMeWriting {
                        finalString = "Help me write with: \(wholeTextString)"
                    }
                    if finalString != "" {
                        viewModel?.openAIAPI(prompt: finalString, type: featureType)
                    }
                }
            } else {
                print("Field is empty")
            }
        }

    }
    
    
    func fullDocumentContext() -> String {
        let textDocumentProxy = self.textDocumentProxy

        var before = textDocumentProxy.documentContextBeforeInput

        var completePriorString = "";

        // Grab everything before the cursor
        while (before != nil && !before!.isEmpty) {
            completePriorString = before! + completePriorString

            let length = before!.lengthOfBytes(using: .utf8)

            textDocumentProxy.adjustTextPosition(byCharacterOffset: Int(-length))
            Thread.sleep(forTimeInterval: 0.01)
            before = textDocumentProxy.documentContextBeforeInput
        }

        // Move the cursor back to the original position
        self.textDocumentProxy.adjustTextPosition(byCharacterOffset: completePriorString.count)
        Thread.sleep(forTimeInterval: 0.01)

        var after = textDocumentProxy.documentContextAfterInput

        var completeAfterString = "";

        // Grab everything after the cursor
        while (after != nil && !after!.isEmpty) {
            completeAfterString += after!

            let length = after!.lengthOfBytes(using: .utf8)

            textDocumentProxy.adjustTextPosition(byCharacterOffset: length)
            Thread.sleep(forTimeInterval: 0.01)
            after = textDocumentProxy.documentContextAfterInput
        }

        // Go back to the original cursor position
        self.textDocumentProxy.adjustTextPosition(byCharacterOffset: -(completeAfterString.count))

        let completeString = completePriorString + completeAfterString
        return completeString
    }
       
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if traitCollection.verticalSizeClass != previousTraitCollection?.verticalSizeClass {
            setUpKeyboardHeight()
        }
    }
}

