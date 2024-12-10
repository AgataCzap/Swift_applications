//
//  ScoreViewModel.swift
//  CodeHistory
//
//  Created by Ben Stone on 3/4/21.
//

import Foundation

struct ScoreViewModel {
    let correctGuesses: Int
    let incorrectGuesses: Int
    
    var percentage: Int {
        (correctGuesses * 100 / (correctGuesses + incorrectGuesses))
    }
}
