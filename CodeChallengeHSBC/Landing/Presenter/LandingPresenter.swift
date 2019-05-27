import Foundation
import Alamofire

class LandingPresenter {
  var view: LandingViewable?
  var model: GeneralDataModel?

  init(view: LandingViewable) {
    self.view = view
    self.model = GeneralDataModel()
  }
  
  func performRequest() {
    let requestURL = Constants.requestURL
    let userRequest = try! URLRequest(url: requestURL, method: .get)
    
    Alamofire.request(userRequest).validate().responseJSON { [unowned self] response in
      guard let responseData = response.data else {
        return
      }
      
      if response.result.isSuccess {
        do {
          let decoder = JSONDecoder()
          self.model = try decoder.decode(GeneralDataModel.self, from: responseData)
        } catch {
          print("Error!! \(error)")
        }
        
        guard let infoTitulos = self.model?.informacionTitulos, let infoContenido = self.model?.informacionContenido else {
          return
        }
        
        self.view?.setInformation(infoTitulos: infoTitulos, infoContenido: infoContenido)
      }
    }
  }
  
  func getCareerHistory() -> [[String:String]]? {
    return model?.careerHistory
  }
}

extension LandingPresenter: LandingPresentable {
  
}
