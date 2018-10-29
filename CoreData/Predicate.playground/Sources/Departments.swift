import Foundation

public class Employee: NSObject, Codable {
   @objc public let name: String
   @objc public let age: Int
   @objc public let salary: Int
   @objc public let address: String
}

public class Department: NSObject, Codable {
   @objc public let id: Int
   @objc public let name: String
   @objc public var employees: [Employee]
}

let fileUrl = #fileLiteral(resourceName: "data.json")

func composeList() -> [Department] {
   guard let data = try? Data(contentsOf: fileUrl) else {
      fatalError("Invalid Data")
   }
   
   do {
      let decoder = JSONDecoder()
      let list = try decoder.decode([Department].self, from: data)
      return list
   } catch {
      fatalError(error.localizedDescription)
   }
}

public let departments = NSArray(array: composeList())
