import Foundation

struct ResumeData: Decodable {
  var nombreCompleto: String
  var edad: Int
  var informationTitulos: [String]
  var informacionContenido: [String]
  var careerHistory: [[String:String]]
}
