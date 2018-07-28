//
//  ViewController.swift
//  Concentration
//
//  Created by Andrea Visini on 27/07/18.
//  Copyright © 2018 Andrea Visini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    private var numberOfPairsOfCards: Int {
            return (cardButtons.count + 1) / 2
    }
    
    
    private(set) var flipCount = 0 {
        didSet {
          updateAttributedTextOfTheLabel()
        }
    }
    
    private func updateAttributedTextOfTheLabel() {
        let attributes: [NSAttributedStringKey: Any] = [
            .strokeWidth: 5.0,
            .strokeColor: #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        ]
        let attributedString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attributes)
        flipsLabel.attributedText = attributedString
    }
    
    // ! mi permette di non iniziializzare
    @IBOutlet private weak var flipsLabel: UILabel! {
        didSet {
            updateAttributedTextOfTheLabel()
        }
    }
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardId = cardButtons.index(of: sender) {
            game.choseCard(at: cardId)
            updateViewFromModel()
            // print("Flip card: \(emojiChoises[cardId]) at index: \(cardId)")
        }
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let card = game.cards[index]
            let button = cardButtons[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    //private var emojiChoices = ["🦇", "😱", "🙀", "😈", "🎃", "👻", "🍭", "🍬", "🍎"] sotituisco con una String
    private var emojiChoices = "🦇😱🙀😈🎃👻🍭🍬🍎"
    
    // private var emoji = [Int:String]()  //Dictionary<Int,String> () sostituisco con: implemento il protocollo
    private var emoji = [Card:String]()  //Dictionary<Int,String> ()

    private func emoji(for card: Card) -> String {
        //        if let chosenEmoji = emoji[card.identifier] {
        //            return chosenEmoji
        //        } else {
        //            return "?"
        //        }
        
        //        if emoji[card.identifier] != nil {
        //            return emoji[card.identifier]!
        //        } else {
        //            return "?"
        //        }
        if emoji[card] == nil {
            if emojiChoices.count > 0 {
                let randomIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.randomInt)
                emoji[card] = String(emojiChoices.remove(at: randomIndex)) //emojiChoises[randomIndex]
            }
        }
        return emoji[card] ?? "?"
    }
    
    //    private func flipCard(withEmoji emoji:String, on button:UIButton) {
    //        flipCount += 1
    //        if button.currentTitle == emoji {
    //            button.setTitle(nil, for: UIControlState.normal)
    //            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
    //        } else {
    //            button.setTitle(emoji, for: UIControlState.normal)
    //            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    //        }
    //    }
    
}

extension Int {
    var randomInt: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}

