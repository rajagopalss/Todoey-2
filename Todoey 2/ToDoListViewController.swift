//
//  ViewController.swift
//  Todoey 2
//
//  Created by Rajagopal Srinivasan on 9/4/19.
//  Copyright © 2019 Rajagopal Srinivasan. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    
    var itemArray = ["Do Homework", "And I Oop Sksksks", "Make IOS Apps"]
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let items = defaults.array(forKey: "TodoListArray") as? [String]{
            itemArray = items
        }
        

    }
    
    
    //MARK - Tableview Datasource Methods
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        
        return cell
    }

    //MARK - Tableview Delegate Methods
    
    
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    
        //print(itemArray[indexPath.row])
    
    if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
        
    else{
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    
    tableView.deselectRow(at: indexPath, animated: true)
    
    
    }
    
    //MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
    let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //What Happens Once The User Clicks The Add Item Button
            
            self.itemArray.append(textField.text!)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
  
            
            
                   }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
            
           
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
      

}


