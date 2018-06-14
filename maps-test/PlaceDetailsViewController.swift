//
//  PlaceDetailsViewController.swift
//  maps-test
//
//  Created by Vlad Md Golam on 28.05.2018.
//  Copyright © 2018 Vlad Md Golam. All rights reserved.
//

import UIKit
import GoogleMaps

class PlaceDetailsViewController: UITableViewController {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var latitudeLabel: UILabel!
    @IBOutlet private weak var longitudeLabel: UILabel!
    @IBOutlet private weak var infoLabel: UILabel!
    
    var place: GMSMarker!
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateView()
    }
    
    func updateView() {
        nameLabel.text = place.title!
        latitudeLabel.text = String(place.position.latitude)
        longitudeLabel.text = String(place.position.longitude)
        infoLabel.text = place.snippet!
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
