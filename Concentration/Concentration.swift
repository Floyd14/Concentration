//
//  Concentration.swift
//  Concentration
//
//  Created by Andrea Visini on 28/07/18.
//  Copyright © 2018 Andrea Visini. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]() //è come chamare init
    
    var onlyOneCardThatIsFacedUp: Int?
    
    func choseCard(at index:Int){
        if !cards[index].isMatched {
            // se ho già girato una carta precedentemente
            if onlyOneCardThatIsFacedUp != nil, index != onlyOneCardThatIsFacedUp {
                
                // Match
                if cards[index].identifier == cards[onlyOneCardThatIsFacedUp!].identifier {
                    cards[index].isMatched = true
                    cards[onlyOneCardThatIsFacedUp!].isMatched = true
                    print("Le carte matchano")
                }
                cards[index].isFaceUp = true
                onlyOneCardThatIsFacedUp = nil
                
            // se non ho girato una carta in precedenza
            } else {
                // rigiro tutte le carte
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                onlyOneCardThatIsFacedUp = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            // let matchingCard = card //ne creo un' altra (copia)
            
            //            cards.append(card)
            //            cards.append(card) //ne creo uno copia -> riscritto:
            
            cards += [card,card]
            
        }
    }
    
}
