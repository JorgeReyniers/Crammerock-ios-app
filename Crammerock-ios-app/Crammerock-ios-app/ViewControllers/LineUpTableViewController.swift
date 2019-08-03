//
//  LineUpTableViewController.swift
//  Crammerock-ios-app
//
//  Created by Jorgé Reyniers on 03/08/2019.
//  Copyright © 2019 Jorgé Reyniers. All rights reserved.
//

import UIKit

class LineUpTableViewController: UITableViewController {
    var artists: [Artist] = [
        Artist(name: "Bazart", stage: .MainSouth, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "00:05"),
        Artist(name: "Craig David presents TS5", stage: .MainNorth, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "01:25"),
        Artist(name: "Jungle", stage: .MainNorth, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "20:20"),
        Artist(name: "The Vaccines", stage: .MainNorth, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "22:45"),
        Artist(name: "Black Box Revelation", stage: .MainSouth, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "21:25"),
        Artist(name: "Jonas Blue", stage: .MainSouth, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "02:30"),
        Artist(name: "Ronnie Flex & Deuxperience", stage: .MainNorth, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "18:10"),
        Artist(name: "The Van Jets", stage: .MainSouth, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "19:15"),
        Artist(name: "Black Leather Jacket", stage: .MainSouth, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "15:35"),
        Artist(name: "DJ Licious", stage: .Club, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "21:30"),
        Artist(name: "Joyhauser", stage: .Club, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "00:30"),
        Artist(name: "Maxim Lany", stage: .Club, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "23:00"),
        Artist(name: "OT", stage: .Club, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "16:30"),
        Artist(name: "Stef Kamil Carlens & Band", stage: .MainSouth, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "17:15"),
        Artist(name: "Stijn Van De Voorde & Thibault Christaensen", stage: .Club, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "02:00"),
        Artist(name: "Tessa Dixson", stage: .Club, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "17:30"),
        Artist(name: "The Sherlocks", stage: .MainNorth, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "16:25"),
        Artist(name: "Uberdope", stage: .MainNorth, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "15:00"),
        Artist(name: "Warhola", stage: .Club, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "20:00"),
        Artist(name: "Yung Felix", stage: .Club, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "18:30"),
        Artist(name: "Balthazar", stage: .MainSouth, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "23:25"),
        Artist(name: "Goose", stage: .MainNorth, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "00:45"),
        Artist(name: "Skunk Anansie", stage: .MainNorth, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "22:05"),
        Artist(name: "Dean Lewis", stage: .MainSouth, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "21:00"),
        Artist(name: "Enter Shikari", stage: .MainNorth, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "19:55"),
        Artist(name: "K's Choice", stage: .MainSouth, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "18:50"),
        Artist(name: "Lil Kleine", stage: .MainSouth, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "17:05"),
        Artist(name: "SaSaSaS", stage: .Club, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "00:00"),
        Artist(name: "Whispering Sons", stage: .MainNorth, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "17:55"),
        Artist(name: "Ares", stage: .Club, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "16:15"),
        Artist(name: "Black Mamba", stage: .Club, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "21:15"),
        Artist(name: "DJ Yolotanker", stage: .Club, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "01:00"),
        Artist(name: "Frenna", stage: .Club, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "15:40"),
        Artist(name: "Gestapo Knallmuzik", stage: .MainSouth, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "13:45"),
        Artist(name: "Glints", stage: .Club, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "19:35"),
        Artist(name: "IBE", stage: .MainNorth, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "14:35"),
        Artist(name: "K1D", stage: .Club, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "18:45"),
        Artist(name: "Kanine", stage: .Club, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "22:45"),
        Artist(name: "Leafs", stage: .Club, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "15:05"),
        Artist(name: "Miss Angel", stage: .Club, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "17:55"),
        Artist(name: "SONS", stage: .MainNorth, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "16:15"),
        Artist(name: "Sports Team", stage: .MainSouth, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "15:25"),
        Artist(name: "StuBru Partysquad", stage: .MainSouth, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "02:05"),
        Artist(name: "The Blockparty", stage: .Club, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "14:30"),
        Artist(name: "Woodie Smalls", stage: .Club, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "20:25"),
        Artist(name: "Yung Mavu", stage: .Club, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "17:05")
        
    ].sorted(by: {$0.name < $1.name})
    
    var selectedArtists: [Artist] = []
    
    struct PropertyKeys {
        static let artistCell = "ArtistCell"
        static let artistDetailsSegue = "ArtistDetailsSegue"
    }
    @IBOutlet weak var dayOfPerformanceButton: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let selectedValue = dayOfPerformanceButton.titleForSegment(at: dayOfPerformanceButton.selectedSegmentIndex)
        selectedArtists = artists.filter {$0.dayOfPerformance.rawValue == selectedValue}
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
        return selectedArtists.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.artistCell, for: indexPath) as! ArtistTableViewCell
        let artist = selectedArtists[indexPath.row]
        // Configure the cell...
        cell.update(with: artist)
        return cell
    }
    
    // Actions
    
    @IBAction func dayOfPerformanceButtonTapped(_ sender: UISegmentedControl) {
        let selectedValue = dayOfPerformanceButton.titleForSegment(at: dayOfPerformanceButton.selectedSegmentIndex)
        selectedArtists = artists.filter {$0.dayOfPerformance.rawValue == selectedValue}
        tableView.reloadData()
    }
    
    // Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let artistDetailsViewController = segue.destination as! ArtistDetailsViewController
        if let indexPath = tableView.indexPathForSelectedRow, segue.identifier == PropertyKeys.artistDetailsSegue {
            artistDetailsViewController.artist = selectedArtists[indexPath.row]
        }
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

}
