//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Andrew Liao on 9/12/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    
    var testGame = Game()
    override func setUp() {
        testGame = Game()
    }
    
    func testRestart(){
        XCTAssertFalse(testGame.gameIsOver)
        XCTAssertEqual(testGame.activePlayer, GameBoard.Mark.x)
        XCTAssertNil(testGame.winningPlayer)
    }
    
    func testMakeMark(){
        /*
         
         - x o
         - x o
         - x -
         */
        
        try! testGame.makeMark(at: (0,1))
        XCTAssertNotNil(testGame.board[(0,1)])
        XCTAssertEqual(testGame.board[(0,1)]!.stringValue,GameBoard.Mark.x.stringValue)
        XCTAssertEqual(testGame.activePlayer, GameBoard.Mark.o)
        XCTAssertNil(testGame.winningPlayer)
        XCTAssertFalse(testGame.gameIsOver)
        
        try! testGame.makeMark(at: (0,2))
        XCTAssertNotNil(testGame.board[(0,2)])
        XCTAssertEqual(testGame.board[(0,2)]!.stringValue,GameBoard.Mark.o.stringValue)
        XCTAssertEqual(testGame.activePlayer, GameBoard.Mark.x)
        XCTAssertNil(testGame.winningPlayer)
        XCTAssertFalse(testGame.gameIsOver)

        try! testGame.makeMark(at: (1,1))
        XCTAssertNotNil(testGame.board[(1,1)])
        XCTAssertEqual(testGame.board[(1,1)]!.stringValue,GameBoard.Mark.x.stringValue)
        XCTAssertEqual(testGame.activePlayer, GameBoard.Mark.o)
        XCTAssertNil(testGame.winningPlayer)
        XCTAssertFalse(testGame.gameIsOver)

        try! testGame.makeMark(at: (1,2))
        XCTAssertNotNil(testGame.board[(1,2)])
        XCTAssertEqual(testGame.board[(1,2)]!.stringValue,GameBoard.Mark.o.stringValue)
        XCTAssertEqual(testGame.activePlayer, GameBoard.Mark.x)
        XCTAssertNil(testGame.winningPlayer)
        XCTAssertFalse(testGame.gameIsOver)
        
        try! testGame.makeMark(at: (2,1))
        XCTAssertNotNil(testGame.board[(2,1)])
        XCTAssertEqual(testGame.board[(2,1)]!.stringValue,GameBoard.Mark.x.stringValue)
        XCTAssertNil(testGame.activePlayer)
        XCTAssertNotNil(testGame.winningPlayer)
        XCTAssertTrue(testGame.gameIsOver)
    }
    
}
