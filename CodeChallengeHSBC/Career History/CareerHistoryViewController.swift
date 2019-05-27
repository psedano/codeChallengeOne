import UIKit

class CareerHistoryViewController: UIViewController {
  @IBOutlet weak var careerTableView: UITableView!
  typealias constants = Constants
  var careerHistory = [[String:String]]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    careerTableView.dataSource = self
    careerTableView.delegate = self
  }
  
  @IBAction func closeButtonTapped(sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }
}

extension CareerHistoryViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return careerHistory.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "careerCell") as! CareerHistoryTableViewCell
    cell.companyLogo.image = UIImage(named: careerHistory[indexPath.row]["companyLogo"]!)
    cell.labelJobTitle.text = careerHistory[indexPath.row]["jobTitle"]!
    cell.labelJobDates.text = careerHistory[indexPath.row]["dates"]!
    cell.textViewDescription.text = careerHistory[indexPath.row]["jobDescription"]!
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 300
  }
}
