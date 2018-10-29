//: [Previous](@previous)

import Foundation

/*:
 # Aggregate Qualifiers
 */

/*:
 ## ANY, SOME
 */

var predicate = NSPredicate(format: "ANY employees.age >= 50")
departments.filtered(using: predicate)

predicate = NSPredicate(format: "SOME employees.age >= 50")
departments.filtered(using: predicate)


/*:
 ## ALL
 */

predicate = NSPredicate(format: "ALL employees.age BETWEEN {31, 42}")
departments.filtered(using: predicate)


/*:
 ## NONE
 */

predicate = NSPredicate(format: "NONE employees.age < 30")
departments.filtered(using: predicate)


/*:
 ## IN
 */

predicate = NSPredicate(format: "revenue IN {229234.0, 89950.0}")
companies.filtered(using: predicate)


/*:
 # Aggregation Operators
 */

/*:
 ## @count
 */
predicate = NSPredicate(format: "employees.@count < 4")
departments.filtered(using: predicate)

/*:
 ## @avg
 */
predicate = NSPredicate(format: "employees.@avg.age < 30")
departments.filtered(using: predicate)

/*:
 ## @min
 */
predicate = NSPredicate(format: "employees.@min.age >= 30")
departments.filtered(using: predicate)

/*:
 ## @max
 */
predicate = NSPredicate(format: "employees.@max.age >= 50")
departments.filtered(using: predicate)

/*:
 ## @sum
 */
predicate = NSPredicate(format: "employees.@sum.salary >= 300000")
departments.filtered(using: predicate)


/*:
 # Array Operations
 */

predicate = NSPredicate(format: "employees[0].age >= 35")
departments.filtered(using: predicate)

predicate = NSPredicate(format: "employees[FIRST].age >= 35")
departments.filtered(using: predicate)

predicate = NSPredicate(format: "employees[LAST].age >= 35")
departments.filtered(using: predicate)

predicate = NSPredicate(format: "employees[SIZE] == 6")
departments.filtered(using: predicate)


//: [Next](@next)
