//
//  ScoreViewModel.swift
//  
//
//  Created by Agata Czap on 02/08/2023.
//

import Foundation
struct ScoreViewModel {
    let correctGuesses: Int
    let incorrectGuesses: Int
    
    var percentage: Int {
        (correctGuesses * 100/ (correctGuesses + incorrectGuesses))
    }
}
