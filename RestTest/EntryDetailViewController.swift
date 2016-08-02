//
//  EntryDetailViewController.swift
//  RestTest
//
//  Created by David Fekke on 7/28/16.
//  Copyright © 2016 David Fekke. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {

    var entryItem: Entry?
    @IBOutlet weak var EntryLabel: UILabel!
    @IBOutlet weak var EntryNameLabel: UILabel!
    @IBOutlet weak var WhichItemLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        EntryNameLabel?.text = entryItem!.entryName
        WhichItemLabel?.text = "This is the \(entryItem!.whichItem) item"
        navigationItem.title = entryItem!.entryName
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

struct Entry {
    let entryName: String
    let whichItem: Int
    
    init(name: String, which: Int) {
        entryName = name
        whichItem = which
    }
}
