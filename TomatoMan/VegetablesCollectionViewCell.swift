//
//  VegetablesCollectionViewCell.swift
//  TamantoManApp
//
//  Created by Purnima Thakur on 30/04/21.
//

import UIKit
import CoreData

class VegetablesCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var vegImage: UIImageView!
    @IBOutlet weak var vegNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var quantityStepper: UIStepper!
    
    var image:String = ""
    var price:Float = 0
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func quantitychange()
    {
        quantityLabel.text = String(quantityStepper.value)
    }
    @IBAction func actionAddtoCart(_ sender: Any)
    {
        let appDel : AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let context : NSManagedObjectContext = appDel.persistentContainer.viewContext
        
        var shop:Shoping = NSEntityDescription.insertNewObject(forEntityName: "Shoping", into: context) as! Shoping
        
        shop.name = vegNameLabel!.text!
        shop.image = image
        shop.price = price
        shop.quantity = Float(quantityStepper.value)
        shop.total = Float(price*Float(quantityStepper.value))
        
        do{
            try context.save()
            print("Data Saved")
        }catch
        {
            print("Error in save data",error)
        }
        
    }
}
