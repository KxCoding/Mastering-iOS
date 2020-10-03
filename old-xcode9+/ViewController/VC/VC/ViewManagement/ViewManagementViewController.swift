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

class ViewManagementViewController: UIViewController {
   
   var grayView: UIView?
   
   func addRandomView() {
      
   }
   
   func insertRandomViewToBack() {
      
   }
   
   func removeTopmostRandomView() {
      
   }
   
   func bringRedViewToFront() {
      
   }
   
   func sendRedViewToBack() {
      
   }
   
   func switchGreenViewWithBlueView() {
      
   }
   
   func addGrayViewToRedView() {
      
   }
   
   func moveGrayViewToRootView() {
      
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showMenu))
   }
}



extension ViewManagementViewController {
   @objc func showMenu() {
      let menu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
      
      let addRandomViewAction = UIAlertAction(title: "Add Random View", style: .default) { [weak self] (action) in
         self?.addRandomView()
      }
      menu.addAction(addRandomViewAction)
      
      let insertRandomViewToBackAction = UIAlertAction(title: "Insert Random View to Back", style: .default) { [weak self] (action) in
         self?.insertRandomViewToBack()
      }
      menu.addAction(insertRandomViewToBackAction)
      
      let removeTopmostRandomViewAction = UIAlertAction(title: "Remove Topmost Random View", style: .default) { [weak self] (action) in
         self?.removeTopmostRandomView()
      }
      menu.addAction(removeTopmostRandomViewAction)
      
      let bringRedViewToFrontAction = UIAlertAction(title: "Bring Red View to Front", style: .default) { [weak self] (action) in
         self?.bringRedViewToFront()
      }
      menu.addAction(bringRedViewToFrontAction)
      
      let sendRedViewToBackAction = UIAlertAction(title: "Send Red View to Back", style: .default) { [weak self] (action) in
         self?.sendRedViewToBack()
      }
      menu.addAction(sendRedViewToBackAction)
      
      let switchGreenViewWithBlueViewAction = UIAlertAction(title: "Switch Green View with Blue View", style: .default) { [weak self] (action) in
         self?.switchGreenViewWithBlueView()
      }
      menu.addAction(switchGreenViewWithBlueViewAction)
      
      let addGrayViewToRedViewAction = UIAlertAction(title: "Add Gray View to Red View", style: .default) { [weak self] (action) in
         self?.addGrayViewToRedView()
      }
      menu.addAction(addGrayViewToRedViewAction)
      
      let moveGrayViewToRootViewAction = UIAlertAction(title: "Move Gray View to Root View", style: .default) { [weak self] (action) in
         self?.moveGrayViewToRootView()
      }
      menu.addAction(moveGrayViewToRootViewAction)
      
      let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
      menu.addAction(cancelAction)
      
      present(menu, animated: true, completion: nil)
   }
   
   func generateRandomView() -> UIView {
      let frame = CGRect(x: 0, y: 0, width: 200, height: 200)
      let v = UIView(frame: frame)
      v.center = view.center
      v.backgroundColor = UIColor.random
      v.tag = Int(arc4random_uniform(UInt32(Int16.max)) + 1)
      
      return v
   }
   
   func generateGrayView() -> UIView {
      let frame = CGRect(x: 100, y: 100, width: 50, height: 50)
      let v = UIView(frame: frame)
      v.backgroundColor = UIColor.gray
      
      return v
   }
}



extension UIColor {
   static var random: UIColor {
      let r = CGFloat(arc4random_uniform(256)) / 255
      let g = CGFloat(arc4random_uniform(256)) / 255
      let b = CGFloat(arc4random_uniform(256)) / 255
      
      return UIColor(displayP3Red: r, green: g, blue: b, alpha: 1.0)
   }
}


















