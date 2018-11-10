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

class ATSViewController: UIViewController {
   
   @IBOutlet weak var webView: WKWebView!
   
   @IBAction func showMenu(_ sender: UIBarButtonItem) {
      showSiteMenu(sender)
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      webView.navigationDelegate = self
   }
}

extension ATSViewController: WKNavigationDelegate {
   func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
      print(error)
   }
}

extension ATSViewController {
   func go(to urlStr: String) {
      guard let url = URL(string: urlStr) else {
         return
      }
      
      let request = URLRequest(url: url)
      webView.load(request)
   }
   
   func showSiteMenu(_ sender: UIBarButtonItem) {
      let menu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
      
      let apple = UIAlertAction(title: "Apple", style: .default) { (action) in
         self.go(to: "http://www.apple.com")
      }
      menu.addAction(apple)
      
      let daum = UIAlertAction(title: "Daum", style: .default) { (action) in
        self.go(to: "http://www.daum.net")
      }
      menu.addAction(daum)
      
      let daumDic = UIAlertAction(title: "Daum Dictionary", style: .default) { (action) in
        self.go(to: "http://dic.daum.net")
      }
      menu.addAction(daumDic)
      
      let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
      menu.addAction(cancel)
      
      if let pc = menu.popoverPresentationController {
         pc.barButtonItem = sender
      }
      
      present(menu, animated: true, completion: nil)
   }
}
