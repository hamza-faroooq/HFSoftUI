//
//  ViewController2.swift
//  HFSoftUI
//
//  Created by Hamza on 29/01/2020.
//  Copyright © 2020 Hamza. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.backgroundColor = HFSoftUIColor
        
    }
    
}

extension ViewController2: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ViewController2CollectionViewCell
        
        cell.cellImageView.layer.cornerRadius = 8
        
        DispatchQueue.main.async {
               cell.cellOuterView.HFSoftUIView(backgroundColorValue: HFSoftUIColor, isDarkColorScheme: isDarkColorScheme, isUpperWhiteRequired: isUpperWhiteRequired)
        }
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth = UIScreen.main.bounds.width
        
        return CGSize(width: cellWidth, height: 200)
        
    }
    
}
