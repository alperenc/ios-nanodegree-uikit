//
//  VillainDetailViewController.swift
//  BondVillains
//
//  Created by Alp Eren Can on 19/09/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import UIKit

class VillainDetailViewController: UIViewController {
    
    var villain: Villain!

    @IBOutlet weak var villainImageView: UIImageView?
    @IBOutlet weak var villainName: UILabel?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        villainImageView?.image = UIImage(named: villain.imageName)
        villainName?.text = villain.name
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
