//
//  ProfilePageViewController.swift
//  TamantomanApp2
//
//  Created by Purnima Thakur on 10/05/21.
//

import UIKit

class ProfilePageViewController: UIViewController
{

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var mobileField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var landmarkField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       
       

    }
   
    
    

    @IBAction func Orderaction(_ sender: Any)
    {
        UserDefaults.standard.set(nameField.text!, forKey: "name")
        UserDefaults.standard.set(mobileField.text!, forKey: "contact")
        UserDefaults.standard.set(addressField.text!, forKey: "address")
        UserDefaults.standard.set(landmarkField.text!, forKey: "landmark")
        
        let alert = UIAlertController(title: "Order", message: "Order Placed Successfully", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        {
            (action) -> Void
            in
            let paymentCon : PaymentViewController = self.storyboard?.instantiateViewController(withIdentifier: "PaymentViewController") as! PaymentViewController
            self.navigationController?.pushViewController(paymentCon, animated: true)
        }
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
        nameField.text! = ""
        mobileField.text! = ""
        addressField.text! = ""
        landmarkField.text! = ""
    }
 
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
