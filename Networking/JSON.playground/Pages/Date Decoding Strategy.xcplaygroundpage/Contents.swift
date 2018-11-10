//: [Previous](@previous)

import Foundation

struct Product: Codable {
   var name: String
   var releaseDate: Date
}

let jsonStr = """
{
"name" : "iPad Pro",
"releaseDate" : "2018-10-30T23:00:00Z"
}
"""

guard let jsonData = jsonStr.data(using: .utf8) else {
   fatalError()
}

let decoder = JSONDecoder()

//

//

do {
   let p = try decoder.decode(Product.self, from: jsonData)
   dump(p)
} catch {
   print(error)
}



//: [Next](@next)

