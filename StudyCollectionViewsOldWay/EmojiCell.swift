
import UIKit

class EmojiCell: UICollectionViewCell {
  static let reuseIdentifier = String(describing: EmojiCell.self)
    
  @IBOutlet weak var emojiLabel: UILabel!
    
    var isEditing:Bool = false
    
    override var isSelected: Bool {
        didSet {
            if isSelected { backgroundColor =  isEditing ? #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) }
            else { backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) }
        }
    }
}
