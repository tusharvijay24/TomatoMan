//
//  CollectionViewViewController.swift
//  TamantomanApp2
//
//  Created by Purnima Thakur on 03/05/21.
//

import UIKit
import CoreData

class CollectionViewViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate
{

    @IBOutlet weak var vegCollectionView: UICollectionView!
    var vegNameArray:[String] = ["Brinjal","Capsicum","Cauliflower","Ladyfinger","onion","Patato"]
    
    var vegPriceArray:[Float] = [60,70,80,40,90,30,50]
    
    var vegImageArray:[String] = ["Brinjal","Capsicum","Cauliflower","Ladyfinger","onion","Patato"]
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
//        let nib = UINib(nibName: "VegetablesCollectionViewCell", bundle: nil)
//        vegCollectionView.register(nib, forCellWithReuseIdentifier: "VegetablesCollectionViewCell")
//
        let nib = UINib(nibName: "VegetablesCollectionViewCell", bundle: nil)
        vegCollectionView.register(nib, forCellWithReuseIdentifier: "VegetablesCollectionViewCell")
        
        vegCollectionView.dataSource=self
        vegCollectionView.delegate=self
        
        
        // Do any additional setup after loading the view.
        self.navigationItem.leftItemsSupplementBackButton = true
        
        
        
        
    }
    override func viewDidAppear(_ animated: Bool)
    {
        navigationItem.hidesBackButton = true
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vegNameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = vegCollectionView.dequeueReusableCell(withReuseIdentifier: "VegetablesCollectionViewCell", for: indexPath) as! VegetablesCollectionViewCell
        
        cell.vegImage.image = UIImage(named: vegImageArray[indexPath.row])
        cell.priceLabel.text = "\(vegPriceArray[indexPath.row]),Kg"
        cell.vegNameLabel.text = vegNameArray[indexPath.row]
        cell.image = vegImageArray[indexPath.row]
        cell.price = vegPriceArray[indexPath.row]
        return cell
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
