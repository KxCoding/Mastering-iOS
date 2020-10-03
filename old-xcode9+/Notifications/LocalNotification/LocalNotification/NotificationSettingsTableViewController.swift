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
import UserNotifications

class NotificationSettingsTableViewController: UITableViewController {
   
   @IBOutlet weak var authorizationStatusLabel: UILabel!
   @IBOutlet weak var alertStyleLabel: UILabel!
   @IBOutlet weak var showPreviewsLabel: UILabel!
   @IBOutlet weak var alertLabel: UILabel!
   @IBOutlet weak var badgeLabel: UILabel!
   @IBOutlet weak var soundLabel: UILabel!
   @IBOutlet weak var notificationCenterLabel: UILabel!
   @IBOutlet weak var lockScreenLabel: UILabel!
   
   func update(from settings: UNNotificationSettings) {
      
   }
   
   @objc func refresh() {
      
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      refresh()
      
      NotificationCenter.default.addObserver(self, selector: #selector(refresh), name: NSNotification.Name.UIApplicationWillEnterForeground, object: nil)
   }
}

extension UNNotificationSetting {
   var stringValue: String {
      switch self {
      case .notSupported:
         return "Not Supported"
      case .enabled:
         return "Enabled"
      case .disabled:
         return "Disabled"
      }
   }
}


















