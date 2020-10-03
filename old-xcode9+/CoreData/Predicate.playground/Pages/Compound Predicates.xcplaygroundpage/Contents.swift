//: [Previous](@previous)

import Foundation

/*:
 # Compound Predicates
 */

/*:
 ## AND, &&
 */

var predicate = NSPredicate(format: "%K CONTAINS %@ AND %K > %d", #keyPath(Company.name), "Group", #keyPath(Company.revenue), 200000)
companies.filtered(using: predicate)

/*:
 ## OR, ||
 */

predicate = NSPredicate(format: "%K CONTAINS %@ OR %K > %d", #keyPath(Company.name), "Group", #keyPath(Company.revenue), 200000)
companies.filtered(using: predicate)

/*:
 ## NOT, !
 */

predicate = NSPredicate(format: "NOT (%K CONTAINS %@ OR %K > %d)", #keyPath(Company.name), "Group", #keyPath(Company.revenue), 200000)
companies.filtered(using: predicate)

//: [Next](@next)
