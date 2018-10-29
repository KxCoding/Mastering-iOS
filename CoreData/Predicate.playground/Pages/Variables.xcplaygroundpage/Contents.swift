//: [Previous](@previous)

import Foundation

/*:
 # Variables
 */

var predicate = NSPredicate(format: "%K BEGINSWITH %@", #keyPath(Company.name), "America")

predicate = NSPredicate(format: "%K BEGINSWITH $COMPANY_NAME", #keyPath(Company.name)).withSubstitutionVariables(["COMPANY_NAME": "America"])

companies.filtered(using: predicate)

//: [Next](@next)
