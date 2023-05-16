//
//  ShoppingTableViewCell.swift
//  TamantomanApp2
//
//  Created by Purnima Thakur on 09/05/21.
//

import UIKit
import CoreData

class ShoppingTableViewCell: UITableViewCell {
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    var indexPath: IndexPath?
    weak var viewController: ShopTableViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @IBAction func actionRemove(_ sender: Any) {
        guard let viewController = viewController, let indexPath = indexPath else {
            return
        }
        
        viewController.total = 0
        let shopping = viewController.shoppingArray[indexPath.row]
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        context.delete(shopping)
        
        do {
            try context.save()
            viewController.shoppingArray.remove(at: indexPath.row)
            viewController.shopTableView.reloadData()
        } catch {
            print("Error in deleting data:", error)
        }
    }
}
