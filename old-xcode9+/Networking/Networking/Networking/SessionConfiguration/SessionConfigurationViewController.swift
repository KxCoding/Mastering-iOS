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

class SessionConfigurationViewController: UIViewController {
   
   @IBAction func useSharedConfiguration(_ sender: Any) {
      // Code Input Point #1
      
      // Code Input Point #1
   }
   
   @IBAction func useDefaultConfiguration(_ sender: Any) {
      // Code Input Point #2
      
      // Code Input Point #2
   }
   
   @IBAction func useEphemeralConfiguration(_ sender: Any) {
      // Code Input Point #3
      
      // Code Input Point #3
   }
   
   @IBAction func useBackgroundConfiguration(_ sender: Any) {
      // Code Input Point #4
      
      // Code Input Point #4
   }
   
   @IBAction func useCustomConfiguration(_ sender: Any) {
      // Code Input Point #5
      
      // Code Input Point #5
   }
   
   func sendReqeust(using session: URLSession) {
      guard let url = URL(string: "https://kxcoding-study.azurewebsites.net/api/string") else {
         fatalError("Invalid URL")
      }
      
      let task = session.dataTask(with: url) { (data, response, error) in
         if let error = error {
            self.showErrorAlert(with: error.localizedDescription)
            print(error)
            return
         }
         
         guard let httpResponse = response as? HTTPURLResponse else {
            self.showErrorAlert(with: "Invalid Response")
            return
         }
         
         guard (200...299).contains(httpResponse.statusCode) else {
            self.showErrorAlert(with: "\(httpResponse.statusCode)")
            return
         }
         
         guard let data = data, let str = String(data: data, encoding: .utf8) else {
            fatalError("Invalid Data")
         }
         
         self.showInfoAlert(with: str)
      }
      
      task.resume()
   }
}
