//
//  ViewController.swift
//  StudyCollectionViewsOldWay
//
//  Created by Vladimir Oleinikov on 24.08.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    let dataSource = DataSource()
    let flowLayoutDelegate = FlowLayoutDelegate(numberOfItemsPerRow: 5, interItemSpacing: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = dataSource
        collectionView.delegate = flowLayoutDelegate
        
    }


}

