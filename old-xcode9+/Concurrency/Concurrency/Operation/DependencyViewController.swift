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

class DependencyViewController: UIViewController {
   
   let backgroundQueue = OperationQueue()
   let mainQueue = OperationQueue.main
   
   var uiOperations = [Operation]()
   var backgroundOperations = [Operation]()
   
   @IBOutlet weak var listCollectionView: UICollectionView!
   
   @IBAction func startOperation(_ sender: Any) {
      PhotoDataSource.shared.reset()
      listCollectionView.reloadData()
      uiOperations.removeAll()
      backgroundOperations.removeAll()
      
      
   }
   
   
   @IBAction func cancelOperation(_ sender: Any) {
      
   }
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      PhotoDataSource.shared.reset()
   }
}


extension DependencyViewController: UICollectionViewDataSource {
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return PhotoDataSource.shared.list.count
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
      
      let target = PhotoDataSource.shared.list[indexPath.item]
      if let imageView = cell.contentView.viewWithTag(100) as? UIImageView {
         imageView.image = target.data
      }
      
      return cell
   }
}


extension DependencyViewController: UICollectionViewDelegateFlowLayout {
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let w = collectionView.bounds.width / 3
      return CGSize(width: w, height: w * (768 / 1024))
   }
}
