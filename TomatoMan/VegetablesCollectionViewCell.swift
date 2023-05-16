//
//  VegetablesCollectionViewCell.swift
//  TamantoManApp
//
//  Created by Purnima Thakur on 30/04/21.
//

import UIKit
import CoreData

class VegetablesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var vegImage: UIImageView!
    @IBOutlet weak var vegNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var quantityStepper: UIStepper!

    var image: String = ""
    var price: Float = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func quantityChanged(_ sender: UIStepper) {
        quantityLabel.text = String(sender.value)
    }

    @IBAction func actionAddToCart(_ sender: Any) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Shopping", in: context) else {
            print("Entity description not found")
            return
        }
        
        let shopping = Shopping(entity: entity, insertInto: context)
        shopping.name = vegNameLabel.text!
        shopping.image = image
        shopping.price = price
        shopping.quantity = Float(quantityStepper.value)
        shopping.total = price * Float(quantityStepper.value)
        
        do {
            try context.save()
            print("Data saved")
        } catch {
            print("Error in saving data:", error)
        }
    }
}
