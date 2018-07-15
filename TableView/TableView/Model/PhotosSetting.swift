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

enum CellType: String {
   case detailTitle
   case `switch`
   case checkmark
}

struct PhotosSettingItem {
   let title: String
   let subTitle: String?
   let type: CellType
   let on: Bool
   var imageName: String?
}

struct PhotosSettingSection {
   let items: [PhotosSettingItem]
   let header: String?
   let footer: String?
   
   static func generateData() -> [PhotosSettingSection] {
      return [
         PhotosSettingSection(items:
            [PhotosSettingItem(title: "Siri & Search", subTitle: "Search & Siri Suggestions", type: .detailTitle, on: false, imageName: "Siri")], header: "Allow Photos to Access", footer: nil),
         PhotosSettingSection(items: [
            PhotosSettingItem(title: "Summarize Photos", subTitle: nil, type: .switch, on: true, imageName: nil)
            ], header: "Photos Tab", footer: "The Photos tab shows every photo in your library in all views. You can choose compact, summarized views for Collections and Years."),
         PhotosSettingSection(items: [
            PhotosSettingItem(title: "Show Holiday Events", subTitle: nil, type: .switch, on: true, imageName: nil)
            ], header: "Memories", footer: "You can choose to see holiday events for your home country."),
         PhotosSettingSection(items: [
            PhotosSettingItem(title: "Automatic", subTitle: nil, type: .checkmark, on: true, imageName: nil),
            PhotosSettingItem(title: "Keep Originals", subTitle: nil, type: .checkmark, on: true, imageName: nil)
            ], header: "Transfer to mac or PC", footer: "Automatically transfer photos and videos in a compitable format, or always transfer the original file without checking for compatibility.")
      ]
   }
}




















