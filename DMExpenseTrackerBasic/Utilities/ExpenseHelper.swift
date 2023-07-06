//
//  ExpenseHelper.swift
//  DMExpenseTrackerBasic
//
//  Created by David Ruvinskiy on 3/27/23.
//

import Foundation

class ExpenseHelper {
    
    /**
     4.2 Create a static function called `calculateTotalSpent` that accepts an array of `Expense` and returns the total amount of money the user spent. Feel free to run the provided test to know if your code is correct.
     */
    
    static func calculateTotalSpent(arrayOfExpenses: [Expense]) -> Double {
        
        var totalAmount:Double = 0.0
        
        for total in arrayOfExpenses {
            
            totalAmount += total.amount
            
        }
        
        return totalAmount
    }
    
    /**
     4.2 Create a static function called `getExpensesByCategory` that accepts an array of `Expense` and returns a dictionary where each key is a category and each value is an array of `Expense` belonging to that category. Feel free to run the provided test to know if your code is correct.
     */
    
    static func getExpensesByCategory(arrayOfExpenses: [Expense]) -> [String:[Expense]] {
        
        // We intitliaze an empty dictionary
        var expensesByCategory = [String:[Expense]]()
        
        // We set up a for loop to loop through the expsenses
        for expense in arrayOfExpenses {
            // we check if the category thats passed in is present or not in the dictionary
            
            if expensesByCategory[expense.category] == nil {
                // IF not we intiliaze that key (category) and that value (array of expenses)
                expensesByCategory[expense.category] = [expense]
                
            } else {
                // If the category already exists, add/append the expense to the existing dict value/array
                expensesByCategory[expense.category]?.append(expense)
            }
        }
        // rteurn the dictionary
        return expensesByCategory
    }
    
    
}
