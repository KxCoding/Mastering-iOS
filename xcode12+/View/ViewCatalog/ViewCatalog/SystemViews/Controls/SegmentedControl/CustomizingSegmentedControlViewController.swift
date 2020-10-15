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

class CustomizingSegmentedControlViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var titleField: UITextField!
    
    @IBAction func insertSegment(_ sender: Any) {
        
    }
    
    @IBAction func removeSegment(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let normalImage = UIImage(named: "segment_normal")
        let selectedImage = UIImage(named: "segment_selected")
        
        segmentedControl.setBackgroundImage(normalImage, for: .normal, barMetrics: .default)
        segmentedControl.setBackgroundImage(selectedImage, for: .selected, barMetrics: .default)
        
        
        var img = UIImage(named: "segment_normal_normal")
        print(img?.size)
        segmentedControl.setDividerImage(img, forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
        let halfWidth = (img!.size.width - 20) / 3.0
        var offset = UIOffset(horizontal: halfWidth, vertical: 0.0)
        segmentedControl.setContentPositionAdjustment(offset, forSegmentType: .left, barMetrics: .default)
        
        img = UIImage(named: "segment_normal_selected")
        segmentedControl.setDividerImage(img, forLeftSegmentState: .normal, rightSegmentState: .selected, barMetrics: .default)
        
        img = UIImage(named: "segment_selected_normal")
        segmentedControl.setDividerImage(img, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        
        
        
    }
}


















