//
//  Concentration.swift
//  Concentration
//
//  Created by My Nguyen on 7/31/19.
//  Copyright © 2019 My Nguyen. All rights reserved.
//

import Foundation

class Concentration  {
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            // assignment makes a copy of card
            // let matchingCard = card
            // this also makes a copy
            // cards.append(card)
            // cards.append(card)
            // another way of adding 2 cards to the cards array
            cards += [card, card]
        }
        // TODO: shuffle the cards
    }

    func chooseCard(at index: Int) {
        /* if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        } else {
            cards[index].isFaceUp = true
        } */
        cards[index].isFaceUp = !cards[index].isFaceUp
        
        if !cards[index].isMatched {
            if let matchInex = indexOfOneAndOnlyFaceUpCard, matchInex != index {
                // check if cards match
                if cards[matchInex].identifier == cards[index].identifier {
                    cards[matchInex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
}
