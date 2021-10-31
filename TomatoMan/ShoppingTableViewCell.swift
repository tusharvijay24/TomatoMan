//
//  ShoppingTableViewCell.swift
//  TamantomanApp2
//
//  Created by Purnima Thakur on 09/05/21.
//

import UIKit
import CoreData

class ShoppingTableViewCell: UITableViewCell
{
    @IBOutlet weak var ItemNameLabel: UILabel!
    @IBOutlet weak var ItemImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var QuantityLabel: UILabel!
    var indexpath:IndexPath?
    var viewcontroller:ShopTableViewController = ShopTableViewController()
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func actionRemove(_ sender: Any)
    {
        viewcontroller.total = 0
        let shoping = viewcontroller.shoppingArray[indexpath!.row]
        
        let appDel:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.persistentContainer.viewContext

        context.delete(shoping)
        do{
            try context.save()
            viewcontroller.shoppingArray.remove(at: indexpath!.row)
            viewcontroller.shopTableView.reloadData()
            
            
            
        }catch{
            print("error in delete")
        }
        
    }
    
}

