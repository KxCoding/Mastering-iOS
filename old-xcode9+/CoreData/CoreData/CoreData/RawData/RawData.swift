//
//  Copyright (c) 2018 KxCoding <kky0317@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

struct DepartmentJSON: Codable {
   let id: Int
   let name: String
   
   static func parsed() -> [DepartmentJSON] {
      do {
         guard let fileUrl = Bundle.main.url(forResource: "department", withExtension: "json") else {
            fatalError()
         }
         
         guard let data = try? Data(contentsOf: fileUrl) else {
            fatalError()
         }
         
         let decoder = JSONDecoder()
         return try decoder.decode([DepartmentJSON].self, from: data)
      } catch {
         fatalError(error.localizedDescription)
      }
   }
}

struct EmployeeJSON: Codable {
   let name: String
   let age: Int
   let address: String
   let salary: Int
   let department: Int
   
   static func parsed() -> [EmployeeJSON] {
      do {
         guard let fileUrl = Bundle.main.url(forResource: "employee", withExtension: "json") else {
            fatalError()
         }
         
         guard let data = try? Data(contentsOf: fileUrl) else {
            fatalError()
         }
         
         let decoder = JSONDecoder()
         return try decoder.decode([EmployeeJSON].self, from: data)
      } catch {
         fatalError(error.localizedDescription)
      }
   }
}
