//
//  EntryViewController.swift
//  RestTest
//
//  Created by David Fekke on 7/28/16.
//  Copyright © 2016 David Fekke. All rights reserved.
//

import UIKit
import CoreData
import Firebase

class EntryTableViewController: UITableViewController, SaveEntryViewControllerDelegate {

    var dataSource: [String]? = ["Apple", "Apricot", "Banana", "Blueberry", "Cantaloupe", "Cherry",
                "Clementine", "Coconut", "Cranberry", "Fig", "Grape", "Grapefruit",
                "Kiwi fruit", "Lemon", "Lime", "Lychee", "Mandarine", "Mango",
                "Melon", "Nectarine", "Olive", "Orange", "Papaya", "Peach",
                "Pear", "Pineapple", "Raspberry", "Strawberry"]
    
    var fruits = [NSManagedObject]()
    var ref = FIRDatabase.database().reference()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        //let tempSource = (self.ref.child("myFruits").queryLimited(toFirst: 100))
        
        ref.observeSingleEvent(of: .value, with: { snapshot in
            // do some stuff once
            //let myChildren = snapshot.children
//            myChildren.forEach(body: child ->,, in {
//                    print(child)
//                })
            //dataSource?.append(snapshot as String)
        })
        
        //dataSource = tempSource as! [Int, String]?
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItemToDataSource(_:)))
        navigationItem.rightBarButtonItem = addButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func addItemToDataSource(_ sender: AnyObject) {
        let contllr = storyboard?.instantiateViewController(withIdentifier: "SaveEntry") as? SaveEntryViewController
        //let controller = storyboard?.instantiateViewController(withIdentifier: "SaveEntry") as? SaveEntryViewController;
        contllr?.delegate = self
        present(contllr!, animated: true)
        //present(controller!, animated: true, completion: nil)
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let curCount = dataSource?.count {
            return curCount
        }
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EntryCell", for: indexPath)

        if let entryName = dataSource?[indexPath.row] {
            cell.textLabel?.text = entryName
        }
        cell.detailTextLabel?.text = "This is the \(indexPath.row+1) item"

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "EntryDetail" {
            if let viewController = segue.destination as? EntryDetailViewController {
                let indexPath: IndexPath = self.tableView.indexPathForSelectedRow!
                if let object = dataSource?[indexPath.row] {
                    viewController.entryItem = Entry(name: object, which: indexPath.row+1)
                }
                
            }
        }
    }
    
    func didFinishSaving(_ controller: UIViewController, entry: String) -> Void {
        if dataSource != nil {
            if !(dataSource?.contains(entry))! {
                dataSource!.append(entry)
            }
        }
        dataSource?.sort { $0.lowercased() < $1.lowercased() }
        tableView.reloadData()
    }
 
    

}
