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

class AttachmentsViewController: UIViewController {
   
   @IBAction func addImageAttachment(_ sender: Any) {
      let content = UNMutableNotificationContent()
      content.title = "Hello"
      content.body = "Image Attachment"
      content.sound = UNNotificationSound.default()
      
      
      
      let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
      let request = UNNotificationRequest(identifier: "Image Attachment", content: content, trigger: trigger)
      UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
   }
   
   @IBAction func addAudioAttachment(_ sender: Any) {
      let content = UNMutableNotificationContent()
      content.title = "Hello"
      content.body = "Audio Attachment"
      content.sound = UNNotificationSound.default()
      
      
      
      let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
      let request = UNNotificationRequest(identifier: "Audio Attachment", content: content, trigger: trigger)
      UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
   }
   
   @IBAction func addVideoAttachment(_ sender: Any) {
      let content = UNMutableNotificationContent()
      content.title = "Hello"
      content.body = "Video Attachment"
      content.sound = UNNotificationSound.default()

      
      
      
      let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
      let request = UNNotificationRequest(identifier: "Video Attachment", content: content, trigger: trigger)      
      UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      
   }
}






















