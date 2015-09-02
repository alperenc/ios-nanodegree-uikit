//
//  HistoryViewController.swift
//  RockPaperScissors
//
//  Created by Alp Eren Can on 01/09/15.
//  Copyright © 2015 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource {
    
    var history: [RPSMatch] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("historyCell")!;
        
        let match = history[indexPath.row]
        
        if match.p1 == match.p2 {
            cell.textLabel?.text = "Tie."
        } else if match.p1 == match.winner {
            cell.textLabel?.text = "Win!"
        } else {
            cell.textLabel?.text = "Lose."
        }
        
        cell.detailTextLabel?.text = "\(match.p1.description) vs. \(match.p2.description)"
        
        return cell
    }

    @IBAction func dismissHistory(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
