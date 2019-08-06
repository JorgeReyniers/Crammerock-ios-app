//
//  AddEditArtistTableViewController.swift
//  Crammerock-ios-app
//
//  Created by Jorgé Reyniers on 05/08/2019.
//  Copyright © 2019 Jorgé Reyniers. All rights reserved.
//

import UIKit

class AddEditArtistTableViewController: UITableViewController {

    var artist:Artist?
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var stageTextField: UITextField!
    @IBOutlet weak var dayOfPerformanceTextField: UITextField!
    @IBOutlet weak var startTimeOfPerformanceTextField: UITextField!
    @IBOutlet weak var endTimeOfPerformanceTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    struct PropertyKeys {
        static let saveUnwindSegue = "SaveUnwindSegue"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func updateUI(){
        if let artist = artist {
            nameTextField.text = artist.name
            stageTextField.text = artist.stage.rawValue
            dayOfPerformanceTextField.text = artist.dayOfPerformance.rawValue
            startTimeOfPerformanceTextField.text = artist.startTimeOfPerformance
            endTimeOfPerformanceTextField.text = artist.endTimeOfPerformance
            navigationItem.title = "Wijzig artiest"
        } else {
            navigationItem.title = "Nieuwe artiest"
        }
        updateSaveButtonState()
    }
    
    func updateSaveButtonState() {
        let nameText = nameTextField.text ?? ""
        let stageText = stageTextField.text ?? ""
        let dayOfPerformanceText = dayOfPerformanceTextField.text ?? ""
        let startTimeOfPerformanceText = startTimeOfPerformanceTextField.text ?? ""
        let endTimeOfPerformanceText = endTimeOfPerformanceTextField.text ?? ""
        saveButton.isEnabled = !nameText.isEmpty && !stageText.isEmpty && !dayOfPerformanceText.isEmpty && !startTimeOfPerformanceText.isEmpty && !endTimeOfPerformanceText.isEmpty
    }
    
    @IBAction func textEditingChanged(_ sender: Any) {
        updateSaveButtonState()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == PropertyKeys.saveUnwindSegue else { return }
        let nameText = nameTextField.text?.capitalized ?? ""
        let stageText = stageTextField.text ?? ""
        let stageEnum = Stage(rawValue: stageText) ?? .Club
        let dayOfPerformanceText = dayOfPerformanceTextField.text ?? ""
        let dayOfPerformanceEnum = DayOfPerformance(rawValue: dayOfPerformanceText) ?? .Vrijdag
        let startTimeOfPerformanceText = startTimeOfPerformanceTextField.text ?? ""
        let endTimeOfPerformanceText = endTimeOfPerformanceTextField.text ?? ""
        artist = Artist(name: nameText, stage: stageEnum, dayOfPerformance: dayOfPerformanceEnum, startTimeOfPerformance: startTimeOfPerformanceText, endTimeOfPerformance: endTimeOfPerformanceText)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
