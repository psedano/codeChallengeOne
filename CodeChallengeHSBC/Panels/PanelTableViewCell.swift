import UIKit

class PanelTableViewCell: UITableViewCell {
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var labelTitle: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    layer.cornerRadius = 8
    layer.borderWidth = 0
    containerView.backgroundColor = UIColor.orange
    containerView.layer.cornerRadius = 8
  }
}
