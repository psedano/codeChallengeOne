import Foundation

protocol GeneralDataProtocol: class {
  
}

class GeneralDataModel: Decodable {
  var nombreCompleto: String!
  var edad: String!
  var informacionTitulos: [String]!
  var informacionContenido: [String]!
  var careerHistory: [[String: String]]!
}
