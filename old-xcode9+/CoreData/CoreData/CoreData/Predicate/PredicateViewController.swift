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

class PredicateViewController: UIViewController {

   var list = [NSManagedObject]()
   
   @IBOutlet weak var listTableView: UITableView!
   
   func searchByName(_ keyword: String?) {
      guard let keyword = keyword else { return }
      
   }
   
   func searchByMinimumAge(_ keyword: String?) {
      guard let keyword = keyword, let age = Int(keyword) else { return }
      
      
   }
   
   func searchBySalaryRange(_ keyword: String?) {
      guard let keyword = keyword else { return }
      let comps = keyword.components(separatedBy: "-")
      guard comps.count == 2, let min = Int(comps[0]), let max = Int(comps[1]) else { return }
      // 30000-70000
      
      
   }
   
   func searchByDeptName(_ keyword: String?) {
      guard let keyword = keyword else { return }
      
      
   }
   
   func fetch(predicate: NSPredicate? = nil) {
      let request = NSFetchRequest<NSManagedObject>(entityName: "Employee")
      
      
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

extension PredicateViewController: UISearchBarDelegate {
   func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
      searchBar.text = nil
      searchBar.resignFirstResponder()
      fetch()
   }
   
   func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
      switch searchBar.selectedScopeButtonIndex {
      case 0:
         searchByName(searchBar.text)
      case 1:
         searchByMinimumAge(searchBar.text)
      case 2:
         searchBySalaryRange(searchBar.text)
      case 3:
         searchByDeptName(searchBar.text)
      default:
         fatalError()
      }
   }
}

extension PredicateViewController: UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return list.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

      let target = list[indexPath.row]
      if let name = target.value(forKey: "name") as? String, let age = target.value(forKey: "age") as? Int, let departmentName = target.value(forKeyPath: "department.name") as? String {
         cell.textLabel?.text = "\(name) (\(age))\n\(departmentName)"
      }
      
      if let salary = target.value(forKey: "salary") as? Int {
         cell.detailTextLabel?.text = "$ \(salary)"
      }
      
      return cell
   }
}
