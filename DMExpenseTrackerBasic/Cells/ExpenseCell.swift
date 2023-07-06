//
//  ExpenseCell.swift
//  DMExpenseTrackerBasic
//
//  Created by David Ruvinskiy on 3/28/23.
//

import UIKit

class ExpenseCell: UITableViewCell {
 
    @IBOutlet weak var titleOfExpense: UILabel!
    @IBOutlet weak var amountOfExpense: UILabel!
    
    func set(expense: Expense) {
        print(expense.title)
        titleOfExpense.text = expense.title
        amountOfExpense.text = "$\(String(format: "%.2f", expense.amount))"
       
    }
}


//print(titleOfExpense.text ?? "No value")
// print(expenseAmount?.text ?? "No amount")
