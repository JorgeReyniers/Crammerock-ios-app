//
//  LineUpTableViewController.swift
//  Crammerock-ios-app
//
//  Created by Jorgé Reyniers on 03/08/2019.
//  Copyright © 2019 Jorgé Reyniers. All rights reserved.
//

import UIKit

class LineUpTableViewController: UITableViewController {
    
    var artists: [Artist] = []
    var selectedArtists: [Artist] = []
    
    struct PropertyKeys {
        static let artistCell = "ArtistCell"
        static let artistDetailsSegue = "ArtistDetailsSegue"
    }
    @IBOutlet weak var dayOfPerformanceButton: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        artists = getArtists().sorted(by: {$0.name < $1.name})
        selectedArtists = defineSelectedArtists()
        tableView.reloadData()
    }
    
    func getArtists() -> [Artist] {
        guard let artists = Artist.loadFromFile() else { return Artist.loadArtists() }
        return artists
    }
    
    func defineSelectedArtists() -> [Artist] {
        return artists.filter {$0.dayOfPerformance.rawValue == dayOfPerformanceButton.selectedSegmentIndex}
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
        selectedArtists = defineSelectedArtists()
        tableView.reloadData()
    }
    
    // Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == PropertyKeys.artistDetailsSegue else { return }
        if let indexPath = tableView.indexPathForSelectedRow {
            let artistDetailsViewController = segue.destination as! ArtistDetailsViewController
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
