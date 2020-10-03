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

class FetchLimitTableViewController: UITableViewController {
   
   lazy var formatter: NumberFormatter = {
      let f = NumberFormatter()
      f.locale = Locale(identifier: "en_US")
      f.numberStyle = .currency
      return f
   }()
   
   var list = [NSManagedObject]()
   
   func fetchTop10SalaryInNewYork() {
      let request = NSFetchRequest<NSManagedObject>(entityName: "Employee")
      
      let sortBySalary = NSSortDescriptor(key: "salary", ascending: false)
      let sortByName = NSSortDescriptor(key: "name", ascending: true)
      request.sortDescriptors = [sortBySalary, sortByName]
      
      request.predicate = NSPredicate(format: "address CONTAINS 'NY'")
      
      
      do {
         let result = try DataManager.shared.mainContext.fetch(request)
         list = Array(result[0..<10])
         
         tableView.reloadData()
      } catch {
         print(error.localizedDescription)
      }
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      fetchTop10SalaryInNewYork()
   }
}

extension FetchLimitTableViewController {
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return list.count
   }
   
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      
      let target = list[indexPath.row]
      if let name = target.value(forKey: "name") as? String, let salary = target.value(forKey: "salary") as? Double, let str = formatter.string(for: salary) {
         cell.textLabel?.text = "\(name) (\(str))"
      }
      
      cell.detailTextLabel?.text = target.value(forKey: "address") as? String
      
      return cell
   }
}
