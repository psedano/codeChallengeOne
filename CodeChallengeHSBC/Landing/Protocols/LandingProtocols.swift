import Foundation

protocol LandingPresentable: class {
  func performRequest()
   func getCareerHistory() -> [[String:String]]?
}

protocol LandingViewable: class {
  func setInformation(infoTitulos: [String], infoContenido: [String])
}
