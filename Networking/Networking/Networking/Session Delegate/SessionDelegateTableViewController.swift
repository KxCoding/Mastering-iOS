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

class SessionDelegateTableViewController: UITableViewController {
   
   @IBOutlet weak var titleLabel: UILabel!
   @IBOutlet weak var descLabel: UILabel!
   
   var session: URLSession!
   
   // Code Input Point #3
   
   // Code Input Point #3
   
   @IBAction func sendReqeust(_ sender: Any) {
      guard let url = URL(string: "https://kxcoding-study.azurewebsites.net/api/books/3") else {
         fatalError("Invalid URL")
      }
      
      // Code Input Point #1
      
      // Code Input Point #1
   }
   
   override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      
      // Code Input Point #6
      
      // Code Input Point #6
   }
}

// Code Input Point #2

// Code Input Point #2

extension SessionDelegateTableViewController {
   func parse() {
      // Code Input Point #4
      
      // Code Input Point #4
      
      let decoder = JSONDecoder()
      
      decoder.dateDecodingStrategy = .custom({ (decoder) -> Date in
         let container = try decoder.singleValueContainer()
         let dateStr = try container.decode(String.self)
         
         let formatter = ISO8601DateFormatter()
         formatter.formatOptions = [.withFullDate, .withTime, .withDashSeparatorInDate, .withColonSeparatorInTime]
         return formatter.date(from: dateStr)!
      })
      
      // Code Input Point #5
      
      // Code Input Point #5
   }
}
