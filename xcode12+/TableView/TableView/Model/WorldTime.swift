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

import Foundation

struct WorldTime {
    let date: String
    let hoursFromGMT: Int
    let location: String
    let ampm: String
    let time: String
    
    static func generateData() -> [WorldTime] {
        let list = [("Asia/Seoul", "서울"), ("America/New_York", "뉴욕"), ("Europe/Paris", "파리"), ("Europe/London", "런던"), ("Europe/Zurich", "취리히")]
        
        let now = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "Ko_kr")
        formatter.doesRelativeDateFormatting = true
        
        var result = [WorldTime]()
        
        for (timeZone, location) in list {
            guard let tz = TimeZone(identifier: timeZone) else { continue }
            
            let dt = now.addingTimeInterval(TimeInterval(tz.secondsFromGMT() - (9 * 3600)))
            
            formatter.dateStyle = .short
            formatter.timeStyle = .none
            let date = formatter.string(from: dt)
            
            formatter.dateFormat = "a"
            let ampm = formatter.string(from: dt)
            
            formatter.dateFormat = "h:mm"
            let time = formatter.string(from: dt)
            let hoursFromGMT = (tz.secondsFromGMT() / 3600) - 9
            
            let data = WorldTime(date: date, hoursFromGMT: hoursFromGMT, location: location, ampm: ampm, time: time)
            result.append(data)
        }
        
        return result
    }
}
