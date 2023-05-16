//
//  CollectionViewViewController.swift
//  TamantomanApp2
//
//  Created by Purnima Thakur on 03/05/21.
//

import UIKit
import CoreData

class VegetableCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var vegCollectionView: UICollectionView!
    
    var vegNameArray: [String] = ["Brinjal", "Capsicum", "Cauliflower", "Ladyfinger", "Onion", "Potato"]
    var vegPriceArray: [Float] = [60, 70, 80, 40, 90, 30]
    var vegImageArray: [String] = ["Brinjal", "Capsicum", "Cauliflower", "Ladyfinger", "Onion", "Potato"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "VegetablesCollectionViewCell", bundle: nil)
        vegCollectionView.register(nib, forCellWithReuseIdentifier: "VegetablesCollectionViewCell")
        
        vegCollectionView.dataSource = self
        vegCollectionView.delegate = self
        
        self.navigationItem.leftItemsSupplementBackButton = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationItem.hidesBackButton = true
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vegNameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = vegCollectionView.dequeueReusableCell(withReuseIdentifier: "VegetablesCollectionViewCell", for: indexPath) as! VegetablesCollectionViewCell
        
        cell.vegImage.image = UIImage(named: vegImageArray[indexPath.row])
        cell.priceLabel.text = "\(vegPriceArray[indexPath.row]), Kg"
        cell.vegNameLabel.text = vegNameArray[indexPath.row]
        cell.image = vegImageArray[indexPath.row]
        cell.price = vegPriceArray[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 425, height: 330)
        }
    
    
}
