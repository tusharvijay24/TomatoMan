//
//  ViewController.swift
//  TamantomanApp2
//
//  Created by Purnima Thakur on 01/05/21.
//

import UIKit
import FirebaseAnalytics
import FirebaseAuth
import Firebase
import CoreData

class VegetableViewController: UIViewController {

    @IBOutlet weak var mobileLabel: UILabel!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var otpLabel: UILabel!
    @IBOutlet weak var otpField: UITextField!
    @IBOutlet weak var getotpButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    var verificationID: String? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        otpLabel.isHidden = true
        otpField.isHidden = true
        submitButton.isHidden = true
        numberField.text = "+91"
    }

    @IBAction func actionGetOTP(_ sender: Any) {
        if let phoneNumber = numberField.text, !phoneNumber.isEmpty {
            Auth.auth().settings?.isAppVerificationDisabledForTesting = false
            PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
                if let error = error {
                    print("Error verifying phone number:", error.localizedDescription)
                    return
                }
                guard let verificationID = verificationID else {
                    print("Verification ID is nil")
                    return
                }
                self.verificationID = verificationID
                self.otpLabel.isHidden = false
                self.otpField.isHidden = false
                self.submitButton.isHidden = false
            }
        } else {
            print("Enter phone number")
        }
    }

    @IBAction func actionSubmit(_ sender: Any) {
        if let verificationID = verificationID, let verificationCode = otpField.text {
            let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: verificationCode)

            Auth.auth().signIn(with: credential) { (authResult, error) in
                if let error = error {
                    print("Error signing in:", error.localizedDescription)
                    return
                }
                guard let phoneNumber = authResult?.user.phoneNumber else {
                    print("No phone number available")
                    return
                }
                print("Authentication Successful:", phoneNumber)

                let collectionCon: VegetableCollectionViewController = self.storyboard?.instantiateViewController(withIdentifier: "CollectionViewViewController") as! VegetableCollectionViewController
                self.navigationController?.pushViewController(collectionCon, animated: true)
            }
        }
    }
}
