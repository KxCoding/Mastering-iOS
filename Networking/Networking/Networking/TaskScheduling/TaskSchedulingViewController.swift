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

class TaskSchedulingViewController: UIViewController {
   @IBOutlet weak var sizeLabel: UILabel!
   
   lazy var formatter: ByteCountFormatter = {
      let f = ByteCountFormatter()
      f.countStyle = .file
      return f
   }()
   
   var task: URLSessionDownloadTask?
   
   lazy var session: URLSession = { [weak self] in
      let config = URLSessionConfiguration.background(withIdentifier: "SampleSession")
      
      // Code Input Point #2
      
      // Code Input Point #2
      
      let session = URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue.main)
      return session
   }()
   
   @IBAction func startDownload(_ sender: Any) {
      guard let url = URL(string: bigFileUrlStr) else {
         fatalError("Invalid URL")
      }
      
      task = session.downloadTask(with: url)
      
      // Code Input Point #1
      
      // Code Input Point #1
      
      task?.resume()
   }
   
   override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      
      session.invalidateAndCancel()
   }
}


extension TaskSchedulingViewController: URLSessionDownloadDelegate {
   // Code Input Point #3
   
   // Code Input Point #3
   
   func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
      sizeLabel.text = "\(formatter.string(fromByteCount: totalBytesWritten))/\(formatter.string(fromByteCount: totalBytesExpectedToWrite))"
   }
   
   func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
      print(#function)
      print(error ?? "Done")
   }
   
   func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
      print(#function)
   }
}
