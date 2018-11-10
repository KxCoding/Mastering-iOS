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
import WebKit

class WebContentViewController: UIViewController {
   
   @IBOutlet weak var urlField: UITextField!
   @IBOutlet weak var webView: WKWebView!
   
   @IBAction func goBack(_ sender: Any) {
      // Code Input Point #3
      
      // Code Input Point #3
   }
   
   @IBAction func reload(_ sender: Any) {
      // Code Input Point #5
      
      // Code Input Point #5
   }
   
   @IBAction func goForward(_ sender: Any) {
      // Code Input Point #4
      
      // Code Input Point #4
   }
   
   func go(to urlStr: String) {
      // Code Input Point #2
      
      // Code Input Point #2
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      navigationItem.largeTitleDisplayMode = .never
      webView.navigationDelegate = self
      
      // Code Input Point #1
      
      // Code Input Point #1
   }
}

extension WebContentViewController: UITextFieldDelegate {
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      guard let str = textField.text else { return true }
      go(to: str)
      textField.resignFirstResponder()
      return true
   }
}

extension WebContentViewController: WKNavigationDelegate {
   func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
      print(error)
   }
}
