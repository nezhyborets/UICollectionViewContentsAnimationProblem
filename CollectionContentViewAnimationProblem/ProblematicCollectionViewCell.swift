//
//  ProblematicCollectionViewCell.swift
//  CollectionContentViewAnimationProblem
//
//  Created by Oleksii Nezhyborets on 18.11.16.
//  Copyright © 2016 onix. All rights reserved.
//

import UIKit

class ProblematicCollectionViewCell: UICollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //Because contentView won't animate along with cell
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
