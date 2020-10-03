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

class HeaderFooterViewViewController: UIViewController {
   
   @IBOutlet weak var listTableView: UITableView!
   
   let list = ["iMac Pro", "iMac 5K", "Macbook Pro", "iPad Pro", "iPad", "iPad mini", "iPhone 8", "iPhone 8 Plus", "iPhone SE", "iPhone X", "Mac mini", "Apple TV", "Apple Watch"]
   var filteredList = ["iMac Pro", "iMac 5K", "Macbook Pro", "iPad Pro", "iPad", "iPad mini", "iPhone 8", "iPhone 8 Plus", "iPhone SE", "iPhone X", "Mac mini", "Apple TV", "Apple Watch"]
   
   lazy var resultLabel: UILabel = { [weak self] in
      var frame = self?.view.bounds ?? .zero
      frame.size.height = 50
      
      let lbl = UILabel(frame: frame)
      lbl.textAlignment = .center
      lbl.textColor = UIColor.white
      lbl.backgroundColor = UIColor.gray
      return lbl
   }()
   
   @objc func handle(notification: Notification) {
      switch notification.name {
      case NSNotification.Name.UIKeyboardWillShow:
         if let frame = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect {
            var inset = listTableView.contentInset
            inset.bottom = frame.height
            listTableView.contentInset = inset
         }
      case NSNotification.Name.UIKeyboardWillHide:
         var inset = listTableView.contentInset
         inset.bottom = 0
         listTableView.contentInset = inset
      default:
         break
      }
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      NotificationCenter.default.addObserver(self, selector: #selector(handle(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
      NotificationCenter.default.addObserver(self, selector: #selector(handle(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
   }
}


extension HeaderFooterViewViewController: UISearchBarDelegate {
   func filter(with keyword: String) {
      if keyword.count > 0 {
         filteredList = list.filter { $0.contains(keyword) }
      } else {
         filteredList = list
      }
      
      listTableView.reloadData()
      resultLabel.text = "\(filteredList.count) result(s) found"
   }
   
   func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      filter(with: searchText)
   }
   
   func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
      
   }
   
   func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
      
   }
   
   func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
      filter(with: searchBar.text ?? "")
   }
   
   func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
      filteredList = list
      listTableView.reloadData()
      
      searchBar.resignFirstResponder()
   }
}


extension HeaderFooterViewViewController: UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return filteredList.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      
      let target = filteredList[indexPath.row]
      cell.textLabel?.text = target
      
      return cell
   }
}













