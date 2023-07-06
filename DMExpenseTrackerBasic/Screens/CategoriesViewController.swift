//
//  CategoriesViewController.swift
//  DMExpenseTrackerBasic
//
//  Created by David Ruvinskiy on 3/27/23.
//

import UIKit

class CategoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
 
    
    @IBOutlet weak var categoriesTableView: UITableView!
    

    
    var expensesByCategory: [String: [Expense]] = [:]
    var categories: [String] = []
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.categoryReuseID, for: indexPath)
        let category = categories[indexPath.row]
        cell.textLabel?.text = category
        return cell
    }
    

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categories[indexPath.row]
        let expenses = expensesByCategory[category]
        
        
        
        print(category)
        print(expenses!)
        
        if let expensesVC = storyboard?.instantiateViewController(withIdentifier: Constants.expensesStoryboardID) as? ExpensesViewController {
            expensesVC.category = category
            expensesVC.expenses = expenses ?? []
           
            navigationController?.pushViewController(expensesVC, animated: true)
        }
    }
    

    
    func configureViewController() {
        self.title = "Categories"
        
        // Get expenses by category
        expensesByCategory = ExpenseHelper.getExpensesByCategory(arrayOfExpenses: Expense.expenses)
        
        // Get categories
        categories = Array(expensesByCategory.keys)
    }
    

    
    func configureTableView() {
        categoriesTableView.delegate = self
        categoriesTableView.dataSource = self
        categoriesTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.categoryReuseID)
    }
}
