//
//  Card.swift
//  Concentration
//
//  Created by Andrea Visini on 28/07/18.
//  Copyright © 2018 Andrea Visini. All rights reserved.
//

import Foundation

// no Inheritance
// Passed by Value (copied)
/*--------------------------------------------------
 Tutte le classi ottengono un init gratis
 a patto che tutte le properties siano inizializzate.
----------------------------------------------------*/

struct Card: Hashable {
    
    var hashValue: Int {
        return identifier
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier ? true : false
    }
    
    
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    private static var identifierFactory = 0
    
    // static metodi esterni alla classe globali, non fanno parte di Card ma del tipo Card
    private static func getUnicIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUnicIdentifier() //Card. perchè chiamo un metodo esterno
    }

}
