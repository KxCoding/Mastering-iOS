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

class BatchProcessingTableViewController: UITableViewController {
   
   lazy var formatter: DateFormatter = {
      let f = DateFormatter()
      f.dateStyle = .medium
      f.timeStyle = .short
      f.locale = Locale(identifier: "en_US")
      return f
   }()
   
   lazy var resultController: NSFetchedResultsController<NSManagedObject> = { [weak self] in
      let request = NSFetchRequest<NSManagedObject>(entityName: "Task")
      
      let sortByName = NSSortDescriptor(key: "date", ascending: true)
      request.sortDescriptors = [sortByName]
      
      request.fetchBatchSize = 30
      
      let controller = NSFetchedResultsController(fetchRequest: request, managedObjectContext: DataManager.shared.mainContext, sectionNameKeyPath: nil, cacheName: nil)
      controller.delegate = self
      return controller
      }()
   
   @IBAction func showMenu(_ sender: Any) {
      showMenu()
   }
   
   func batchInsert() {
      
   }
   
   func batchUpdate() {
      
   }
   
   func batchDelete() {
      
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      do {
         try resultController.performFetch()
      } catch {
         print(error.localizedDescription)
      }
   }
}

extension BatchProcessingTableViewController {
   override func numberOfSections(in tableView: UITableView) -> Int {
      return resultController.sections?.count ?? 0
   }
   
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      guard let sections = resultController.sections else { return 0 }
      let sectionInfo = sections[section]
      return sectionInfo.numberOfObjects
   }
   
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      
      let target = resultController.object(at: indexPath)
      cell.textLabel?.text = target.value(forKey: "task") as? String
      cell.detailTextLabel?.text = formatter.string(for: target.value(forKey: "date") as? Date)
      
      if let done = target.value(forKey: "done") as? Bool {
         cell.accessoryType = done ? .checkmark : .none
      }
      
      return cell
   }
   
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      tableView.deselectRow(at: indexPath, animated: false)
      
      let target = resultController.object(at: indexPath)
      if let done = target.value(forKey: "done") as? Bool {
         target.setValue(!done, forKey: "done")
      }
   }
}


extension BatchProcessingTableViewController: NSFetchedResultsControllerDelegate {
   func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
      tableView.reloadData()
   }
}


extension BatchProcessingTableViewController {
   func showMenu() {
      let menu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
      
      let insertAction = UIAlertAction(title: "Batch Insert", style: .default) { (action) in
         self.batchInsert()
      }
      menu.addAction(insertAction)
      
      let updateAction = UIAlertAction(title: "Batch Update", style: .default) { (action) in
         self.batchUpdate()
      }
      menu.addAction(updateAction)
      
      let deleteAction = UIAlertAction(title: "Batch Delete", style: .destructive) { (action) in
         self.batchDelete()
      }
      menu.addAction(deleteAction)
      
      let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
      menu.addAction(cancelAction)
      
      if let pc = menu.popoverPresentationController, let btn = navigationItem.rightBarButtonItem {
         pc.barButtonItem = btn
         pc.sourceView = view
      }
      
      present(menu, animated: true, completion: nil)
   }
}
