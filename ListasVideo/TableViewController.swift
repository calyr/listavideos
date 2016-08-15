//
//  TableViewController.swift
//  ListasVideo
//
//  Created by calyr on 8/7/16.
//  Copyright © 2016 calyr. All rights reserved.
//

import UIKit

var mylist : Array<String> = ["loversinjapan.mp3","Michael.mp3","i took a pill in ibiza.mp3","cheaptrills.mp3","dueleelcorazón.mp3","Mana - Si no te hubieras ido.mp3"]

var mylistImage : Array<String> = ["coldplaylovers.jpg","Michael.jpg","ITookPillinIbiza.jpg","CheapThrills.jpg","DueleCorazon.jpg","mana.jpg"]
class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(mylist)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mylist.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell: TableViewCell =  tableView.dequeueReusableCellWithIdentifier("Celda") as! TableViewCell
        
        cell.title.text = String(mylist[indexPath.row])
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if( segue.identifier == "detalle"){
            print("Se presiono el boton de detalle")
            let detailView = segue.destinationViewController as! ViewController
            
            if let selectedBookCel = sender as? TableViewCell {
                let indexPath = tableView.indexPathForCell(selectedBookCel)!
                print(indexPath.row)
                //print(toDoItems)
                detailView.index = indexPath.row
               
            }
            
            
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
