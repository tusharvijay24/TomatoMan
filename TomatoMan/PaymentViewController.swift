//
//  PaymentViewController.swift
//  TamantomanApp2
//
//  Created by Purnima Thakur on 11/05/21.
//

import UIKit


class PaymentViewController: UIViewController
{

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var modeLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var totallLabel1: UILabel!
    
    
    var date = Date()
    var paymentmode = "Pay On Delivery"
    var status = "Pending"
    var total:Float = 0
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       
        totallLabel1.text = "\(total)"
        modeLabel.text = "\(paymentmode)"
        statusLabel.text = "\(status)"
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        
        let strDate = formatter.string(from: date)
        formatter.dateFormat = "hh:mm"
        let strTime = formatter.string(from: date)
        print(strDate,strTime)
        dateLabel.text = "\(strDate),\(strTime)"
        
    }
    override func viewDidAppear(_ animated: Bool)
    {
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool)
    {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func ShopmoreAction(_ sender: Any)
    {
        let collectionCon = self.storyboard?.instantiateViewController(withIdentifier: "CollectionViewViewController") as! CollectionViewViewController
        self.navigationController?.pushViewController(collectionCon, animated: true)
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
