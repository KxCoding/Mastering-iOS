//: [Previous](@previous)

import Foundation

enum DecodingError: Error {
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

let jsonStr = """
{
"name" : "John",
"age" : 30,
"address" : "Seoul"
}
"""

guard let jsonData = jsonStr.data(using: .utf8) else {
   fatalError()
}

let decoder = JSONDecoder()

do {
   let e = try decoder.decode(Employee.self, from: jsonData)
   dump(e)
} catch {
   print(error)
}



//: [Next](@next)
