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

class PresentationStyleViewController: UIViewController {
   
   @IBAction func present(_ sender: UIButton) {
      let sb = UIStoryboard(name: "Presentation", bundle: nil)
      let modalVC = sb.instantiateViewController(withIdentifier: "ModalViewController")
      
      
      printPresentationStyle(for: modalVC)
      present(modalVC, animated: true, completion: nil)
   }
   

   
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
      print(String(describing: type(of: self)), #function)
   }
   
   override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      
      print(String(describing: type(of: self)), #function)
   }
}


extension PresentationStyleViewController {
   func printPresentationStyle(for vc: UIViewController) {
      print("\n\n============== ", separator: "", terminator: "")
      
      switch vc.modalPresentationStyle {
      case .fullScreen:
         print("Full Screen")
      case .pageSheet:
         print("Page Sheet")
      case .formSheet:
         print("Form Sheet")
      case .currentContext:
         print("Current Sheet")
      case .overFullScreen:
         print("Over Full Screen")
      case .overCurrentContext:
         print("Over Current Context")
      case .popover:
         print("Popover")
      default:
         print("")
      }
   }
}
