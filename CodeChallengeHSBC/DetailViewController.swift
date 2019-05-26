import UIKit

class DetailViewController: UIViewController {
  @IBOutlet weak var pageTitle: UILabel!
  @IBOutlet weak var pageContent: UITextView!
  
  var selectedInfo = [String]()

  override func viewDidLoad() {
    super.viewDidLoad()
    pageTitle.text = selectedInfo.first
    pageContent.text = selectedInfo[1]
    pageTitle.backgroundColor = UIColor.CustomColors.color4
    pageTitle.textColor = UIColor.white
    pageTitle.layer.masksToBounds = true
    pageTitle.layer.cornerRadius = 8
    pageContent.layer.cornerRadius = 8
    pageContent.backgroundColor = UIColor.CustomColors.color4
    pageContent.textColor = UIColor.white
  }
  
  @IBAction func closeButtonTapped(sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }
}

