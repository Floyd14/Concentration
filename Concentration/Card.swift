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

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    // static metodi esterni alla classe globali, non fanno parte di Card ma del tipo Card
    static func getUnicIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUnicIdentifier() //Card. perchè chiamo un metodo esterno
    }

}
