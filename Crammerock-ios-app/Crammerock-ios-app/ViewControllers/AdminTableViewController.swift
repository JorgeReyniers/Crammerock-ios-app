//
//  AdminTableViewController.swift
//  Crammerock-ios-app
//
//  Created by Jorgé Reyniers on 03/08/2019.
//  Copyright © 2019 Jorgé Reyniers. All rights reserved.
//

import UIKit

class AdminTableViewController: UITableViewController {
    var artists: [Artist] = []
    
    struct PropertyKeys {
        static let manageArtistCell = "ManageArtistCell"
        static let editArtistSegue = "EditArtistSegue"
        static let saveUnwindSegue = "SaveUnwindSegue"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        artists = getArtists().sorted(by: {$0.name < $1.name})
    }
    
    func getArtists() -> [Artist] {
        guard let artists = Artist.loadFromFile() else { return Artist.loadArtists() }
        return artists
    }

    // table view methods

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.manageArtistCell, for: indexPath)
        let artist = artists[indexPath.row]
        cell.textLabel?.text = artist.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            artists.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            Artist.saveToFile(artists: artists)
        }
    }
    
    // segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == PropertyKeys.editArtistSegue else { return }
        if let indexPath = tableView.indexPathForSelectedRow {
            let addEditNavigationViewController = segue.destination as! UINavigationController
            let addEditArtistTableViewController = addEditNavigationViewController.topViewController as! AddEditArtistTableViewController
            addEditArtistTableViewController.artist = artists[indexPath.row]
        }
    }
    
    @IBAction func unwindToAdminTableViewController(segue: UIStoryboardSegue){
        guard segue.identifier == PropertyKeys.saveUnwindSegue else { return }
        let addEditArtistTableViewController = segue.source as! AddEditArtistTableViewController
        
        if let artist = addEditArtistTableViewController.artist {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                artists[selectedIndexPath.row] = artist
            } else {
                artists.append(artist)
            }
        }
        artists = artists.sorted(by: {$0.name < $1.name})
        Artist.saveToFile(artists: artists)
        tableView.reloadData()
    }
}
