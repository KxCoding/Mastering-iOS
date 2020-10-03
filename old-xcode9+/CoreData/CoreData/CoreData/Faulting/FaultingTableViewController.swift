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

class FaultingTableViewController: UITableViewController {
   
   var list = [NSManagedObject]()
   
   @IBAction func fire(_ sender: Any) {
      
   }
   
   func fetchAllEmployee() -> [NSManagedObject] {
      let context = DataManager.shared.mainContext
      var list = [NSManagedObject]()
      
      context.performAndWait {
         let request = NSFetchRequest<NSManagedObject>(entityName: "Employee")

         let sortByName = NSSortDescriptor(key: "name", ascending: true)
         request.sortDescriptors = [sortByName]
         
         request.fetchLimit = 100
         
         do {
            list = try context.fetch(request)
         } catch {
            fatalError(error.localizedDescription)
         }
      }
      
      return list
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      list = fetchAllEmployee()
      tableView.reloadData()
   }
}

extension FaultingTableViewController {
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return list.count
   }
   
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      
      let target = list[indexPath.row]
      cell.textLabel?.text = target.value(forKey: "name") as? String
      cell.detailTextLabel?.text = target.value(forKeyPath: "department.name") as? String
      
      return cell
   }
}
