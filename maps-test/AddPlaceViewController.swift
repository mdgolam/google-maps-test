//
//  AddPlaceViewController.swift
//  maps-test
//
//  Created by Vlad Md Golam on 28.05.2018.
//  Copyright © 2018 Vlad Md Golam. All rights reserved.
//

import UIKit

protocol AddPlaceViewControllerDelegate {
    func addNew(place: Place)
}

class AddPlaceViewController: UIViewController {

    var delegate: AddPlaceViewControllerDelegate!
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var latitudeText: UITextField!
    @IBOutlet weak var longitudeText: UITextField!
    @IBOutlet weak var infoText: UITextField!
    
    @IBAction func saveButton(_ sender: Any) {
        let latitude :Double? = Double(latitudeText.text!)
        let longitude :Double? = Double(longitudeText.text!)
        delegate.addNew(place: Place(latitude: latitude!, longitude: longitude!, title: nameText.text!, snippet: infoText.text!))
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
