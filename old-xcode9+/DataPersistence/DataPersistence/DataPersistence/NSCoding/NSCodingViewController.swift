//
//  Copyright (c) 2019 KxCoding <kky0317@gmail.com>
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

class Language {
   let name: String
   let version: Double
   let logo: UIImage
   
   init(name: String, version: Double, logo: UIImage) {
      self.name = name
      self.version = version
      self.logo = logo
   }
}


class NSCodingViewController: UIViewController {
   
   @IBOutlet weak var imageView: UIImageView!
   
   @IBOutlet weak var nameLabel: UILabel!
   
   @IBOutlet weak var versionLabel: UILabel!
   
   let fileUrl: URL = {
      let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
      return documentsDirectory.appendingPathComponent("swift").appendingPathExtension("data")
   }()
   
   
   @IBAction func encodeObject(_ sender: Any) {
      
   }
   
   
   @IBAction func decodeObject(_ sender: Any) {
      
   }
}
