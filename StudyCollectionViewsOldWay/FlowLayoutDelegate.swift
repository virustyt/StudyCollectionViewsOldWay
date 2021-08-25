//
//  delegate.swift
//  StudyCollectionViewsOldWay
//
//  Created by Vladimir Oleinikov on 25.08.2021.
//

import UIKit

class FlowLayoutDelegate: NSObject, UICollectionViewDelegateFlowLayout {
    let numberOfItemsPerRow: CGFloat
    let interItemSpacing:CGFloat
    
    init(numberOfItemsPerRow:CGFloat, interItemSpacing:CGFloat) {
        self.interItemSpacing = interItemSpacing
        self.numberOfItemsPerRow = numberOfItemsPerRow
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxWidth = UIScreen.main.bounds.width
        let totalSpacing = interItemSpacing * numberOfItemsPerRow
        
        let itemWidth = (maxWidth - totalSpacing) / numberOfItemsPerRow
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let edgeInsets: UIEdgeInsets
        if section == 0 {
            edgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: interItemSpacing/2, right: 0)
        } else {
            edgeInsets = UIEdgeInsets(top: interItemSpacing/2, left: 0, bottom: interItemSpacing/2, right: 0)
        }
        return edgeInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        interItemSpacing
    }
    
}
