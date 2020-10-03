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

class CellularConnectionViewController: UIViewController {
   
   @IBOutlet weak var imageView: UIImageView!
   
   @IBOutlet weak var cellularSwitch: UISwitch!
   
   lazy var session: URLSession = { [weak self] in
      let config = URLSessionConfiguration.default
      config.requestCachePolicy = .reloadIgnoringLocalCacheData
      
      // Code Input Point #5
      
      // Code Input Point #5
      
      let session = URLSession(configuration: config)
      return session
   }()
   
   @IBAction func downloadImage(_ sender: Any) {
      guard let url = URL(string: picUrlStr) else {
         fatalError("Invalid URL")
      }
      
      imageView.image = nil
      
      var request = URLRequest(url: url)
      
      // Code Input Point #1
      
      // Code Input Point #1
      
      startTask(using: request)
   }
   
   func startTask(using request: URLRequest) {
      let task = session.dataTask(with: request) { (data, response, error) in
         print(error ?? "Success")
         
         // Code Input Point #2
         // -1009, NSURLErrorNotConnectedToInternet
         
         // Code Input Point #2
         
         if let data = data {
            DispatchQueue.main.async {
               let img = UIImage(data: data)
               self.imageView.image = img
            }
         }
      }
      
      task.resume()
   }
   
   func startOneTimeTask() {
      guard let url = URL(string: picUrlStr) else {
         fatalError("Invalid URL")
      }
      
      imageView.image = nil
      
      var request = URLRequest(url: url)
      
      // Code Input Point #3
      
      // Code Input Point #3
   }
   
   func allowsCellularAccess() {
      // Code Input Point #4
      
      // Code Input Point #4
   }
}

extension CellularConnectionViewController {
   func showCellularAlert() {
      DispatchQueue.main.async {
         let alert = UIAlertController(title: "Cellular Connection", message: "The cellular connection is disabled. Do you want to connect this time?", preferredStyle: .alert)
         
         let connectionAction = UIAlertAction(title: "Connect This Time Only", style: .default, handler: { action in
            self.startOneTimeTask()
         })
         alert.addAction(connectionAction)
         
         let allowAction = UIAlertAction(title: "Allows Permanently", style: .default, handler: { action in
            self.allowsCellularAccess()
         })
         alert.addAction(allowAction)
         
         let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
         alert.addAction(dismissAction)
         
         self.present(alert, animated: true, completion: nil)
      }
   }
}
