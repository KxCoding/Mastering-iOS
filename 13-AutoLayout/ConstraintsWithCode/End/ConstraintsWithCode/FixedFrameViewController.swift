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

class FixedFrameViewController: UIViewController {
   
   @IBOutlet weak var redView: UIView!
   
   @IBOutlet weak var blueView: UIView!
   
   @IBOutlet weak var bottomContainer: UIView!
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      layoutWithInitializer()
      //layoutWithVisualFormatLanguage()
      //layoutWithAnchor()
   }
}







extension FixedFrameViewController {
   func layoutWithInitializer() {
      redView.translatesAutoresizingMaskIntoConstraints = false
      blueView.translatesAutoresizingMaskIntoConstraints = false
      
      let leading = NSLayoutConstraint(item: redView, attribute: .leading, relatedBy: .equal, toItem: bottomContainer, attribute: .leadingMargin, multiplier: 1.0, constant: 0)
      let top = NSLayoutConstraint(item: redView, attribute: .top, relatedBy: .equal, toItem: bottomContainer, attribute: .topMargin, multiplier: 1.0, constant: 0)
      var width = NSLayoutConstraint(item: redView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)
      var height = NSLayoutConstraint(item: redView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)
      
      NSLayoutConstraint.activate([leading, top, width, height])
      
      let trailing = NSLayoutConstraint(item: blueView, attribute: .trailing, relatedBy: .equal, toItem: bottomContainer, attribute: .trailing, multiplier: 1.0, constant: -20)
      let bottom = NSLayoutConstraint(item: blueView, attribute: .bottom, relatedBy: .equal, toItem: bottomContainer, attribute: .bottom, multiplier: 1.0, constant: -20)
      width = NSLayoutConstraint(item: blueView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)
      height = NSLayoutConstraint(item: blueView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)
      
      NSLayoutConstraint.activate([trailing, bottom, width, height])
   }
}









extension FixedFrameViewController {
   func layoutWithVisualFormatLanguage() {
      redView.translatesAutoresizingMaskIntoConstraints = false
      blueView.translatesAutoresizingMaskIntoConstraints = false
      
      var horzFmt = "|-[red(100)]"
      var vertFmt = "V:|-[red(100)]"
      
      let views: [String: Any] = ["red": redView, "blue": blueView]
      
      var horzConstraints = NSLayoutConstraint.constraints(withVisualFormat: horzFmt, options: [], metrics: nil, views: views)
      var vertConstraints = NSLayoutConstraint.constraints(withVisualFormat: vertFmt, options: [], metrics: nil, views: views)
      
      NSLayoutConstraint.activate(horzConstraints + vertConstraints)
      
      horzFmt = "[blue(100)]-20-|"
      vertFmt = "V:[blue(100)]-20-|"
      
      horzConstraints = NSLayoutConstraint.constraints(withVisualFormat: horzFmt, options: [], metrics: nil, views: views)
      vertConstraints = NSLayoutConstraint.constraints(withVisualFormat: vertFmt, options: [], metrics: nil, views: views)
      NSLayoutConstraint.activate(horzConstraints + vertConstraints)
   }
}











extension FixedFrameViewController {
   func layoutWithAnchor() {
      redView.translatesAutoresizingMaskIntoConstraints = false
      blueView.translatesAutoresizingMaskIntoConstraints = false
      
      bottomContainer.layoutMarginsGuide.leadingAnchor.constraint(equalTo: redView.leadingAnchor).isActive = true
      bottomContainer.layoutMarginsGuide.topAnchor.constraint(equalTo: redView.topAnchor).isActive = true
      redView.widthAnchor.constraint(equalToConstant: 100).isActive = true
      redView.heightAnchor.constraint(equalToConstant: 100).isActive = true
      
      bottomContainer.trailingAnchor.constraint(equalTo: blueView.trailingAnchor, constant: 20).isActive = true
      blueView.bottomAnchor.constraint(equalTo: bottomContainer.bottomAnchor, constant: -20).isActive = true
      blueView.widthAnchor.constraint(equalToConstant: 100).isActive = true
      blueView.heightAnchor.constraint(equalToConstant: 100).isActive = true
   }
}

