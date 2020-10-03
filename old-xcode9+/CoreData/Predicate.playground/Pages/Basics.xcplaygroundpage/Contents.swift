import UIKit

/*:
 # Predicate
 - Format String
 - Whitespace Insensitive
 - Case Insensitive
 */




/*:
 ## Literals
 */

NSPredicate(format: "YES == TRUE")

NSPredicate(format: "NO == FALSE")

NSPredicate(format: "NULL == NIL")

NSPredicate(format: "age > 30")

NSPredicate(format: "name == 'Walmart'")

NSPredicate(format: "name == \"Walmart\"")

// Comma separated literal array
NSPredicate(format: "value IN {1, 2, 3, 4}")


/*:
 ## Format Specifiers
 */

NSPredicate(format: "%K CONTAINS %@", "name", "name")

NSPredicate(format: "age >= %@", NSNumber(value: 30))

NSPredicate(format: "age >= %d", 30)


/*:
 ## Evaluating Predicates
 */

let list = ["Apple", "Google", "MS"]
var predicate = NSPredicate(format: "SELF IN %@", list)
var ok = predicate.evaluate(with: "Apple")

predicate = NSPredicate(format: "SELF.revenue > 500000")
ok = predicate.evaluate(with: companies.firstObject)

//: [Next](@next)
