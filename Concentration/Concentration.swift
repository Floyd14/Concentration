//
//  Concentration.swift
//  Concentration
//
//  Created by Andrea Visini on 28/07/18.
//  Copyright © 2018 Andrea Visini. All rights reserved.
//

import Foundation

class Concentration {
    
    private(set) var cards = [Card]() //è come chamare init
    
    private var onlyOneCardThatIsFacedUp: Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly

//            let cardFacedUpIndices = cards.indices.filter { cards[$0].isFaceUp }
//            return cardFacedUpIndices.count == 1 ? cardFacedUpIndices.first : nil
            
//            var foundIndex: Int? // keeps track of the first i find
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    if foundIndex == nil {
//                        foundIndex = index
//                    } else {
//                        foundIndex = nil
//                    }
//                }
//            }
//            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue) // è true in caso si setta onlyOneCardThatIsFacedUp
            }
        }
    }
    
    func choseCard(at index:Int){
        assert(cards.indices.contains(index) , "Concentration.choseCard: \(index) must be in cards") // for public API to protect code
        if !cards[index].isMatched {
            // se ho già girato una carta precedentemente
            if onlyOneCardThatIsFacedUp != nil, index != onlyOneCardThatIsFacedUp {
                
                // Match
                if cards[index] == cards[onlyOneCardThatIsFacedUp!] {
                    cards[index].isMatched = true
                    cards[onlyOneCardThatIsFacedUp!].isMatched = true
                    print("Le carte matchano")
                }
                cards[index].isFaceUp = true
//                onlyOneCardThatIsFacedUp = nil
                
                // se non ho girato una carta in precedenza
            } else {
                // rigiro tutte le carte
//                for flipDownIndex in cards.indices {
//                    cards[flipDownIndex].isFaceUp = false
//                }
//                cards[index].isFaceUp = true
                onlyOneCardThatIsFacedUp = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(numberOfPairsOfCards: Int): \(numberOfPairsOfCards) must be in cards") // for public API to protect code
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            // let matchingCard = card //ne creo un' altra (copia)
            
            //            cards.append(card)
            //            cards.append(card) //ne creo uno copia -> riscritto:
            
            cards += [card,card]
            
        }
    }
    
}


extension Collection {
    
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
    
}



