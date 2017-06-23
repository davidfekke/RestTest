//
//  SaveEntryViewController.swift
//  RestTest
//
//  Created by David Fekke on 7/28/16.
//  Copyright © 2016 David Fekke. All rights reserved.
//

import UIKit

class SaveEntryViewController: UIViewController {

    var delegate: SaveEntryViewControllerDelegate? = nil
    
    @IBOutlet weak var entryNameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveEntry(_ sender: AnyObject) {
        if let entry = entryNameField?.text {
            if entry.isEmpty {
                let alertController = UIAlertController(title: "Nothing Enetered", message:"You must add text before saving", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default, handler: { action in NSLog("Ok is pressed.") })
                //                let okAction = UIAlertAction(title: "Ok", style: .default, handler: {(action: UIAlertAction)
//                    in NSLog("Ok pressed")
//                })
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            } else {
                delegate?.didFinishSaving(self, entry: entry)
                dismiss(animated: true, completion: nil)
            }
        }
    }

    @IBAction func cancelAction(_ sender: AnyObject) {
        //dismiss(animated: true, completion: nil)
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
