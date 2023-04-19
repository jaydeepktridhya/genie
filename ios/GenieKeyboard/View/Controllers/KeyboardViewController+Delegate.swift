//
//  KeyboardViewController+Delegate.swift
//  GenieKeyboard
//
//  Created by MAC on 27/03/23.
//

import Foundation
import UIKit

extension KeyboardViewController {
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here
        super.textWillChange(textInput)
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        super.textDidChange(textInput)
        self.handleTextInputReturnType()
    }
    
}


public extension UITextInput {
    var text: String {
        get { text(in: textRange(from: beginningOfDocument, to: endOfDocument)!) ?? "" }
        set(value) { replace(textRange(from: beginningOfDocument, to: endOfDocument)!, withText: value) }
    }
}
