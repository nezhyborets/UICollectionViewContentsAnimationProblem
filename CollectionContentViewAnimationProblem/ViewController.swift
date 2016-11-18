//
//  ViewController.swift
//  CollectionContentViewAnimationProblem
//
//  Created by Oleksii Nezhyborets on 18.11.16.
//  Copyright © 2016 onix. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var collectionView: UICollectionView!
    var selectedIndex : Int = 0

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProblematicCell", for: indexPath) as! ProblematicCollectionViewCell
        
        cell.contentView.backgroundColor = UIColor.red
        cell.backgroundColor = UIColor.purple
        cell.clipsToBounds = false
        cell.contentView.clipsToBounds = true
        
        return cell
    }
    
    //#MARK: UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        
        collectionView.performBatchUpdates({
            collectionView.reloadData() 
        }, completion: nil)

        
        //Gives the same result as reloadData() in performBatchUpdates
//        let newLayout = UICollectionViewFlowLayout()
//        newLayout.scrollDirection = .horizontal
//        collectionView.setCollectionViewLayout(newLayout, animated: true)
        
        
        //Gives not animation at all
//        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let isSelected = self.selectedIndex == indexPath.row
        let someSize : CGFloat = 90 //doesn't matter
        let sizeK : CGFloat = isSelected ? 0.9 : 0.65
        let size = CGSize(width: someSize * sizeK, height: someSize * sizeK)
        
        return size
    }
}

