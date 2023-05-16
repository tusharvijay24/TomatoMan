//
//  PaymentViewController.swift
//  TamantomanApp2
//
//  Created by Purnima Thakur on 11/05/21.
//

import UIKit


import UIKit

class PaymentViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var modeLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var totalLabel1: UILabel!

    var date = Date()
    var paymentMode = "Pay On Delivery"
    var status = "Pending"
    var total: Float = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        totalLabel1.text = "\(total)"
        modeLabel.text = paymentMode
        statusLabel.text = status

        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy, hh:mm"
        let strDateTime = formatter.string(from: date)
        dateLabel.text = strDateTime
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }

    @IBAction func shopMoreAction(_ sender: Any) {
        let collectionCon = storyboard?.instantiateViewController(withIdentifier: "CollectionViewViewController") as! VegetableCollectionViewController
        navigationController?.pushViewController(collectionCon, animated: true)
    }

    
}
