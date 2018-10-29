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

import Foundation

public class Contact: NSObject, NSCoding {
   @objc public var tel: String
   @objc public var fax: String
   @objc public var email: String
   
   init(tel: String, fax: String, email: String) {
      self.tel = tel
      self.fax = fax
      self.email = email
      
      super.init()
   }
   
   public static func sample() -> Contact {
      let telStr = String(format: "010-%04d-%04d", Int.random(in: 1000...9999), Int.random(in: 1000...9999))
      let faxStr = String(format: "02-%04d-%04d", Int.random(in: 1000...9999), Int.random(in: 1000...9999))
      let emailStr = String(format: "example%03d@kxcoding.com", Int.random(in: 0...999))
      
      return Contact(tel: telStr, fax: faxStr, email: emailStr)
   }
   
   public func encode(with aCoder: NSCoder) {
      aCoder.encode(tel, forKey: "tel")
      aCoder.encode(fax, forKey: "fax")
      aCoder.encode(email, forKey: "email")
   }
   
   public required init?(coder aDecoder: NSCoder) {
      tel = aDecoder.decodeObject(forKey: "tel") as! String
      fax = aDecoder.decodeObject(forKey: "fax") as! String
      email = aDecoder.decodeObject(forKey: "email") as! String
      
      super.init()
   }
}
