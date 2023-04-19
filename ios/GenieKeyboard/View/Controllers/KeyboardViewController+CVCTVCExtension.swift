//
//  KeyboardViewController+CVCTVCExtension.swift
//  GenieKeyboard
//
//  Created by MAC on 27/03/23.
//

import Foundation
import UIKit

extension KeyboardViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentDropListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "DropDownCell", for: indexPath) as? DropDownCell {
            if let translate = self.currentDropListArray[indexPath.row] as? Translate {
                cell.lblTitle.text = translate.rawValue
            } else if let reply = self.currentDropListArray[indexPath.row] as? ReplyType {
                cell.lblTitle.text = reply.rawValue
            } else if let paraphrase = self.currentDropListArray[indexPath.row] as? Paraphrase {
                cell.lblTitle.text = paraphrase.rawValue
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedOption = self.currentDropListArray[indexPath.row]
        self.makeHiddenDropDownList()
        self.changeActionButtonState(sender: nil)
        self.handleDropOptionSelection(type: self.selectedOption as Any)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}

extension KeyboardViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == keyboardView.viewWithTag(998) as? UICollectionView {
            return arrEmojies.count
        } else if  collectionView  == keyboardView.viewWithTag(1006) as? UICollectionView {
            if !arrSuggestionString.isEmpty {
                return arrSuggestionString.count
            } else {
                return 0
            }
           
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == keyboardView.viewWithTag(998) as? UICollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else {
                return UICollectionViewCell()
            }
            if let emojiString = self.arrEmojies[indexPath.item] as? String, let image = emojiString.image() {
                cell.imgViewEmoji.image = image
            }
            return cell
        } else if  collectionView  == keyboardView.viewWithTag(1006) as? UICollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SuggestionCell", for: indexPath) as? SuggestionCell else {
                return UICollectionViewCell()
            }
            
            if !arrSuggestionString.isEmpty {
                let lastElement = arrSuggestionString.last
                
                
                if self.arrSuggestionString[indexPath.item] == lastElement {
                    cell.seperatorView.isHidden = true
                } else {
                    cell.seperatorView.isHidden = false
                }
                cell.lblSuggestionText.text = self.arrSuggestionString[indexPath.item]
            }
           
          
            return cell
        }
  
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == keyboardView.viewWithTag(998) as? UICollectionView {
            return CGSize(width: collectionView.frame.size.width / 8, height: collectionView.frame.size.width / 8)
        } else if  collectionView  == keyboardView.viewWithTag(1006) as? UICollectionView {
            return CGSize(width: collectionView.frame.size.width / 3, height: 40)
        } else {
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == keyboardView.viewWithTag(998) as? UICollectionView {
            let proxy = textDocumentProxy as UITextDocumentProxy
            if let emojiString = self.arrEmojies[indexPath.item] as? String{
                proxy.insertText(emojiString)
            }
        } else if  collectionView  == keyboardView.viewWithTag(1006) as? UICollectionView {
            let replacementWord = self.arrSuggestionString[indexPath.item]
            // Get the current text input
        
            guard let text = textDocumentProxy.documentContextBeforeInput else {
                return
            }

            // Split the text into an array of words
            let words = text.split(separator: " ")

            // Check that there is at least one word in the text input
            guard words.count > 0 else {
                return
            }
            // Remove the last word from the words array
            let lastWord = String(words.last!)
            
            // Replace the last word with a new word
            let newWord = replacementWord
            // Join the modified words back into a string

            // Delete the old text and insert the modified text
            for _ in 0..<lastWord.count {
                textDocumentProxy.deleteBackward()
            }
            textDocumentProxy.insertText(newWord)
            self.arrSuggestionString.removeAll()
            collectionView.reloadData()

        }
      
    }

}
