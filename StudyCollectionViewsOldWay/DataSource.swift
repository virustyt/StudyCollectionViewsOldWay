//
//  DataSource.swift
//  StudyCollectionViewsOldWay
//
//  Created by Vladimir Oleinikov on 25.08.2021.
//

import UIKit

class DataSource : NSObject,UICollectionViewDataSource {
    let dataModel = Emoji.shared
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataModel.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let category = dataModel.sections[section]
        let numberOfItems = dataModel.data[category]?.count ?? 0
        
        return numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let category = dataModel.sections[indexPath.section]
        let itemForCell = dataModel.data[category]?[indexPath.item] ?? ""
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmojiCell.reuseIdentifier, for: indexPath) as? EmojiCell else { fatalError("Cell cznnot be created, bro") }
        
        cell.emojiLabel.text = itemForCell
        cell.layer.borderColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        cell.layer.borderWidth = 2.0
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionViewHeader.reusableIdentifier, for: indexPath) as? CollectionViewHeader else { fatalError("Can not load reusable view") }
         
        header.sectionNameLabel.text = Emoji.shared.sections[indexPath.section].rawValue
        
        return header
    }
}
