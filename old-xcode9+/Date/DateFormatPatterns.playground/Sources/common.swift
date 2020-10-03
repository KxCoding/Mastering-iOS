import Foundation

public func print(dateFormatPatterns patterns: [String], from date: Date = Date()) {
   let localeIdentifiers = ["en_US", "ko_KR"]
   
   let formatter = DateFormatter()
   
   for id in localeIdentifiers {
      print("== \(id) ==============")
      formatter.locale = Locale(identifier: id)
      
      for pattern in patterns {
         formatter.setLocalizedDateFormatFromTemplate(pattern)
         
         print(pattern.padding(toLength: 10, withPad: " ", startingAt: 0), formatter.string(from: date))
      }
      
      print("")
   }
}
