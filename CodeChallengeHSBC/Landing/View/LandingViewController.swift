//
//  ViewController.swift
//  CodeChallengeHSBC
//
//  Created by Pablo Irmin Rivera Sedano on 5/21/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var headerView: HeaderView!
  @IBOutlet weak var panelsTableView: UITableView!
  typealias constants = Constants
  var informationForTitles = [String]()
  var informationContent = [String]()
  var selectedInfo = [String]()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    headerView.addGradient()
  }

  func setupUI() {
    getPropertyList()
    panelsTableView.dataSource = self
    panelsTableView.delegate = self
  }
  
  func getPropertyList() {
    if let path = Bundle.main.path(forResource: constants.resuleDataName, ofType: constants.plistType),
      let xml = FileManager.default.contents(atPath: path),
      let resumeData = try? PropertyListDecoder().decode(ResumeData.self, from: xml) {
      informationForTitles = resumeData.informationTitulos
      informationContent = resumeData.informacionContenido
    }
  }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return informationForTitles.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: constants.cellIdentifier) as! PanelTableViewCell
    cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
    cell.labelTitle.text = informationForTitles[indexPath.row]
    cell.labelTitle.textColor = UIColor.white
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 150
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    selectedInfo.removeAll()
    selectedInfo.append(informationForTitles[indexPath.row])
    selectedInfo.append(informationContent[indexPath.row])
    
    if selectedInfo.first == "Career History" {
      performSegue(withIdentifier: "toCareerHistory", sender: self)
      return
    }
     
    performSegue(withIdentifier: Constants.detailSegueName, sender: self)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if selectedInfo.first != "Career History" {
      let destinationVC = segue.destination as! DetailViewController
      destinationVC.selectedInfo.removeAll()
      destinationVC.selectedInfo = selectedInfo
    }
  }
}

