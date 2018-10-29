//: [Previous](@previous)

import Foundation

let list = NSArray(array: [1, 2, 3, 4, 5, 6, 7, 8, 9])

/*:
 # Comparisons
 
 ## Equal To (=, ==)
 */

var predicate = NSPredicate(format: "SELF == %d", 2)
var result = list.filtered(using: predicate)

/*:
 ## Not Equal To (!=, <>)
 */

predicate = NSPredicate(format: "SELF != %d", 2)
result = list.filtered(using: predicate)

/*:
 ## Greater Than (>)
 */

predicate = NSPredicate(format: "SELF > %d", 5)
result = list.filtered(using: predicate)

/*:
 ## Greater Than Or Equal To (>=, =>)
 */

predicate = NSPredicate(format: "SELF >= %d", 5)
result = list.filtered(using: predicate)

/*:
 ## Less Than (<)
 */

predicate = NSPredicate(format: "SELF < %d", 5)
result = list.filtered(using: predicate)

/*:
 ## Less Than Or Equal To (<=, =<)
 */

predicate = NSPredicate(format: "SELF <= %d", 5)
result = list.filtered(using: predicate)

/*:
 ## BETWEEN
 */

predicate = NSPredicate(format: "SELF BETWEEN {3, 7}")
result = list.filtered(using: predicate)

//: [Next](@next)
