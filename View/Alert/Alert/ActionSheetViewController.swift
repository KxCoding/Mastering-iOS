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

class ActionSheetViewController: UIViewController {
   
   @IBOutlet weak var resultLabel: UILabel!
   
   @IBAction func show(_ sender: UIButton) {
      let controller = UIAlertController(title: "Languages", message: "Choose one", preferredStyle: .alert)
      
      let swiftAction = UIAlertAction(title: "Swift", style: .default) { [weak self] (action) in
         self?.resultLabel.text = action.title
      }
      controller.addAction(swiftAction)
      
      let javaAction = UIAlertAction(title: "Java", style: .default) { [weak self] (action) in
         self?.resultLabel.text = action.title
      }
      controller.addAction(javaAction)
      
      let pythonAction = UIAlertAction(title: "Python", style: .default) { [weak self] (action) in
         self?.resultLabel.text = action.title
      }
      controller.addAction(pythonAction)
      
      let cSharpAction = UIAlertAction(title: "C#", style: .default) { [weak self] (action) in
         self?.resultLabel.text = action.title
      }
      controller.addAction(cSharpAction)
      
      let clearAction = UIAlertAction(title: "Clear", style: .destructive) { [weak self] (action) in
         self?.resultLabel.text = nil
      }
      controller.addAction(clearAction)
      
      let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
      controller.addAction(cancelAction)
      
      present(controller, animated: true, completion: nil)
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      // Do any additional setup after loading the view.
   }
}



















