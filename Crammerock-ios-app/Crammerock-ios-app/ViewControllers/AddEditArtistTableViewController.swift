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
    @IBOutlet weak var stageSelectButton: UISegmentedControl!
    @IBOutlet weak var dayOfPerformanceSelectButton: UISegmentedControl!
    @IBOutlet weak var startDateTimeLabel: UILabel!
    @IBOutlet weak var startDateTimePicker: UIDatePicker!
    @IBOutlet weak var endDateTimeLabel: UILabel!
    @IBOutlet weak var endDateTimePicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    let startDateTimePickerCellIndexPath = IndexPath(row: 1, section: 3)
    let endDateTimePickerCellIndexPath = IndexPath(row: 3, section: 3)
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
            stageSelectButton.selectedSegmentIndex = artist.stage.rawValue
            dayOfPerformanceSelectButton.selectedSegmentIndex = artist.dayOfPerformance.rawValue
            startDateTimePicker.date = artist.startDateTimeOfPerformance
            endDateTimePicker.date = artist.endDateTimeOfPerformance
            updateDateLabels()
            
            navigationItem.title = "Wijzig artiest"
        } else {
            navigationItem.title = "Nieuwe artiest"
        }
        updateSaveButtonState()
    }
    
    func updateSaveButtonState() {
        let nameText = nameTextField.text ?? ""
        saveButton.isEnabled = !nameText.isEmpty
    }
    
    func updateDateLabels() {
        startDateTimeLabel.text = DateHelper.dateToString(date: startDateTimePicker.date)
        endDateTimeLabel.text = DateHelper.dateToString(date: endDateTimePicker.date)
    }
    
    //Segue methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == PropertyKeys.saveUnwindSegue else { return }
        let nameText = nameTextField.text?.capitalized ?? ""
        let stageEnum = Stage(rawValue: stageSelectButton.selectedSegmentIndex) ?? .MainNorth
        let dayOfPerformanceEnum = DayOfPerformance(rawValue: dayOfPerformanceSelectButton.selectedSegmentIndex) ?? .Vrijdag
        let startDateTimeOfPerformance = startDateTimePicker.date
        let endDateTimeOfPerformance = endDateTimePicker.date
        artist = Artist(name: nameText, stage: stageEnum, dayOfPerformance: dayOfPerformanceEnum, startDateTimeOfPerformance: startDateTimeOfPerformance, endDateTimeOfPerformance: endDateTimeOfPerformance)
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
