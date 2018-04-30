//
//  ViewController.swift
//  Todoey
//
//  Created by ameer on 4/30/18.
//  Copyright © 2018 ameer. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    let defult = UserDefaults.standard
var itemArray = ["one" ,"two", "three"]
    //MARK - TableView Datasors Methode
    override func viewDidLoad() {
        super.viewDidLoad()
        if let items  = defult.array(forKey: "TodayListArray") as? [String] {
            itemArray = items
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    
    }
     //MARK tableView Delegate Methode
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        
        
        if   tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
              tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
//MARK - Add New Item
    
    @IBAction func addButtonPresed(_ sender: UIBarButtonItem) {
        var textFiled = UITextField()
        let alert = UIAlertController(title: "add new today item", message: "jhgfdsa", preferredStyle: .alert)
        let action = UIAlertAction(title: "add item", style: .default) { (action) in
//            print("sucsess!")
//            print(textFiled.text)
            self.itemArray.append(textFiled.text!)
            self.tableView.reloadData()
            self.defult.set(self.itemArray, forKey: "TodayListArray")
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "creat new item"
          //  print(alertTextField.text)
            textFiled = alertTextField
            
        }
        alert.addAction(action)
        present(alert , animated: true , completion: nil)
    }
    
}

