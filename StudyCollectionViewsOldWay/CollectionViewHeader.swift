//
//  CollectionViewHeader.swift
//  StudyCollectionViewsOldWay
//
//  Created by Vladimir Oleinikov on 25.08.2021.
//

import UIKit

class CollectionViewHeader : UICollectionReusableView {
    @IBOutlet var sectionNameLabel: UILabel!
    static let reusableIdentifier = String(describing: CollectionViewHeader.self)
}
