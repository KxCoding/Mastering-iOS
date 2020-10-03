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

class ReorderingViewController: UIViewController {
   
   var firstList = [String]()
   var secondList = [String]()
   var thirdList = ["iMac Pro", "iMac 5K", "Macbook Pro", "iPad Pro", "iPad", "iPad mini", "iPhone 8", "iPhone 8 Plus", "iPhone SE", "iPhone X", "Mac mini", "Apple TV", "Apple Watch"]
   
   @IBOutlet weak var listTableView: UITableView!
   
   @objc func reloadTableView() {
      listTableView.reloadData()
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      listTableView.setEditing(true, animated: false)
      
      navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Reload", style: .plain, target: self, action: #selector(reloadTableView))
   }   
}


extension ReorderingViewController: UITableViewDataSource {
   func numberOfSections(in tableView: UITableView) -> Int {
      return 3
   }
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      switch section {
      case 0:
         return firstList.count
      case 1:
         return secondList.count
      case 2:
         return thirdList.count
      default:
         return 0
      }
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      
      switch indexPath.section {
      case 0:
         cell.textLabel?.text = firstList[indexPath.row]
      case 1:
         cell.textLabel?.text = secondList[indexPath.row]
      case 2:
         cell.textLabel?.text = thirdList[indexPath.row]
      default:
         break
      }
      
      return cell
   }
   
   func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      switch section {
      case 0:
         return "First Section"
      case 1:
         return "Second Section"
      case 2:
         return "Third Section"
      default:
         return nil
      }
   }
}


extension ReorderingViewController: UITableViewDelegate {
   
}














