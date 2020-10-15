//
//  Mastering iOS
//  Copyright (c) KxCoding <help@kxcoding.com>
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

class ContentModeViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var modeLabel: UILabel!
    
    @IBAction func switchMode(_ sender: Any) {
        
    }
    
    func updateModeLabel() {
        switch imageView.contentMode {
        case .scaleToFill:
            modeLabel.text = "Scale to fill"
        case .scaleAspectFit:
            modeLabel.text = "Aspect fit"
        case .scaleAspectFill:
            modeLabel.text = "Aspect fill"
        case .redraw:
            modeLabel.text = "Redraw"
        case .center:
            modeLabel.text = "Center"
        case .top:
            modeLabel.text = "Top"
        case .bottom:
            modeLabel.text = "Bottom"
        case .left:
            modeLabel.text = "Left"
        case .right:
            modeLabel.text = "Right"
        case .topLeft:
            modeLabel.text = "Top left"
        case .topRight:
            modeLabel.text = "Top right"
        case .bottomLeft:
            modeLabel.text = "Bottom left"
        case .bottomRight:
            modeLabel.text = "Bottom right"
        @unknown default:
            fatalError()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.borderColor = UIColor.blue.cgColor
        imageView.layer.borderWidth = 2
        
        updateModeLabel()
    }
}
