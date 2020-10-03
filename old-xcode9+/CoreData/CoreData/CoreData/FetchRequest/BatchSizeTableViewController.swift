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

class BatchSizeTableViewController: UITableViewController {
   
   let context = DataManager.shared.mainContext
   
   var list = [NSManagedObject]()
   
   @IBAction func showType(_ sender: Any) {
      showTypeMenu()
   }
   
   func fetchWithBatchSize() {
      let request = NSFetchRequest<NSManagedObject>(entityName: "Employee")
      
      
      
      let sortByName = NSSortDescriptor(key: "name", ascending: true)
      request.sortDescriptors = [sortByName]
      
      do {
         list = try context.fetch(request)
         tableView.reloadData()
      } catch {
         fatalError(error.localizedDescription)
      }
   }
   
   func fetchWithoutBatchSize() {
      let request = NSFetchRequest<NSManagedObject>(entityName: "Employee")
      
      let sortByName = NSSortDescriptor(key: "name", ascending: true)
      request.sortDescriptors = [sortByName]
      
      do {
         list = try context.fetch(request)
         tableView.reloadData()
      } catch {
         fatalError(error.localizedDescription)
      }
   }
}


extension BatchSizeTableViewController {
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return list.count
   }
   
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      
      cell.textLabel?.text = list[indexPath.row].value(forKey: "name") as? String
      
      return cell
   }
}

extension BatchSizeTableViewController {
   func showTypeMenu() {
      let alert = UIAlertController(title: "Batch Size", message: "Select request type", preferredStyle: .alert)
      
      let menu1 = UIAlertAction(title: "Without Batch Size", style: .default) { (action) in
         self.fetchWithoutBatchSize()
      }
      alert.addAction(menu1)
      
      let menu2 = UIAlertAction(title: "With Batch Size", style: .default) { (action) in
         self.fetchWithBatchSize()
      }
      alert.addAction(menu2)
      
      let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
      alert.addAction(cancel)
      
      present(alert, animated: true, completion: nil)
   }
}
