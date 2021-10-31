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

class ViewController: UIViewController
{
    @IBOutlet weak var mobileLabel: UILabel!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var otpLabel: UILabel!
    @IBOutlet weak var otpField: UITextField!
    
    @IBOutlet weak var getotpButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    var verification_ID : String? = nil
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        otpLabel.isHidden = true
        otpField.isHidden = true
        submitButton.isHidden = true
        numberField.text = "+91"
    }

    @IBAction func actionGetOTP(_ sender: Any)
    {
        if numberField!.text!.isEmpty == false
        {
            let mobNo = "\(numberField.text!)"
            Auth.auth().settings?.isAppVerificationDisabledForTesting = false
            PhoneAuthProvider.provider().verifyPhoneNumber(mobNo, uiDelegate: nil) { (verificationid, error)
                in
                if error != nil
                {
                    return
                }
                else
                {
                    self.verification_ID = verificationid
                    self.otpLabel.isHidden = false
                    self.otpField.isHidden = false
                    self.submitButton.isHidden = false
                }
            }
            
        }
        else
        {
            print("Enter phone number")
        }
    }
    
    @IBAction func actionSubmit(_ sender: Any)
    {
        if verification_ID != nil
        {
            let credential = PhoneAuthProvider.provider().credential(withVerificationID: verification_ID!, verificationCode: otpField.text!)
            
            Auth.auth().signIn(with: credential) { (authdata, error)
                in
                if error != nil
                {
                    print("error in credential",error as Any)
                    return
                }
                else
                {
                    print("Authentication Successfull",(authdata?.user.phoneNumber! ?? "No number" ))
                    
                    let collectionCon : CollectionViewViewController = self.storyboard?.instantiateViewController(withIdentifier: "CollectionViewViewController") as! CollectionViewViewController
                    self.present(collectionCon, animated: true, completion: nil)
                }
            }
            
        }
    }
}

