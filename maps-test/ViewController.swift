//
//  ViewController.swift
//  maps-test
//
//  Created by Vlad Md Golam on 23.05.2018.
//  Copyright © 2018 Vlad Md Golam. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import CoreLocation

class ViewController: UIViewController, GMSMapViewDelegate, AddPlaceViewControllerDelegate {
    
    private lazy var map = Map()
    
    var markers: Set<GMSMarker> = []
    
    @IBOutlet fileprivate weak var mapView: GMSMapView!
    var marker = GMSMarker()
    
    @IBAction func fetch(_ sender: Any) {
        print("fetch button")
        map.fetch()
    }
    
    
    func addNew(place: Place) {
        map.addPlace(place: place)
        //future: redraw all places
        showMarker(place: place)
    }
    
//    View Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let camera: GMSCameraPosition = GMSCameraPosition.camera(withLatitude: 55.728412, longitude: 37.635370, zoom: 17)
        mapView.settings.myLocationButton = true
        mapView.delegate = self
        mapView.camera = camera
        for place in map.places {
            showMarker(place: place)
        }
    }
    
    //    MARK: Navigation Methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPlaceSegue" {
            let destViewController = segue.destination as! AddPlaceViewController
            destViewController.delegate = self
        } else if segue.identifier == "ShowDetailSegue" {
            print("Show detail segue")
            let destViewController = segue.destination as! PlaceDetailsViewController
            destViewController.place = sender as! GMSMarker
        } else if segue.identifier == "ShowDetailSegue" {
            let destViewController = segue.destination as! PlaceDetailsViewController
            destViewController.place = sender as! GMSMarker
        }
    }
    
    func showMarker(place: Place){
        let marker = GMSMarker()
        marker.position = place.location
        marker.title = place.title
        marker.snippet = place.snippet
        marker.map = mapView
        markers.insert(marker)
    }
}

extension ViewController {
    /* handles Info Window tap */
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        performSegue(withIdentifier: "ShowDetailSegue", sender: marker)
        print("didTapInfoWindowOf")
    }
    
    /* handles Info Window long press */
    func mapView(_ mapView: GMSMapView, didLongPressInfoWindowOf marker: GMSMarker) {
        print("didLongPressInfoWindowOf")
    }
    
    /* set a custom Info Window */
//    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
//        let view = UIView(frame: CGRect.init(x: 0, y: 0, width: 200, height: 70))
//        view.backgroundColor = UIColor.white
//        view.layer.cornerRadius = 6
//
//        let lbl1 = UILabel(frame: CGRect.init(x: 8, y: 8, width: view.frame.size.width - 16, height: 15))
//        lbl1.text = "Hi there!"
//        view.addSubview(lbl1)
//
//        let lbl2 = UILabel(frame: CGRect.init(x: lbl1.frame.origin.x, y: lbl1.frame.origin.y + lbl1.frame.size.height + 3, width: view.frame.size.width - 16, height: 15))
//        lbl2.text = "I am a custom info window."
//        lbl2.font = UIFont.systemFont(ofSize: 14, weight: .light)
//        view.addSubview(lbl2)
//
//        return view
//    }
}
