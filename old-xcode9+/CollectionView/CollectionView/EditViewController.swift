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

class EditViewController: UIViewController {
   
   var selectedList = [UIColor]()
   var colorList = MaterialColorDataSource.generateMultiSectionData()
   
   @IBOutlet weak var listCollectionView: UICollectionView!

   func emptySelectedList() {
      
   }
   
   func insertSection() {
      
   }
   
   func deleteSecondSection() {
      
   }
   
   func moveSecondSectionToThird() {
      
   }
   
   func performBatchUpdates() {
      
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showMenu))
   }
}


extension EditViewController: UICollectionViewDelegate {
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
   }
}


extension EditViewController: UICollectionViewDataSource {
   func numberOfSections(in collectionView: UICollectionView) -> Int {
      return colorList.count + 1
   }
   
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      if section == 0 {
         return selectedList.count
      }
      
      return colorList[section - 1].colors.count
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
      
      switch indexPath.section {
      case 0:
         cell.contentView.backgroundColor = selectedList[indexPath.row]
      default:
         cell.contentView.backgroundColor = colorList[indexPath.section - 1].colors[indexPath.item]
      }
      
      return cell
   }
   
   func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
      let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! EditingHeaderCollectionReusableView
      
      if indexPath.section == 0 {
         header.titleLabel.text = "Selected Color List"
      } else {
         header.titleLabel.text = colorList[indexPath.section - 1].title
      }
      
      return header
   }
}



extension EditViewController {
   @objc func showMenu() {
      let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
      
      let emptyListAction = UIAlertAction(title: "Empty Selected List", style: .default) { [weak self] (action) in
         self?.emptySelectedList()
      }
      actionSheet.addAction(emptyListAction)
      
      let insertSectionAction = UIAlertAction(title: "Insert Section", style: .default) { [weak self] (action) in
         self?.insertSection()
      }
      actionSheet.addAction(insertSectionAction)
      
      let delectSecondSectionAction = UIAlertAction(title: "Delete Second Section", style: .default) { [weak self] (action) in
         self?.deleteSecondSection()
      }
      actionSheet.addAction(delectSecondSectionAction)
      
      let moveSectionAction = UIAlertAction(title: "Move Second Section to Third", style: .default) { [weak self] (action) in
         self?.moveSecondSectionToThird()
      }
      actionSheet.addAction(moveSectionAction)
      
      let batchUpdatesAction = UIAlertAction(title: "Perform Batch Update", style: .default) { [weak self] (action) in
         self?.performBatchUpdates()
      }
      actionSheet.addAction(batchUpdatesAction)
      
      let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
      actionSheet.addAction(cancelAction)
      
      present(actionSheet, animated: true, completion: nil)
   }
}


extension UIColor {
   static var random: UIColor {
      let r = CGFloat(arc4random_uniform(256)) / 255
      let g = CGFloat(arc4random_uniform(256)) / 255
      let b = CGFloat(arc4random_uniform(256)) / 255
      
      return UIColor(displayP3Red: r, green: g, blue: b, alpha: 1.0)
   }
}










