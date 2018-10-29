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

//class ValidationViewController: UIViewController {
//
//   let departmentList = DataManager.shared.fetchDepartment()
//   var selectedDepartment: DepartmentEntity?
//
//   @IBOutlet weak var nameField: UITextField!
//
//   @IBOutlet weak var ageSlider: UISlider!
//   @IBOutlet weak var ageValueLabel: UILabel!
//
//   @IBOutlet weak var departmentButton: UIButton!
//
//
//   @IBAction func save(_ sender: Any) {
//      
//   }
//
//
//   @IBAction func validate(_ sender: Any) {
//      guard let name = nameField.text else { return }
//      let age = Int16(ageSlider.value)
//      let context = DataManager.shared.mainContext
//
//      
//   }
//
//
//   @IBAction func sliderChanged(_ sender: UISlider) {
//      ageValueLabel.text = "\(Int(sender.value))"
//   }
//
//   @IBAction func selecteDepartment(_ sender: Any) {
//      showDepartmentList()
//   }
//
//   override func viewDidLoad() {
//      super.viewDidLoad()
//
//      DataManager.shared.mainContext.undoManager = UndoManager()
//   }
//
//   deinit {
//      DataManager.shared.mainContext.undoManager = nil
//   }
//}
//
//
//extension ValidationViewController {
//   func showDepartmentList() {
//      let alert = UIAlertController(title: nil, message: "Select Department", preferredStyle: .alert)
//
//      for dept in departmentList {
//         let departmentAction = UIAlertAction(title: dept.name, style: .default) { (action) in
//            self.selectedDepartment = dept
//            self.departmentButton.setTitle(dept.name, for: .normal)
//         }
//         alert.addAction(departmentAction)
//      }
//
//      let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
//         self.selectedDepartment = nil
//         self.departmentButton.setTitle("None", for: .normal)
//      }
//      alert.addAction(cancelAction)
//
//      present(alert, animated: true, completion: nil)
//   }
//   
//   func showAlert(message: String) {
//      let alert = UIAlertController(title: "Validation", message: message, preferredStyle: .alert)
//      
//      let okAction = UIAlertAction(title: "Ok", style: .cancel) { (action) in
//      }
//      alert.addAction(okAction)
//      
//      present(alert, animated: true, completion: nil)
//   }
//}

