import UIKit

class CareerHistoryViewController: UIViewController {
  typealias constants = Constants
  var careerHistory = [[String:String]]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  func getPropertyList() {
    if let path = Bundle.main.path(forResource: constants.resuleDataName, ofType: constants.plistType),
      let xml = FileManager.default.contents(atPath: path),
      let resumeData = try? PropertyListDecoder().decode(ResumeData.self, from: xml) {
      careerHistory = resumeData.careerHistory
    }
  }
}
