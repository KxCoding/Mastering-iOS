//: [Previous](@previous)

import Foundation

enum EncodingError: Error {
   case unknown
   case invalidRange
}

struct Employee: Codable {
   var name: String
   var age: Int
   var address: String?
   
   //
   
   //
}

let p = Employee(name: "James", age: 30, address: "Seoul")


let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted

do {
   let jsonData = try encoder.encode(p)
   if let jsonStr = String(data: jsonData, encoding: .utf8) {
      print(jsonStr)
   }
} catch {
   print(error)
}






//: [Next](@next)

