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
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var startDateTimeLabel: UILabel!
    @IBOutlet weak var startDateTimePicker: UIDatePicker!
    @IBOutlet weak var endDateTimeLabel: UILabel!
    @IBOutlet weak var endDateTimePicker: UIDatePicker!
    
    let startDateTimePickerCellIndexPath = IndexPath(row: 1, section: 2)
    let endDateTimePickerCellIndexPath = IndexPath(row: 3, section: 2)
    var isStartDateTimePickerShown: Bool = false {
        didSet {
            startDateTimePicker.isHidden = !isStartDateTimePickerShown
        }
    }
    var isEndDateTimePickerShown: Bool = false {
        didSet {
            endDateTimePicker.isHidden = !isEndDateTimePickerShown
        }
    }
    
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
    
    //Action methods
    
    @IBAction func textEditingChanged(_ sender: Any) {
        updateSaveButtonState()
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        updateDateLabels()
    }
    
    
    //Update methods
    
    func updateUI(){
        if let artist = artist {
            nameTextField.text = artist.name
            stageTextField.text = artist.stage.rawValue
            dayOfPerformanceTextField.text = artist.dayOfPerformance.rawValue
            
            //Hier komt de initialisatie van de datepickers en labels naar de datum van de artiest
            startDateTimePicker.date = artist.startTimeOfPerformance
            endDateTimePicker.date = artist.endTimeOfPerformance
            updateDateLabels()
            
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
        saveButton.isEnabled = !nameText.isEmpty && !stageText.isEmpty && !dayOfPerformanceText.isEmpty
    }
    
    
    
    func updateDateLabels() {
        startDateTimeLabel.text = DateHelper.dateToString(date: startDateTimePicker.date)
        endDateTimeLabel.text = DateHelper.dateToString(date: endDateTimePicker.date)
    }
    
    //Segue methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == PropertyKeys.saveUnwindSegue else { return }
        let nameText = nameTextField.text?.capitalized ?? ""
        let stageText = stageTextField.text ?? ""
        let stageEnum = Stage(rawValue: stageText) ?? .Club
        let dayOfPerformanceText = dayOfPerformanceTextField.text ?? ""
        let dayOfPerformanceEnum = DayOfPerformance(rawValue: dayOfPerformanceText) ?? .Vrijdag
        
        //Hier worden de gegevens uit de datepickers of labels gehaald
        let startTimeOfPerformance = startDateTimePicker.date
        let endTimeOfPerformance = endDateTimePicker.date
        artist = Artist(name: nameText, stage: stageEnum, dayOfPerformance: dayOfPerformanceEnum, startTimeOfPerformance: startTimeOfPerformance, endTimeOfPerformance: endTimeOfPerformance)
    }
    
    //table view delegate methods
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section, indexPath.row) {
        case (startDateTimePickerCellIndexPath.section, startDateTimePickerCellIndexPath.row):
            if isStartDateTimePickerShown {
                return 216.0
            } else {
                return 0.0
            }
        case (endDateTimePickerCellIndexPath.section, endDateTimePickerCellIndexPath.row):
            if isEndDateTimePickerShown {
                return 216.0
            } else {
                return 0.0
            }
        default:
            return 44.0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch (indexPath.section, indexPath.row) {
        case (startDateTimePickerCellIndexPath.section, startDateTimePickerCellIndexPath.row - 1):
            if isStartDateTimePickerShown {
                isStartDateTimePickerShown = false
            } else if isEndDateTimePickerShown {
                isEndDateTimePickerShown = false
                isStartDateTimePickerShown = true
            } else {
                isStartDateTimePickerShown = true
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
        
        case (endDateTimePickerCellIndexPath.section, endDateTimePickerCellIndexPath.row - 1):
            if isEndDateTimePickerShown {
                isEndDateTimePickerShown = false
            } else if isStartDateTimePickerShown {
                isStartDateTimePickerShown = false
                isEndDateTimePickerShown = true
            } else {
                isEndDateTimePickerShown = true
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
        default:
            break
        }
    }

}
