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

class BackgroundDownloadManager: NSObject {
   static let shared = BackgroundDownloadManager()
   private override init() {
      super.init()
   }
   
   static let didWriteDataNotification = Notification.Name(rawValue: "BackgroundDownloadManager.didWriteDataNotification")
   static let totalBytesWrittenKey = "totalBytesWritten"
   static let totalBytesExpectedToWriteKey = "totalBytesExpectedToWrite"
   
   var completionHandler: (()->())?
   
   var targetUrl: URL {
      guard let targetUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("backgroundFile.mp4") else {
         fatalError("Invalid File URL")
      }
      
      return targetUrl
   }
   
   lazy var session: URLSession = {
      let config = URLSessionConfiguration.background(withIdentifier: "SampleSession")
      
      let session = URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue.main)
      return session
   }()
}

extension BackgroundDownloadManager: URLSessionDownloadDelegate {   
   func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
      print(totalBytesWritten, totalBytesExpectedToWrite)
      
      // Code Input Point #3
      
      // Code Input Point #3
   }
   
   func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
      NSLog(">> %@ %@", self, #function)
      print(error ?? "Done")
   }
   
   func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
      NSLog(">> %@ %@", self, #function)
      
      guard (try? location.checkResourceIsReachable()) ?? false else {
         return
      }
      
      do {
         _ = try FileManager.default.replaceItemAt(targetUrl, withItemAt: location)
      } catch {
         fatalError(error.localizedDescription)
      }
   }
   
   // Code Input Point #2
   
   // Code Input Point #2
}

