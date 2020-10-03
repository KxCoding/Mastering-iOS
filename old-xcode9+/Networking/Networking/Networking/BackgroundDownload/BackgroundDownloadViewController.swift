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

class BackgroundDownloadViewController: UIViewController {
   
   @IBOutlet weak var sizeLabel: UILabel!
   @IBOutlet weak var recentDownloadLabel: UILabel!
   
   lazy var sizeFormatter: ByteCountFormatter = {
      let f = ByteCountFormatter()
      f.countStyle = .file
      return f
   }()
   
   lazy var dateFormatter: DateFormatter = {
      let f = DateFormatter()
      f.dateFormat = "MM/dd HH:mm:ss.SSS"
      return f
   }()
   
   var token: NSObjectProtocol?
   
   var targetUrl: URL {
      guard let targetUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("backgroundFile.mp4") else {
         fatalError("Invalid File URL")
      }

      return targetUrl
   }
   
   var task: URLSessionDownloadTask?
   
   lazy var session: URLSession = { [weak self] in
      // Code Input Point #1

      let config = URLSessionConfiguration.default
      
      // Code Input Point #1

      let session = URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue.main)
      return session
   }()
   
   
   @IBAction func startDownload(_ sender: Any) {
      do {
         let hasFile = try targetUrl.checkResourceIsReachable()
         if hasFile {
            try FileManager.default.removeItem(at: targetUrl)
            print("Removed")
         }
      } catch {
         print(error.localizedDescription)
      }
      updateRecentDownload()
      
      guard let url = URL(string: smallFileUrlStr) else {
         fatalError("Invalid URL")
      }
      
      task = session.downloadTask(with: url)
      task?.resume()
   }
   
   @IBAction func stopDownload(_ sender: Any) {
      session.invalidateAndCancel()
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      _ = session
      updateRecentDownload()
      
      // Code Input Point #4
      
      // Code Input Point #4
   }
   
   override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      
      session.invalidateAndCancel()
      
      if let token = token {
         NotificationCenter.default.removeObserver(token)
      }
   }
}


extension BackgroundDownloadViewController: URLSessionDownloadDelegate {
   func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
      sizeLabel.text = "\(sizeFormatter.string(fromByteCount: totalBytesWritten))/\(sizeFormatter.string(fromByteCount: totalBytesExpectedToWrite))"
   }

   func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
      NSLog(">> %@ %@", self, #function)
      print(error ?? "Done")
   }

   func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
      NSLog(">> %@ %@", self, #function)

      do {
         _ = try FileManager.default.replaceItemAt(targetUrl, withItemAt: location)
      } catch {
         print(error)
         fatalError(error.localizedDescription)
      }
      updateRecentDownload()
   }
}


extension BackgroundDownloadViewController {
   func updateRecentDownload() {
      do {
         let hasFile = try targetUrl.checkResourceIsReachable()
         if hasFile {
            let values = try targetUrl.resourceValues(forKeys: [.fileSizeKey, .creationDateKey])
            if let size = values.fileSize, let date = values.creationDate {
               recentDownloadLabel.text = "\(dateFormatter.string(from: date)) / \(sizeFormatter.string(fromByteCount: Int64(size)))"
            }
         }
      } catch {
         recentDownloadLabel.text = "Not Found / Unknown"
      }
   }
}
