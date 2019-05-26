import UIKit

class HeaderView: UIView {
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var profilePhoto: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var ageLabel: UILabel!
  
  typealias constants = Constants
  let gradientLayer = CAGradientLayer()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupXib()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupXib()
  }
  
  func setupXib() {
    Bundle.main.loadNibNamed(constants.headerViewNibName, owner: self, options: nil)
    self.frame = containerView.frame
    containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    profilePhoto.image = UIImage(named: constants.profilePhotoName)
    profilePhoto.layer.cornerRadius = profilePhoto.frame.width / 2
    profilePhoto.clipsToBounds = true
    containerView.backgroundColor = UIColor.clear
    nameLabel.textColor = UIColor.white
    ageLabel.textColor = UIColor.white
    addSubview(containerView)
    getPropertyList()
  }
  
  func addGradient() {
    gradientLayer.frame = self.bounds
    gradientLayer.colors = [UIColor.CustomColors.color1.cgColor, UIColor.CustomColors.color2.cgColor]
    gradientLayer.startPoint = CGPoint(x: 0, y: 1)
    layer.insertSublayer(gradientLayer, at: 0)
  }
  
  func getPropertyList() {
    if let path = Bundle.main.path(forResource: "ResumeData", ofType: "plist"),
      let xml = FileManager.default.contents(atPath: path),
      let resumeData = try? PropertyListDecoder().decode(ResumeData.self, from: xml) {
      nameLabel.text = resumeData.nombreCompleto
      ageLabel.text = "\(resumeData.edad) años."
    }
  }
}


