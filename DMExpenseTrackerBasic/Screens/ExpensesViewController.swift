//
//  ExpensesViewController.swift
//  DMExpenseTrackerBasic
//
//  Created by David Ruvinskiy on 3/28/23.
//

import UIKit

class ExpensesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    
    @IBOutlet weak var expensesTableView: UITableView!
    
    // Used title of ViewController instead
    //@IBOutlet weak var expensesLabel: UILabel!
    

    
    var category: String
    var expenses: [Expense]
    

    
    init?(coder: NSCoder, category: String, expenses: [Expense]) {
           self.category = category
           self.expenses = expenses
           super.init(coder: coder)
       }
       
       required init?(coder: NSCoder) {
           self.category = ""
           self.expenses = []
           super.init(coder: coder)
       }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
    }
    
 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.expenseReuseID, for: indexPath) as! ExpenseCell

        let getExpenseForCurrentRow = expenses[indexPath.row]
        
        
        
        cell.set(expense: getExpenseForCurrentRow)
        //expensesLabel.text = cell.expenseTitle?.text

        return cell
    }
    

    
    func configureViewController() {
        // Display the total amount spent for the selected category
        var total: Double = 0.0
        for expense in expenses {
            total += expense.amount
        }
        
        let stringTotal = String(format: "%.2f", total)
        self.title = "You spent $\(stringTotal) on \(category)."
    }
    

    
    func configureTableView() {
        expensesTableView.delegate = self
        expensesTableView.dataSource = self
    }
}
