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

class LayoutMarginsViewController: UIViewController {
   
   @IBOutlet weak var redView: UIView!
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      if #available(iOS 11.0, *) {
         navigationItem.largeTitleDisplayMode = .never
      }
   }

   
   override func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()
      
      print("=== view.layoutMargins")
      print(view.layoutMargins)
      
      print("=== redView.layoutMargins")
      print(redView.layoutMargins)
   }
   
   
   func setupMargins() {
      if #available(iOS 11.0, *) {
         redView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 30, leading: 30, bottom: 30, trailing: 30)
      } else {
         redView.layoutMargins = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
      }
   }
}
