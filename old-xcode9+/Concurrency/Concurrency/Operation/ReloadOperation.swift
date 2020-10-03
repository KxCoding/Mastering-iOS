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


class ReloadOperation: Operation {
   weak var collectionView: UICollectionView!
   var indexPath: IndexPath?
   
   init(collectionView: UICollectionView, indexPath: IndexPath? = nil) {
      self.collectionView = collectionView
      self.indexPath = indexPath
      
      super.init()
   }
   
   override func main() {
      autoreleasepool {
         print(self, "Start", indexPath)
         
         defer {
            if isCancelled {
               print(self, "Cancelled", indexPath)
            } else {
               print(self, "Done", indexPath)
            }
         }
         
         guard Thread.isMainThread else { fatalError() }
         
         guard !isCancelled else { print(self, "Cancelled"); return }
         
         if let indexPath = indexPath {
            if collectionView.indexPathsForVisibleItems.contains(indexPath) {
               collectionView.reloadItems(at: [indexPath])
            }
         } else {
            collectionView.reloadData()
         }
      }
   }
   
   override func cancel() {
      super.cancel()
      
      print(self, "Cancel")
   }
}

















