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

import UIKit
import CoreData

class FetchedResultsControllerTableViewController: UITableViewController {
   
   lazy var fetchRequest: NSFetchRequest<NSManagedObject> = {
      let request = NSFetchRequest<NSManagedObject>(entityName: "Employee")

      request.predicate = NSPredicate(format: "department != NIL")

      let sortByName = NSSortDescriptor(key: "name", ascending: true)
      request.sortDescriptors = [sortByName]

      request.fetchBatchSize = 30

      return request
   }()
   
   @IBAction func showMenu(_ sender: Any) {
      showMenu()
   }
   

   
   
   func changeSortOrder() {
//      let sortByDeptName = NSSortDescriptor(key: "department.name", ascending: false)
//      let sortBySalary = NSSortDescriptor(key: "salary", ascending: true)
//      resultController.fetchRequest.sortDescriptors = [sortByDeptName, sortBySalary]
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      
   }
   
   deinit {
      
   }
}



extension FetchedResultsControllerTableViewController {
   override func numberOfSections(in tableView: UITableView) -> Int {
      return 0
   }
   
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 0
   }
   
   
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      
      
      return cell
   }
}


extension FetchedResultsControllerTableViewController {
   func showMenu() {
      let alert = UIAlertController(title: "Fetched Results Controller", message: nil, preferredStyle: .alert)
      
      let addAction = UIAlertAction(title: "Add Employee", style: .default) { (action) in
         let context = DataManager.shared.mainContext
         
         let newEmployee = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context)
         newEmployee.setValue("Aaden Smith", forKey: "name")
         newEmployee.setValue(50, forKey: "age")
         
         DataManager.shared.saveMainContext()
      }
      alert.addAction(addAction)
      
      let deleteAction = UIAlertAction(title: "Delete Employee", style: .destructive) { (action) in
         let context = DataManager.shared.mainContext
         
         let request = NSFetchRequest<NSManagedObject>(entityName: "Employee")
         request.fetchLimit = 1
         
         let filterByName = NSPredicate(format: "name == %@", "Aaden Smith")
         request.predicate = filterByName
         
         let sortByName = NSSortDescriptor(key: "name", ascending: true)
         request.sortDescriptors = [sortByName]
         
         do {
            if let first = try context.fetch(request).first {
               context.delete(first)
               DataManager.shared.saveMainContext()
            }
         } catch {
            print(error.localizedDescription)
         }
      }
      alert.addAction(deleteAction)
      
      let changeSortOrderAction = UIAlertAction(title: "Change Sort Order", style: .default) { (action) in
         self.changeSortOrder()
      }
      alert.addAction(changeSortOrderAction)
      
      let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
      alert.addAction(cancelAction)
      
      present(alert, animated: true, completion: nil)
   }
}
