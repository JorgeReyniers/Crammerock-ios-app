//
//  TimetableTableTableViewController.swift
//  Crammerock-ios-app
//
//  Created by Jorgé Reyniers on 25/08/2019.
//  Copyright © 2019 Jorgé Reyniers. All rights reserved.
//

import UIKit

class TimetableTableViewController: UITableViewController {
    
    var artists: [[Artist]] = []
    
    struct PropertyKeys {
        static let timetableCell = "TimetableCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let fridayArtists = getArtists().filter {$0.dayOfPerformance == .Vrijdag && $0.isFavorite == true}.sorted(by: <)
        let saturdayArtists = getArtists().filter {$0.dayOfPerformance == .Zaterdag && $0.isFavorite == true}.sorted(by: <)
        artists = [fridayArtists, saturdayArtists]
        tableView.reloadData()
    }
    
    func getArtists() -> [Artist] {
        guard let artists = Artist.loadFromFile() else { return Artist.loadArtists() }
        return artists
    }
    
    // table view methods

    override func numberOfSections(in tableView: UITableView) -> Int {
        return artists.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists[section].count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let sectionHeader = DayOfPerformance.init(rawValue: section)?.stringValue else { return "" }
        return sectionHeader
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.timetableCell, for: indexPath) as! TimetableTableViewCell
        let artist = artists[indexPath.section][indexPath.row]
        cell.update(with: artist)
        return cell
    }
}
