//: [Previous](@previous)

import Foundation

//var p = NSPredicate(format: "(employees.age >= 40).@count >= 3")
//departments.filtered(using: p)

//var p2 = NSPredicate(format: "ANY employees.age >= 40 AND employees.@count >= 3")
//departments.filtered(using: p2)


/*:
 # Subquery
 
 SUBQUERY(collection, varName, predicate)
 */


let predicate = NSPredicate(format: "SUBQUERY(employees, $emp, $emp.age >= 40).@count >= 3")
departments.filtered(using: predicate)

//: [Next](@next)
