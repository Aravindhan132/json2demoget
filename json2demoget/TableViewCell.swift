 
import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var lblname: UILabel!
    
    @IBOutlet var lblcapital: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialzation code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
