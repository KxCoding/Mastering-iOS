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

class InteractionViewController: UIViewController {
   
   @IBOutlet weak var interactionSwitch: UISwitch!
   
   @IBOutlet weak var multiTouchSwitch: UISwitch!
   
   @IBOutlet weak var touchView: TouchView!
   
   
   @IBAction func switchInteractionEnabled(_ sender: UISwitch) {
      touchView.isUserInteractionEnabled = sender.isOn
   }
   
   
   @IBAction func switchMultiTouch(_ sender: UISwitch) {
      touchView.isMultipleTouchEnabled = sender.isOn
   }
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      interactionSwitch.isOn = touchView.isUserInteractionEnabled
      multiTouchSwitch.isOn = touchView.isMultipleTouchEnabled
   }   
}







class TouchView: UIView {
   let pawImage = UIImage(named: "paw")
   
   var points = [CGPoint]()
   
   override func draw(_ rect: CGRect) {
      super.draw(rect)
      
      for pt in points {
         pawImage?.draw(at: pt)
      }
   }
   
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      
      for t in touches {
         let pt = t.location(in: self)
         
         points.append(pt.applying(CGAffineTransform(translationX: -32, y: -32)))
      }
      
      setNeedsDisplay()
   }
   
   override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
      points.removeAll()
      setNeedsDisplay()
   }
   
   override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
      points.removeAll()
      setNeedsDisplay()
   }
}
