//
//  DetailViewController.swift
//  StudyCollectionViewsOldWay
//
//  Created by Vladimir Oleinikov on 25.08.2021.
//

import UIKit

class DetailViewController : ViewController {
    
    @IBOutlet var emojiLabel: UILabel!
        
    var emoji:String = ""
    
    override func viewDidLoad() {
        emojiLabel.text = emoji
        
    }
}
