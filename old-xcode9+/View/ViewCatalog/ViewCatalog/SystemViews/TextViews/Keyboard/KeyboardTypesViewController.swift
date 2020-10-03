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

class KeyboardTypesViewController: UIViewController {
   
   @IBOutlet weak var inputField: UITextField!
   
   @IBAction func changeKeyboardType(_ sender: Any) {
      inputField.resignFirstResponder()
      
      let sheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
      
      let types: [UIKeyboardType] = [.default, .asciiCapable, .numbersAndPunctuation, .URL, .numberPad, .phonePad, .namePhonePad, .emailAddress, .decimalPad, .twitter, .webSearch, .asciiCapableNumberPad]
      let typeNames = ["Default", "ASCII Capable", "Numbers And Punctuation", "URL", "Number Pad", "Phone Pad", "Name Phone Pad", "E-mail Address", "Decimal Pad", "Twitter", "Web Search", "ASCII Capable Number Pad"]
      
      (0..<types.count).forEach {
         let type = types[$0]
         let name = typeNames[$0]
         
         let action = UIAlertAction(title: name, style: .default, handler: { (action) in
            self.inputField.keyboardType = type
            self.inputField.becomeFirstResponder()
         })
         sheet.addAction(action)
      }
      
      let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
      sheet.addAction(cancel)
      
      present(sheet, animated: true, completion: nil)
   }
   
   
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
      inputField.becomeFirstResponder()
   }
}
