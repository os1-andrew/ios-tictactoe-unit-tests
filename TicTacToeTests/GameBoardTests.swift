//
//  GameBoardTests.swift
//  TicTacToeTests
//
//  Created by Andrew Dhan on 9/12/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe //internal stuff will become accessible but private will not. All things default to internal

class GameBoardTests: XCTestCase {
    
    //Setup and TearDown Runs before and after every single text before each test method. Each test method should be independent
    //Often not necessary.
    
    
    //all test method must start with the word "test"
    //very very important
    func testCreatingEmptyBoard(){
        //Our test case in a separate target so we need to import our app
        //Can't test anything that is not public
        let board = GameBoard()
        
        XCTAssertFalse(board.isFull)
        for x in 0..<3{
            for y in 0..<3 {
                //boolean inside method should be true if test succeeds
                //                XCTAssert(board[(x,y)] == nil)
                //                Even better, more specific below
                XCTAssertNil(board[(x,y)])
                //Go through every square. If not empty then test failed
            }
        }
    }
    
    func testPlacingMarks(){
        var board = GameBoard()
        
        //places mark and make sure the mark is right
        XCTAssertNoThrow(try board.place(mark: .o, on: (0, 0)))
        XCTAssertEqual(board[(0,0)], .o)
        
        XCTAssertNoThrow(try board.place(mark: .x, on: (1, 0)))
        XCTAssertEqual(board[(1,0)], .x)
        
        XCTAssertNoThrow(try board.place(mark: .o, on: (2, 0)))
        XCTAssertEqual(board[(2,0)], .o)
        
        XCTAssertNoThrow(try board.place(mark: .x, on: (0, 1)))
        XCTAssertEqual(board[(0,1)], .x)
        
        XCTAssertNoThrow(try board.place(mark: .o, on: (1, 1)))
        XCTAssertEqual(board[(1,1)], .o)
        
        XCTAssertNoThrow(try board.place(mark: .x, on: (2, 1)))
        XCTAssertEqual(board[(2,1)], .x)
        
        XCTAssertNoThrow(try board.place(mark: .o, on: (0, 2)))
        XCTAssertEqual(board[(0,2)], .o)
        
        XCTAssertNoThrow(try board.place(mark: .x, on: (1, 2)))
        XCTAssertEqual(board[(1,2)], .x)
        
        XCTAssertNoThrow(try board.place(mark: .o, on: (2, 2)))
        XCTAssertEqual(board[(2,2)], .o)
        
        //Make sre you can't change an already marked square and makes sure that the error is the correct error
        XCTAssertThrowsError(try board.place(mark: .x, on: (0, 0)) ){
            error in XCTAssertEqual(error as? GameBoardError, .invalidSquare)
        }
    }
    
    func testFillingBoard(){
        var board = GameBoard()
        
        for x in 0..<3{
            for y in 0..<3 {
                XCTAssertFalse(board.isFull)
                try! board.place(mark: .x, on: (x, y))
            }
        }
        XCTAssertTrue(board.isFull)
    }
}

