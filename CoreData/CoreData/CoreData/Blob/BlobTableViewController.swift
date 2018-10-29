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

class BlobTableViewController: UITableViewController {
   
   lazy var resultController: NSFetchedResultsController<NSManagedObject> = { [weak self] in
      let request = NSFetchRequest<NSManagedObject>(entityName: "Employee")
      
      request.predicate = NSPredicate(format: "%K == %@", "department.name", "Development")      
      
      let sortByName = NSSortDescriptor(key: "name", ascending: true)
      request.sortDescriptors = [sortByName]
      
      request.fetchLimit = 50
      
      let controller = NSFetchedResultsController(fetchRequest: request, managedObjectContext: DataManager.shared.mainContext, sectionNameKeyPath: nil, cacheName: nil)
      controller.delegate = self
      return controller
      }()
   
   @IBAction func insertPhotoData(_ sender: Any) {
      if let list = resultController.fetchedObjects {
         for (index, data) in list.enumerated() {
            let name = "avatar\(index + 1)"
            guard let img = UIImage(named: name) else {
               fatalError()
            }
            
            data.setValue(UIImagePNGRepresentation(img), forKey: "photo")
         }
      }
      
      DataManager.shared.saveMainContext()
   }
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      do {
         try resultController.performFetch()
      } catch {
         print(error.localizedDescription)
      }
   }
   
   deinit {
      resultController.delegate = nil
   }
}

extension BlobTableViewController {
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
      cell.textLabel?.text = target.value(forKey: "name") as? String
      cell.detailTextLabel?.text = target.value(forKey: "address") as? String

      if let data = target.value(forKey: "photo") as? Data {
         cell.imageView?.image = UIImage(data: data)
      }
      
      return cell
   }
}


extension BlobTableViewController: NSFetchedResultsControllerDelegate {
   func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
      tableView.reloadData()
   }
}


