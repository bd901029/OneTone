

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    
   
    @IBOutlet weak var cell_Label: UILabel!
    @IBOutlet weak var labelIcon: UILabel!
    
   
    
    override func awakeFromNib() {
        
    labelIcon.layer.masksToBounds = true
        labelIcon.layer.cornerRadius = 7.5
      cell_Label.textColor = UIColor.darkGray
       
    }
    
    override var isHighlighted: Bool {
        didSet {
             cell_Label.textColor = isSelected ? UIColor.darkGray : UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
            labelIcon.backgroundColor = isSelected ? UIColor.red : UIColor(red: 40/255, green: 230/255, blue: 173/255, alpha: 1)
            
        }
    }
    
    override var isSelected: Bool {
        didSet {
            cell_Label.textColor = isHighlighted ? UIColor.lightGray : UIColor(red: 159/255, green: 176/255, blue: 192/255, alpha: 1)
           
            
            labelIcon.backgroundColor = isSelected ? UIColor(red: 40/255, green: 230/255, blue: 173/255, alpha: 1) : UIColor.red

        }
    }
    
    
    
}
