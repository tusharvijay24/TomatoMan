//
//  ProfilePageViewController.swift
//  TamantomanApp2
//
//  Created by Purnima Thakur on 10/05/21.
//

import UIKit

import UIKit

class ProfilePageViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var mobileField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var landmarkField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func orderAction(_ sender: Any) {
        guard let name = nameField.text, !name.isEmpty,
              let contact = mobileField.text, !contact.isEmpty,
              let address = addressField.text, !address.isEmpty,
              let landmark = landmarkField.text, !landmark.isEmpty else {
            let alert = UIAlertController(title: "Missing Information", message: "Please fill in all fields", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okButton)
            present(alert, animated: true, completion: nil)
            return
        }
        
        UserDefaults.standard.set(name, forKey: "name")
        UserDefaults.standard.set(contact, forKey: "contact")
        UserDefaults.standard.set(address, forKey: "address")
        UserDefaults.standard.set(landmark, forKey: "landmark")
        
        let alert = UIAlertController(title: "Order", message: "Order Placed Successfully", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default) { [weak self] (_) in
            let paymentCon = self?.storyboard?.instantiateViewController(withIdentifier: "PaymentViewController") as! PaymentViewController
            self?.navigationController?.pushViewController(paymentCon, animated: true)
        }
        alert.addAction(okButton)
        present(alert, animated: true) {
            self.nameField.text = ""
            self.mobileField.text = ""
            self.addressField.text = ""
            self.landmarkField.text = ""
        }
    }

   
}
