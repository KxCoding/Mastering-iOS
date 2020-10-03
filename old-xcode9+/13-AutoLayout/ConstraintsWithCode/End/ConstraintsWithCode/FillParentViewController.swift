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

class FillParentViewController: UIViewController {
   
   @IBOutlet weak var bottomContainer: UIView!
   
   @IBOutlet weak var blueView: UIView!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      layoutWithInitializer()
      //layoutWithVisualFormatLanguage()
      //layoutWithAnchor()
   }
}









extension FillParentViewController {
   func layoutWithInitializer() {
      blueView.translatesAutoresizingMaskIntoConstraints = false
      
      let leading = NSLayoutConstraint(item: blueView, attribute: .leading, relatedBy: .equal, toItem: bottomContainer, attribute: .leading, multiplier: 1.0, constant: 0)
      let top = NSLayoutConstraint(item: blueView, attribute: .top, relatedBy: .equal, toItem: bottomContainer, attribute: .top, multiplier: 1.0, constant: 0)
      let trailing = NSLayoutConstraint(item: blueView, attribute: .trailing, relatedBy: .equal, toItem: bottomContainer, attribute: .trailing, multiplier: 1.0, constant: 0)
      let bottom = NSLayoutConstraint(item: blueView, attribute: .bottom, relatedBy: .equal, toItem: bottomContainer, attribute: .bottom, multiplier: 1.0, constant: 0)
      
      NSLayoutConstraint.activate([leading, top, trailing, bottom])
   }
}









extension FillParentViewController {
   func layoutWithVisualFormatLanguage() {
      blueView.translatesAutoresizingMaskIntoConstraints = false
      
      let horzFmt = "|[b]|"
      let vertFmt = "V:|[b]|"
      
      let views: [String: Any] = ["b": blueView]
      
      let horzConstraints = NSLayoutConstraint.constraints(withVisualFormat: horzFmt, options: [], metrics: nil, views: views)
      let vertConstraints = NSLayoutConstraint.constraints(withVisualFormat: vertFmt, options: [], metrics: nil, views: views)
      
      NSLayoutConstraint.activate(horzConstraints + vertConstraints)
   }
}











extension FillParentViewController {
   func layoutWithAnchor() {
      blueView.translatesAutoresizingMaskIntoConstraints = false
      
      blueView.leadingAnchor.constraint(equalTo: bottomContainer.leadingAnchor).isActive = true
      blueView.topAnchor.constraint(equalTo: bottomContainer.topAnchor).isActive = true
      blueView.trailingAnchor.constraint(equalTo: bottomContainer.trailingAnchor).isActive = true
      blueView.bottomAnchor.constraint(equalTo: bottomContainer.bottomAnchor).isActive = true
   }
}
