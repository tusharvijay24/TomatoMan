//
//  ShopTableViewController.swift
//  TamantomanApp2
//
//  Created by Purnima Thakur on 04/05/21.
//

import UIKit
import CoreData

class ShopTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var shopTableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    
    var total: Float = 0
    var shoppingArray: [Shopping] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shopTableView.dataSource = self
        shopTableView.delegate = self
        
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let context = appDel.persistentContainer.viewContext
        
        let fetchReq: NSFetchRequest<Shopping> = Shopping.fetchRequest()
        
        do {
            shoppingArray = try context.fetch(fetchReq)
            print(shoppingArray)
        } catch {
            print("Error in fetching data:", error)
        }
        
        let cellNib = UINib(nibName: "ShoppingTableViewCell", bundle: nil)
        shopTableView.register(cellNib, forCellReuseIdentifier: "ShoppingTableViewCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = shopTableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as! ShoppingTableViewCell
        
        let shop = shoppingArray[indexPath.row]
        total += shop.total
        totalLabel.text = "\(String(total)) Rs"
        
        cell.itemNameLabel.text = shop.name
        cell.priceLabel.text = String(shop.price)
        cell.quantityLabel.text = String(shop.quantity)
        cell.itemImageView.image = UIImage(named: shop.image!)
        cell.indexPath = indexPath
        cell.viewController = self
        
        return cell
    }
    
    @IBAction func actionPlaceholder(_ sender: Any) {
        let placeCon = storyboard?.instantiateViewController(withIdentifier: "ProfilePageViewController") as! ProfilePageViewController
        navigationController?.pushViewController(placeCon, animated: true)
    }
}
