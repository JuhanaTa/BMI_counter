//
//  OnePersonTableViewController.swift
//  BMI_calculator
//
//  Created by iosdev on 5.11.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import UIKit

class OnePersonTableViewController: UITableViewController {
    
    //MARK: Properties
    var height: Double = 0
    var weight: Double = 0
    var bmi: Double = 0
    
    var history = [Person]()
    var persons = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadSamplePersons()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return persons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "OnePersonTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? OnePersonTableViewCell else {
            fatalError("cell problems")
        }
        
        let person = persons[indexPath.row]
        
        cell.bmiLabel.text = "BMI \((person.calculateOnlyBmi()*10).rounded()/10)"
        cell.heightLabel.text = "\(person.height)cm"
         cell.weightLabel.text = "\(person.weight)kg"
        cell.nameLabel.text = "\(person.name)"


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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

    private func loadSamplePersons(){
       
        for person in history {
            print("\(person.height)")
            persons.append(person)
        }
        
    }
    
}
