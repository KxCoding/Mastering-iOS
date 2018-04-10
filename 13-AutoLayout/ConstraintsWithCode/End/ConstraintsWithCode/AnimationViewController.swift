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

class AnimationViewController: UIViewController {
   @IBOutlet weak var redView: UIView!
   
   @IBOutlet weak var widthConstraint: NSLayoutConstraint!
   
   @IBOutlet weak var heightConstraint: NSLayoutConstraint!
   
   @IBOutlet weak var centerXConstraint: NSLayoutConstraint!
   
   @IBOutlet weak var centerYConstraint: NSLayoutConstraint!
   
   
   @IBAction func animate(_ sender: Any) {
      widthConstraint.constant = CGFloat(arc4random_uniform(91)) + 10
      heightConstraint.constant = CGFloat(arc4random_uniform(91)) + 10
      
      centerXConstraint.constant = CGFloat(arc4random_uniform(101)) - 50
      centerYConstraint.constant = CGFloat(arc4random_uniform(101)) - 50
      
      
      UIView.animate(withDuration: 0.3) { [weak self] in
         guard let strongSelf = self else { return }
         
         strongSelf.view.layoutIfNeeded()
      }
   }
   
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      // Do any additional setup after loading the view.
   }
}
