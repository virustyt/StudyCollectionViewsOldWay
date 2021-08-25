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
        self.navigationItem.leftBarButtonItem = editButtonItem
        
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        collectionView.indexPathsForVisibleItems.forEach
        {
            guard let cell = collectionView.cellForItem(at: $0) as? EmojiCell
            else { return }
            cell.isEditing = editing
        }
        
        if !isEditing{
            collectionView.indexPathsForSelectedItems?.compactMap { $0 }.forEach
            {
                collectionView.deselectItem(at: $0, animated: true)
            }
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if !isEditing, identifier == "showDetail" {
           return true
        }
        return false
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

    @IBAction func AddEmoji(_ sender: UIBarButtonItem) {
        let (category,emoji) = Emoji.randomEmoji()
        dataSource.addEmoji(emoji: emoji, at: category)
        
        guard let section = Emoji.shared.sections.firstIndex(of: category) else { fatalError("Can not find needed category.") }
        let numberOfItems = collectionView.numberOfItems(inSection: section)
        
        let indexPath = IndexPath(item: numberOfItems, section: section)
        
        collectionView.insertItems(at: [indexPath])
    }
    
}

