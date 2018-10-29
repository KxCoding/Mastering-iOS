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
import CoreData


//extension DataManager {
//   func batchInsert(in context: NSManagedObjectContext) {
//      context.perform {
//         let start = Date().timeIntervalSinceReferenceDate
//         
//         let departmentList = DepartmentJSON.parsed()
//         let employeeList = EmployeeJSON.parsed()
//         
//         for dept in departmentList {
//            guard let newDeptEntity = DataManager.shared.insertDepartment(from: dept, in: context) else {
//               fatalError()
//            }
//            
//            let employeesInDept = employeeList.filter { $0.department == dept.id }
//            for emp in employeesInDept {
//               guard let newEmployeeEntity = DataManager.shared.insertEmployee(from: emp, in: context) else {
//                  fatalError()
//               }
//               
//               newDeptEntity.addToEmployees(newEmployeeEntity)
//               newEmployeeEntity.department = newDeptEntity
//            }
//            
//            do {
//               try context.save()
//            } catch {
//               dump(error)
//            }
//         }
//         
//         let otherEmployees = employeeList.filter { $0.department == 0 }
//         for emp in otherEmployees {
//            _ = DataManager.shared.insertEmployee(from: emp, in: context)
//         }
//         
//         do {
//            try context.save()
//            
//         } catch {
//            dump(error)
//         }
//         
//         let end = Date().timeIntervalSinceReferenceDate
//         print(end - start)
//      }
//   }
//   
//   func fetchEmployee(in context: NSManagedObjectContext) -> EmployeeEntity? {
//      var data: EmployeeEntity?
//      
//      context.performAndWait {
//         let request: NSFetchRequest<EmployeeEntity> = EmployeeEntity.fetchRequest()
//         request.predicate = NSPredicate(format: "%K == %@", #keyPath(EmployeeEntity.name), "Aaden George")
//         request.fetchLimit = 1
//         
//         do {
//            if let first = try context.fetch(request).first {
//               data = first
//            }
//         } catch {
//            print(error)
//         }
//      }
//      
//      return data
//   }
//}
