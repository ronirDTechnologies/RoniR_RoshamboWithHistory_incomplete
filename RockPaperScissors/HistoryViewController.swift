//
//  HistoryViewController.swift
//  RockPaperScissors
//
//  Created by Roni Rozenblat on 6/23/15.
//  Copyright (c) 2015 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource
{
    var history = [RPSMatch]()
    var match: RPSMatch!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return history.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      
        match = history[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("HistCell") as! UITableViewCell
        cell.textLabel?.text = messageForMatch(match)
        cell.detailTextLabel?.text = "WINNER > " + match.winner.description + "  LOSER> " + match.loser.description
        cell.imageView?.image = imageForMatch(match)
        cell.backgroundColor = UIColor.brownColor()
        
        return cell
    }
    

    func imageForMatch(match: RPSMatch) -> UIImage {
        
        var name = ""
        
        switch (match.winner) {
        case .Rock:
            name = "RockCrushesScissors"
        case .Paper:
            name = "PaperCoversRock"
        case .Scissors:
            name = "ScissorsCutPaper"
        }
        
        if match.p1 == match.p2 {
            name = "itsATie"
        }
        return UIImage(named: name)!
    }
    
    func messageForMatch(match: RPSMatch) -> String {
        
        // Handle the tie
        if match.p1 == match.p2 {
            return "It's a tie!"
        }
        
        // Here we build up the results message "RockCrushesScissors. You Win!" etc.
        return match.winner.description + " " + victoryModeString(match.winner) + " " + match.loser.description + ". " + resultString(match)
    }
    
    func resultString(match: RPSMatch) -> String {
        return match.p1.defeats(match.p2) ? "You Win!" : "You Lose!"
    }
    
    
    func victoryModeString(gesture: RPS) -> String {
        switch (gesture) {
        case .Rock:
            return "crushes"
        case .Scissors:
            return "cuts"
        case .Paper:
            return "covers"
        }
    }


    
}
