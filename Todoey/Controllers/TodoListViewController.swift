//
//  ViewController.swift
//  Todoey
//
//  Created by Irene Natalia on 4/11/19.
//  Copyright © 2019 Irene Hardjono. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let newItem = Item()
        newItem.title = "itemArray"
        itemArray.append(newItem)
        let newItem2 = Item()
        newItem2.title = "itemArray"
        itemArray.append(newItem2)
        let newItem3 = Item()
        newItem3.title = "itemArray"
        itemArray.append(newItem3)
        let newItem4 = Item()
        newItem4.title = "itemArray"
        itemArray.append(newItem4)
    }
    
    //MARK - TableView Datasource Methods
    /* Display number of rows on the screen*/
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    /* Display the labels on the cell */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
       
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    //MARK - TableView Delegate Methods
    /* Select a cell with animated and Add checkmarks */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK - Add Items Button
    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add Bew Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //Something happens once user clicks the add item button on UIAlert
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
        }
        
        //Text field place holder
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        //Alert pops up when + add item is pressed
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
}

