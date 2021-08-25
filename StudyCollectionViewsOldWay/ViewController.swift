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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showDetail",
              let cell = sender as? EmojiCell,
              let indexPathOfCell = collectionView.indexPath(for: cell),
              let detailViewController = segue.destination as? DetailViewController
        else { fatalError("Can not prepare seguei") }
              
        
        let category = Emoji.shared.sections[indexPathOfCell.section]
        let emoji = Emoji.shared.data[category]?[indexPathOfCell.item] ?? ""
        
        detailViewController.emoji = emoji
    }


}

