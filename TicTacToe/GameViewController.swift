//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, BoardViewControllerDelegate {
    
    private enum GameState {
        case active(GameBoard.Mark) // Active player
        case cat
        case won(GameBoard.Mark) // Winning player
    }
    override func viewDidLoad() {
        self.board = testGame.board
    }
    @IBAction func restartGame(_ sender: Any) {
        testGame.restart()
    }
    
    // MARK: - BoardViewControllerDelegate
    
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
        guard !testGame.gameIsOver else {
            NSLog("Game is over")
            return
        }
        
        do {
            try testGame.makeMark(at: coordinate)
        } catch {
            NSLog("Illegal move")
        }
    }
    
    // MARK: - Private
    
    private func updateViews() {
        guard isViewLoaded else { return }
        
        if let activePlayer = testGame.activePlayer{
            statusLabel.text = "Player \(activePlayer.stringValue)'s turn"
        }
        if let winningPlayer = testGame.winningPlayer{
            statusLabel.text = "Player \(winningPlayer.stringValue) won!"
        }
        if testGame.gameIsOver {
            statusLabel.text = "Cat's game!"
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedBoard" {
            boardViewController = segue.destination as! BoardViewController
        }
    }
    
    private var boardViewController: BoardViewController! {
        willSet {
            boardViewController?.delegate = nil
        }
        didSet {
            boardViewController?.board = board
            boardViewController?.delegate = self
        }
    }
    
    @IBOutlet weak var statusLabel: UILabel!
    
    private var board = GameBoard() {
        didSet {
            boardViewController.board = testGame.board
        }
    }
    
    private var testGame = Game() {
        didSet{
            updateViews()
        }
    }
}
