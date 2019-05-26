
import UIKit

class CareerHistoryTableViewCell: UITableViewCell {
  @IBOutlet weak var companyLogo: UIImageView!
  @IBOutlet weak var panelView: UIView!
  @IBOutlet weak var labelJobTitle: UILabel!
  @IBOutlet weak var labelJobDates: UILabel!
  @IBOutlet weak var textViewDescription: UITextView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    panelView.layer.cornerRadius = 8
    panelView.backgroundColor = UIColor.CustomColors.color3
    textViewDescription.backgroundColor = UIColor.clear
    labelJobTitle.textColor = UIColor.white
    labelJobDates.textColor = UIColor.white
    textViewDescription.textColor = UIColor.white
  }
}
