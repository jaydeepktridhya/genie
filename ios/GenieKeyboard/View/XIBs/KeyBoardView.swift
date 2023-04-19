//
//  KeyBoardView.swift
//  keaBoardTridhya
//
//  Created by Aditya on 2022-03-10.
//

import UIKit
class KeyBoardView : UIView{
    @IBOutlet weak var topActionView: UIStackView!
    @IBOutlet weak var suggestionView: UIView!
    @IBOutlet weak var txtSuggestions: UITextField!
    @IBOutlet weak var alphaStackView: UIStackView!
    @IBOutlet weak var numberStackView: UIStackView!
    @IBOutlet weak var specialCharStackView: UIStackView!
    @IBOutlet weak var spaceView: UIView!
    @IBOutlet weak var emojiCollectionView: UICollectionView!
    @IBOutlet weak var emojiView: UIView!
    @IBOutlet weak var keyboardStackView: UIStackView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
   
    }
    
}
