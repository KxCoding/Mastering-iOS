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

class ButtonStateViewController: UIViewController {
   
   @IBOutlet weak var stateLabel: UILabel!
   
   @IBOutlet weak var btn: UIButton!
   
   @IBAction func report(_ sender: UIButton) {
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
         self.stateLabel.text = sender.state.debugString
      }
   }
   
   @IBAction func stateChanged(_ sender: UISegmentedControl) {
      
   }
   
   
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      stateLabel.text = btn.state.debugString
   }
}




extension UIControlState {
   var debugString: String {
      var list = [String]()
      if contains(.normal) {
         list.append("Normal")
      }
      if contains(.highlighted) {
         list.append("Highlighted")
      }
      if contains(.disabled) {
         list.append("Disabled")
      }
      if contains(.selected) {
         list.append("Selected")
      }
      
      return list.joined(separator: ", ")
   }
}
