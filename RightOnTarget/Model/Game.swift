//
//  Game.swift
//  RightOnTarget
//
//  Created by Владимир Белобродский on 19.02.2022.
//

import Foundation

protocol GameProtocol {
    var score: Int {get}
    var currentSecretValue: Int {get}
    var isGameEnded: Bool {get}
    func restartGame()
    func startNewRound()
    func calculateScore(with value: Int)
}

class Game: GameProtocol
{
    var score: Int=0
    private var minSecretValue: Int
    private var maxSecretValue: Int
    
    var currentSecretValue: Int = 0
    private var lastRound: Int
    private var currentRound: Int = 1
    var isGameEnded: Bool {if currentRound>=lastRound {
        return true} else {return false}}
    
    init? (startValue: Int, endValue: Int, rounds: Int)
    {
        
        guard startValue<=endValue else {return nil}
        self.minSecretValue = startValue
        self.maxSecretValue = endValue
        self.lastRound = rounds
        self.currentSecretValue = self.getSecretValue()
        
        
    }
    
    func getSecretValue() -> Int
    {
        return (minSecretValue...maxSecretValue).randomElement()!
    }
    
    func restartGame() {
        self.currentRound=0
        self.score = 0
        self.startNewRound()
    }
    
    func startNewRound() {
        self.currentRound+=1
        self.currentSecretValue = self.getSecretValue()
        
    }
    
    func calculateScore(with value: Int) {
        if value > currentSecretValue {
            score += 50 - value + currentSecretValue}
        else if value < currentSecretValue {
            score += 50 - currentSecretValue + value
        } else {score += 50}
    }
}


