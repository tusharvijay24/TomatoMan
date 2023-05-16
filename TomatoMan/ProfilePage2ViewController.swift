//
//  ProfilePage2ViewController.swift
//  TamantomanApp2
//
//  Created by Purnima Thakur on 11/05/21.
//

import UIKit

class ProfilePage2ViewController: UIViewController {

    @IBOutlet weak var nameField1: UITextField!
    @IBOutlet weak var mobileField1: UITextField!
    @IBOutlet weak var addressField1: UITextField!
    @IBOutlet weak var landmarkField1: UITextField!

    var viewController2: ProfilePageViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let value1 = UserDefaults.standard.string(forKey: "name")
        let value2 = UserDefaults.standard.string(forKey: "contact")
        let value3 = UserDefaults.standard.string(forKey: "address")
        let value4 = UserDefaults.standard.string(forKey: "landmark")
        
        nameField1.text = value1 ?? ""
        mobileField1.text = value2 ?? ""
        addressField1.text = value3 ?? ""
        landmarkField1.text = value4 ?? ""
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? ProfilePageViewController {
            viewController2 = destinationVC
        }
    }
}
