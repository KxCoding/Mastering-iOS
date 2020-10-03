//: [Previous](@previous)

import Foundation

/*:
 # String Comparisons
 
 - case sensitive
 - diacritic sensitive
 */

/*:
 ## BEGINSWITH
 */

var predicate = NSPredicate(format: "%K BEGINSWITH %@", #keyPath(Company.name), "America")
companies.filtered(using: predicate)

predicate = NSPredicate(format: "%K BEGINSWITH %@", #keyPath(Company.name), "america")
companies.filtered(using: predicate)


/*:
 ## ENDSWITH
 */

predicate = NSPredicate(format: "%K ENDSWITH %@", #keyPath(Company.name), "Group")
companies.filtered(using: predicate)


/*:
 ## CONTAINS
 */

predicate = NSPredicate(format: "%K CONTAINS %@", #keyPath(Company.name), "America")
companies.filtered(using: predicate)


/*:
 ## LIKE
 
 - ? matches 1 character
 - \* matches 0 or more characters 
 */

predicate = NSPredicate(format: "%K LIKE %@", #keyPath(Company.name), "*Air*")
companies.filtered(using: predicate)

predicate = NSPredicate(format: "%K LIKE %@", #keyPath(Company.name), "De*Air*")
companies.filtered(using: predicate)


/*:
 ## MATCHES
 */

let list = NSArray(array: ["010-1234-5678", "010-123-4567", "01012345678", "02-123-4567"])
predicate = NSPredicate(format: "SELF MATCHES '\\\\d{3}-\\\\d{3,4}-\\\\d{4}'")
list.filtered(using: predicate)

let regex = "\\d{3}-\\d{3,4}-\\d{4}"
predicate = NSPredicate(format: "SELF MATCHES %@", regex)
list.filtered(using: predicate)

/*:
 ## Case Insensitive Search
 */

predicate = NSPredicate(format: "%K BEGINSWITH [c] %@", #keyPath(Company.name), "America")
companies.filtered(using: predicate)

predicate = NSPredicate(format: "%K BEGINSWITH[c] %@", #keyPath(Company.name), "america")
companies.filtered(using: predicate)


/*:
 ## Diacritic Insensitive Search
 */

predicate = NSPredicate(format: "'cafe' == 'cafè'")
predicate.evaluate(with: nil)

predicate = NSPredicate(format: "'cafe' == [d] 'cafè'")
predicate.evaluate(with: nil)



predicate = NSPredicate(format: "%K BEGINSWITH [cd] %@", #keyPath(Company.name), "America")
companies.filtered(using: predicate)


//: [Next](@next)
