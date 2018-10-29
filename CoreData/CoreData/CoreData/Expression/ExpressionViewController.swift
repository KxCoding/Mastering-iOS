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

class ExpressionViewController: UIViewController {
   lazy var formatter: NumberFormatter = {
      let f = NumberFormatter()
      f.locale = Locale(identifier: "en_US")
      f.numberStyle = .currency
      return f
   }()
   
   var list = [Any]()
   
   @IBOutlet weak var listTableView: UITableView!
   
   func fetch() {
      let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Department")
      
      let sortByName = NSSortDescriptor(key: "name", ascending: true)
      request.sortDescriptors = [sortByName]
      
      
      
      do {
         list = try DataManager.shared.mainContext.fetch(request)
         listTableView.reloadData()
      } catch {
         fatalError(error.localizedDescription)
      }
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      fetch()
   }
}


extension ExpressionViewController: UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return list.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      
      
      if let target = list[indexPath.row] as? NSManagedObject {
         let count = target.value(forKeyPath: "employees.@count.intValue") as? Int
         let avg = target.value(forKeyPath: "employees.@avg.salary.doubleValue") as? Double
         
         if let name = target.value(forKey: "name") as? String, let count = count {
            cell.textLabel?.text = "\(name)\n\(count) employees"
         }
         
         let avgStr = formatter.string(for: avg ?? 0) ?? "0"
         cell.detailTextLabel?.text = avgStr
      } else if let target = list[indexPath.row] as? [String: Any] {
         let count = target["count"] as? Int
         let avg = target["avg"] as? Double
         
         if let name = target["name"] as? String, let count = count {
            cell.textLabel?.text = "\(name)\n\(count) employees"
         }
         
         let avgStr = formatter.string(for: avg ?? 0) ?? "0"
         cell.detailTextLabel?.text = avgStr
      }
      
      
      return cell
   }
}
