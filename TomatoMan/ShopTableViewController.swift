//
//  ShopTableViewController.swift
//  TamantomanApp2
//
//  Created by Purnima Thakur on 04/05/21.
//

import UIKit
import CoreData

class ShopTableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{

    @IBOutlet weak var shopTableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    var total:Float = 0
    
    var shoppingArray:[Shoping] = []
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool)
    {
        shopTableView.dataSource = self
        shopTableView.delegate = self
        
        let appDel:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.persistentContainer.viewContext
        
        var fetchReq:NSFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Shoping")
        
        do{
            shoppingArray = try context.fetch(fetchReq) as! [Shoping]
            print(shoppingArray)
        }catch
        {
            print("Error in fetch data")
        }
        let cellNib = UINib(nibName: "ShoppingTableViewCell", bundle: nil)
        shopTableView.register(cellNib, forCellReuseIdentifier: "ShoppingTableViewCell")
    }
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return shoppingArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = shopTableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as! ShoppingTableViewCell
        
        let shop:Shoping = shoppingArray[indexPath.row]
        
        total = total+shop.total
        totalLabel!.text = "\(String(total)) Rs"
        
        cell.ItemNameLabel!.text = shop.name
        cell.priceLabel!.text = String(shop.price)
        cell.QuantityLabel!.text = String(shop.quantity)
        cell.ItemImageView.image = UIImage(named: shop.image!)
        cell.indexpath = indexPath
        cell.viewcontroller = self
        
        return cell
        
    }
    
    
    @IBAction func actionPlaceholder(_ sender: Any)
    {
        let placeCon : ProfilePageViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProfilePageViewController") as! ProfilePageViewController
        self.navigationController?.pushViewController(placeCon, animated: true)
        
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
