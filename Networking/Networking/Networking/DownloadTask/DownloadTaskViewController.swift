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
import AVKit

class DownloadTaskViewController: UIViewController {
   
   @IBOutlet weak var sizeLabel: UILabel!
   
   @IBOutlet weak var downloadProgressView: UIProgressView!
   
   lazy var formatter: ByteCountFormatter = {
      let f = ByteCountFormatter()
      f.countStyle = .file
      return f
   }()
   
   var targetUrl: URL {
      guard let targetUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("downloadedFile.mp4") else {
         fatalError("Invalid File URL")
      }
      
      return targetUrl
   }
   
   // Code Input Point #1
   
   // Code Input Point #1
   
   @IBAction func startDownload(_ sender: Any) {
      do {
         let hasFile = try targetUrl.checkResourceIsReachable()
         if hasFile {
            try FileManager.default.removeItem(at: targetUrl)
         }
      } catch {
         print(error)
      }
      
      guard let url = URL(string: smallFileUrlStr) else { // 나중에서 수정
         fatalError("Invalid URL")
      }
      
      downloadProgressView.progress = 0.0
      
      // Code Input Point #2
      
      // Code Input Point #2
   }
   
   @IBAction func stopDownload(_ sender: Any) {
      // Code Input Point #4
      
      // Code Input Point #4
   }
   
   
   // Code Input Point #5
   
   // Code Input Point #5
   
   @IBAction func pauseDownload(_ sender: Any) {
      // Code Input Point #6
      
      // Code Input Point #6
   }
   
   @IBAction func resumeDownload(_ sender: Any) {
      // Code Input Point #7
      
      // Code Input Point #7
   }
   
   override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
      return (try? targetUrl.checkResourceIsReachable()) ?? false
   }
   
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if let playerVC = segue.destination as? AVPlayerViewController {
         let player = AVPlayer(url: targetUrl)
         playerVC.player = player
         playerVC.navigationItem.title = "Play"
      }
   }
   
   override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      
      // Code Input Point #8
      
      // Code Input Point #8
   }
}

// Code Input Point #3

// Code Input Point #3
