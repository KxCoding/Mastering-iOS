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


class CachingTableViewController: UITableViewController {
   
   @IBOutlet weak var titleLabel: UILabel!
   @IBOutlet weak var descLabel: UILabel!
   @IBOutlet weak var lastUpdateDateLabel: UILabel!
   
   var buffer: Data?
   
   var lastDate = Date()
   
   lazy var formatter: ByteCountFormatter = {
      let f = ByteCountFormatter()
      f.countStyle = .file
      return f
   }()
   
   lazy var dateFormatter: DateFormatter = {
      let f = DateFormatter()
      f.dateFormat = "HH:mm:ss.SSS"
      return f
   }()
   
   lazy var session: URLSession = { [weak self] in
      let config = URLSessionConfiguration.default
      
      // Code Input Point #3
      
      // Code Input Point #3
      
      let session = URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue.main)
      return session
      }()
   
   @IBAction func sendRequestCacheControl(_ sender: Any) {
      guard let url = URL(string: "https://kxcoding-study.azurewebsites.net/api/cache") else {
         fatalError("Invalid URL")
      }
      
      print(#function)
      
      buffer = Data()
      
      var request = URLRequest(url: url)
      
      // Code Input Point #1
      
      // Code Input Point #1
      
      let task = session.dataTask(with: request)
      task.resume()
   }
   
   @IBAction func sendReqeust(_ sender: Any) {
      guard let url = URL(string: "https://kxcoding-study.azurewebsites.net/api/cache/nocache") else {
         fatalError("Invalid URL")
      }
      
      print(#function)
      
      buffer = Data()
      
      var request = URLRequest(url: url)
      request.cachePolicy = .returnCacheDataElseLoad
      
      // Code Input Point #2
      
      // Code Input Point #2
      
      let task = session.dataTask(with: request)      
      task.resume()
   }
   
   @IBAction func removeAllCache(_ sender: Any) {
      // Code Input Point #5
      
      // Code Input Point #5
   }
   
   override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      
      session.invalidateAndCancel()
   }
}

extension CachingTableViewController: URLSessionDataDelegate {
   // Code Input Point #4
   
   // Code Input Point #4
   
   func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
      guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
         completionHandler(.cancel)
         return
      }
      
      completionHandler(.allow)
   }
   
   func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
      buffer?.append(data)
   }
   
   func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
      if let error = error {
         showErrorAlert(with: error.localizedDescription)
      } else {
         parse()
      }
   }
}

extension CachingTableViewController {
   func parse() {
//      guard let data = buffer else {
//         fatalError("Invalid Buffer")
//      }
//
//      let decoder = JSONDecoder()
//
//      decoder.dateDecodingStrategy = .custom({ (decoder) -> Date in
//         let container = try decoder.singleValueContainer()
//         let dateStr = try container.decode(String.self)
//
//         let formatter = ISO8601DateFormatter()
//         formatter.formatOptions = [.withFullDate, .withTime, .withDashSeparatorInDate, .withColonSeparatorInTime]
//         return formatter.date(from: dateStr)!
//      })
//
//      do {
//         let detail = try decoder.decode(BookDetail.self, from: data)
//
//         if detail.code == 200 {
//            titleLabel.text = detail.book.title
//            descLabel.text = detail.book.desc
//
//            let date = dateFormatter.string(from: Date())
//            lastUpdateDateLabel.text = "Last Update\n\(date)"
//            tableView.reloadData()
//         } else {
//            showErrorAlert(with: detail.message ?? "Error")
//         }
//      } catch {
//         showErrorAlert(with: error.localizedDescription)
//         print(error)
//      }
   }
}

