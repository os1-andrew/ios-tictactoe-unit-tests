//
//  Game.swift
//  TicTacToe
//
//  Created by Andrew Liao on 9/12/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    mutating func restart(){
        board = GameBoard()
        
        gameIsOver = true
        activePlayer = .x
        winningPlayer = nil
    }
    
    mutating func makeMark(at coordinate: Coordinate) throws{
//        guard var activePlayer = activePlayer else {
//            throw GameBoardError.invalidPlayer
//        }
        try board.place(mark: activePlayer!, on: coordinate)
        if game(board: board, isWonBy: activePlayer!) {
            winningPlayer = activePlayer
            activePlayer = nil
            gameIsOver = true
        } else if board.isFull {
            winningPlayer = activePlayer
            activePlayer = nil
            gameIsOver = true
        } else {
            let newPlayer = activePlayer == .x ? GameBoard.Mark.o : GameBoard.Mark.x
            activePlayer = newPlayer
        }
    }
    
    //Properties
    private (set) var board: GameBoard
    
    var activePlayer: GameBoard.Mark?
    var gameIsOver: Bool
    var winningPlayer: GameBoard.Mark?
}