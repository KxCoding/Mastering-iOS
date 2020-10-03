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

class SelectionViewController: UIViewController {
   
   lazy var list: [MaterialColorDataSource.Color] = {
      (0...2).map { _ in
         return MaterialColorDataSource.generateSingleSectionData() }.reduce([], +)
   }()
   
   lazy var checkImage: UIImage? = UIImage.init(named: "checked")
   
   @IBOutlet weak var listCollectionView: UICollectionView!
   
   func selectRandomItem() {
      
   }
   
   func reset() {
      
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showMenu))
      
      
   }
}



extension SelectionViewController: UICollectionViewDataSource {
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return list.count
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
      cell.contentView.backgroundColor = list[indexPath.row].color
      
      return cell
   }
}







extension SelectionViewController {
   @objc func showMenu() {
      let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
      
      let randomAction = UIAlertAction(title: "Select Random Item", style: .default) { [weak self] (action) in
         self?.selectRandomItem()
      }
      actionSheet.addAction(randomAction)
      
      let resetPositionAction = UIAlertAction(title: "Reset", style: .default) { [weak self] (action) in
         self?.reset()
      }
      actionSheet.addAction(resetPositionAction)
      
      let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
      actionSheet.addAction(cancelAction)
      
      present(actionSheet, animated: true, completion: nil)
   }
}










