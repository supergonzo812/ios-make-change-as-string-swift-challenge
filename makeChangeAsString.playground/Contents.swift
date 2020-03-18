import UIKit

func makeChangeAsString(fromAmount: Double, withCost: Double) -> String {
    
    var changeString: String = ""
    
    var dollarCount: Int = 0
    var quarterCount: Int = 0
    var dimeCount: Int = 0
    var nickelCount: Int = 0
    var pennyCount: Int = 0
    var changeTotal: Double = 0.00
    
    changeTotal = fromAmount - withCost
    var changeInt = Int(floor(changeTotal))

    var changeDecimal = changeTotal.truncatingRemainder(dividingBy: 1)
    let decimalString = String(format: "%.2f", changeDecimal)
    guard let decimalDouble = Double(decimalString) else { return "Error rounding decimal" }
    changeDecimal = decimalDouble
    
    
    guard fromAmount > withCost else {
        var converteredChange = -(changeTotal)
        var convertedChangeInt = Int(floor(converteredChange))
        var convertedDecimal = converteredChange.truncatingRemainder(dividingBy: 1)
        
        let decimalString = String(format: "%.2f", converteredChange)
        guard let decimalDouble = Double(decimalString) else { return "Error rounding decimal" }
        converteredChange = decimalDouble
        
        
        
        while convertedChangeInt < 0 && convertedDecimal < 0 {
            
            if convertedChangeInt < 0 {
                convertedChangeInt -= 1
                dollarCount -= 1
            }
            if convertedDecimal < 0 {
                if convertedDecimal <= 0.25 {
                    convertedDecimal -= 0.25
                    quarterCount += 1
                } else if convertedDecimal <= 0.10 {
                    convertedDecimal -= 0.10
                    dimeCount += 1
                } else if convertedDecimal <= 0.05 {
                    convertedDecimal -= 0.05
                    nickelCount += 1
                } else if convertedDecimal <= 0.01{
                    convertedDecimal -= 0.01
                    pennyCount += 1
                }
            }
        }
        changeString = "You didn't pay enough.  You still owe \(dollarCount) dollars, \(quarterCount) quarters, \(dimeCount) dimes, \(nickelCount) nickels, and \(pennyCount) pennies."
        return changeString
    }
    
    while changeInt < 0 && changeDecimal < 0 {
        
        if changeInt < 0 {
            changeInt -= 1
            dollarCount -= 1
        }
        if changeDecimal < 0 {
            if changeDecimal <= 0.25 {
                changeDecimal -= 0.25
                quarterCount += 1
            } else if changeDecimal <= 0.10 {
                changeDecimal -= 0.10
                dimeCount += 1
            } else if changeDecimal <= 0.05 {
                changeDecimal -= 0.05
                nickelCount += 1
            } else if changeDecimal <= 0.01{
                changeDecimal -= 0.01
                pennyCount += 1
            }
        }
    }
    
    changeString = "Your change is \(changeTotal).  That is \(dollarCount) dollars, \(quarterCount) quarters, \(dimeCount) dimes, \(nickelCount) nickels, and \(pennyCount) pennies."
    
    return changeString
}




// Test Cases
makeChangeAsString(fromAmount: 10.00, withCost: 2.38) // returns "Your change is $7.62. That is 7 dollars, 2 quarters, 1 dime, 0 nickels and 2 pennies."
makeChangeAsString(fromAmount: 5.00, withCost: 2.15)  // returns "Your change is $2.85. That is 2 dollars, 3 quarters, 1 dime, 0 nickels and 0 pennies."
makeChangeAsString(fromAmount: 1.00, withCost: 2.38)  // returns "You didn't pay enough! You still owe $1.38. That is 1 dollar, 1 quarter, 1 dime, 0 nickels and 3 pennies."
makeChangeAsString(fromAmount: 10.00, withCost: 8.00) // returns "Your change is $2.0. That is 2 dollars, 0 quarters, 0 dimes, 0 nickels and 0 pennies."
makeChangeAsString(fromAmount: 1.00, withCost: 0.50)  // returns "Your change is $0.5. That is 0 dollars, 2 quarters, 0 dimes, 0 nickels and 0 pennies."
makeChangeAsString(fromAmount: 1.00, withCost: 0.80)  // returns "Your change is $0.2. That is 0 dollars, 0 quarters, 2 dimes, 0 nickels and 0 pennies."
makeChangeAsString(fromAmount: 1.00, withCost: 0.95)  // returns "Your change is $0.05. That is 0 dollars, 0 quarters, 0 dimes, 1 nickel and 0 pennies."
makeChangeAsString(fromAmount: 1.00, withCost: 0.96)  // returns "Your change is $0.04. That is 0 dollars, 0 quarters, 0 dimes, 0 nickels and 4 pennies."
