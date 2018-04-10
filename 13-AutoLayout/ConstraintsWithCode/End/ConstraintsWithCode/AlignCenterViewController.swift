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

class AlignCenterViewController: UIViewController {
   
   @IBOutlet weak var bottomContainer: UIView!
   
   @IBOutlet weak var titleLabel: UILabel!
   
   @IBOutlet weak var bottomLineView: UIView!
   
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      //layoutWithInitializer()
      //layoutWithVisualFormatLanguage()
      layoutWithAnchor()
   }
}












extension AlignCenterViewController {
   func layoutWithInitializer() {
      titleLabel.translatesAutoresizingMaskIntoConstraints = false
      bottomLineView.translatesAutoresizingMaskIntoConstraints = false
      
      var centerX = NSLayoutConstraint(item: titleLabel, attribute: .centerX, relatedBy: .equal, toItem: bottomContainer, attribute: .centerX, multiplier: 1.0, constant: 0.0)
      let centerY = NSLayoutConstraint(item: titleLabel, attribute: .centerY, relatedBy: .equal, toItem: bottomContainer, attribute: .centerY, multiplier: 1.0, constant: 0.0)
      
      NSLayoutConstraint.activate([centerX, centerY])
      
      centerX = NSLayoutConstraint(item: bottomLineView, attribute: .centerX, relatedBy: .equal, toItem: titleLabel, attribute: .centerX, multiplier: 1.0, constant: 0.0)
      let top = NSLayoutConstraint(item: bottomLineView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1.0, constant: 10)
      let width = NSLayoutConstraint(item: bottomLineView, attribute: .width, relatedBy: .equal, toItem: titleLabel, attribute: .width, multiplier: 1.0, constant: 0.0)
      let height = NSLayoutConstraint(item: bottomLineView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 5.0)
      
      NSLayoutConstraint.activate([centerX, top, width, height])
   }
}









extension AlignCenterViewController {
   func layoutWithVisualFormatLanguage() {
      titleLabel.translatesAutoresizingMaskIntoConstraints = false
      bottomLineView.translatesAutoresizingMaskIntoConstraints = false
      
      titleLabel.centerXAnchor.constraint(equalTo: bottomContainer.centerXAnchor).isActive = true
      titleLabel.centerYAnchor.constraint(equalTo: bottomContainer.centerYAnchor).isActive = true
      
      bottomLineView.widthAnchor.constraint(equalTo: titleLabel.widthAnchor).isActive = true
      
      let vertFmt = "V:[lbl]-10-[line(==5)]"
      let views: [String: Any] = ["lbl": titleLabel, "line": bottomLineView]
      
      let vertConstraints = NSLayoutConstraint.constraints(withVisualFormat: vertFmt, options: .alignAllCenterX, metrics: nil, views: views)
      NSLayoutConstraint.activate(vertConstraints)
      
      
   }
}











extension AlignCenterViewController {
   func layoutWithAnchor() {
      titleLabel.translatesAutoresizingMaskIntoConstraints = false
      bottomLineView.translatesAutoresizingMaskIntoConstraints = false
      
      titleLabel.centerXAnchor.constraint(equalTo: bottomContainer.centerXAnchor).isActive = true
      titleLabel.centerYAnchor.constraint(equalTo: bottomContainer.centerYAnchor).isActive = true
      
      bottomLineView.widthAnchor.constraint(equalTo: titleLabel.widthAnchor).isActive = true
      
      bottomLineView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
      bottomLineView.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor).isActive = true
      bottomLineView.heightAnchor.constraint(equalToConstant: 5).isActive = true
   }
}
