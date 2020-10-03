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

class ReachabilityViewController: UIViewController {
   
   @IBOutlet weak var sizeLabel: UILabel!
   
   @IBOutlet weak var cellularImageView: UIImageView!
   @IBOutlet weak var wifiImageView: UIImageView!
   
   lazy var formatter: ByteCountFormatter = {
      let f = ByteCountFormatter()
      f.countStyle = .file
      return f
   }()
   
   let wifiOffImage = #imageLiteral(resourceName: "wifi-off.png")
   let wifiOnImage = #imageLiteral(resourceName: "wifi-on.png")
   let cellularOffImage = #imageLiteral(resourceName: "cell-off.png")
   let cellularOnImage = #imageLiteral(resourceName: "cell-on.png")
   
   lazy var session: URLSession = { [weak self] in
      let config = URLSessionConfiguration.default
      
      let session = URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue.main)
      return session
      }()
   
   var resumeDataUrl: URL {
      guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent("resumeData") else {
         fatalError("Invalid File URL")
      }
      
      return url
   }
   
   var targetUrl: URL {
      guard let targetUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("downloadedFile.mp4") else {
         fatalError("Invalid File URL")
      }
      
      return targetUrl
   }
   
   var task: URLSessionDownloadTask?
   
   @IBAction func startDownload(_ sender: Any) {
      guard let url = URL(string: bigFileUrlStr) else {
         fatalError("Invalid URL")
      }
      
      task = session.downloadTask(with: url)
      task?.resume()
   }
   
   // Code Input Point #1
   
   // Code Input Point #1
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      // Code Input Point #2
      
      // Code Input Point #2
   }
   
   func updateUI(from reachability: Reachability) {
      // Code Input Point #3
      
      // Code Input Point #3
   }
   
   func resumeDownloadIfNeeded() {
      // Code Input Point #6
      
      // Code Input Point #6
   }
   
   override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      
      session.invalidateAndCancel()
   }
   
   deinit {
      // Code Input Point #4

      // Code Input Point #4
   }
}


extension ReachabilityViewController: URLSessionDownloadDelegate {
   func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
      sizeLabel.text = "\(formatter.string(fromByteCount: totalBytesWritten))/\(formatter.string(fromByteCount: totalBytesExpectedToWrite))"
   }
   
   func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
      guard let error = error else { return }
      let downloadError = error as NSError
      
      print(#function)
      print(downloadError)
      
      // Code Input Point #5
      // -1005, NSURLErrorNetworkConnectionLost
      
      // Code Input Point #5
   }
   
   func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didResumeAtOffset fileOffset: Int64, expectedTotalBytes: Int64) {
      print(#function)
   }
   
   func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
      print(#function)
      
      guard (try? location.checkResourceIsReachable()) ?? false else {
         return
      }
      
      do {
         _ = try FileManager.default.replaceItemAt(targetUrl, withItemAt: location)
         
         // Code Input Point #7
         
         // Code Input Point #7
      } catch {
         fatalError(error.localizedDescription)
      }
   }
}
