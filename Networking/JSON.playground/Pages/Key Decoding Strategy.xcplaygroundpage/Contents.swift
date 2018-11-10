//: [Previous](@previous)

import Foundation

struct Person: Codable {
   var firstName: String
   var lastName: String
   var age: Int
   var address: String?
}

let jsonStr = """
{
"first_name" : "John",
"age" : 30,
"last_name" : "Doe",
"address" : "Seoul"
}
"""

guard let jsonData = jsonStr.data(using: .utf8) else {
   fatalError()
}

let decoder = JSONDecoder()

//

//

do {
   let p = try decoder.decode(Person.self, from: jsonData)
   dump(p)
} catch {
   print(error)
}



//: [Next](@next)
