//
//  ProfilePage2ViewController.swift
//  TamantomanApp2
//
//  Created by Purnima Thakur on 11/05/21.
//

import UIKit

class ProfilePage2ViewController: UIViewController
{
    @IBOutlet weak var namefield1: UITextField!
    @IBOutlet weak var mobilefield1: UITextField!
    @IBOutlet weak var addressfield1: UITextField!
    @IBOutlet weak var landmarkfield1: UITextField!
    var viewcontroller2:ProfilePageViewController = ProfilePageViewController()
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        let value1 = UserDefaults.standard.string(forKey: "name")
        let value2 = UserDefaults.standard.string(forKey: "contact")
        let value3 = UserDefaults.standard.string(forKey: "address")
        let value4 = UserDefaults.standard.string(forKey: "landmark")
        
        if value1 != nil
        {
            namefield1.text = "\(value1!)"
        }
        if value2 != nil
        {
            mobilefield1.text = "\(value2!)"
        }
        if value3 != nil
        {
            addressfield1.text = "\(value3!)"
        }
        if value4 != nil
        {
            landmarkfield1.text = "\(value4!)"
        }
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
