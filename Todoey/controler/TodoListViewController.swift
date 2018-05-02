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
    var itemArray = [Item]()
    //MARK - TableView Datasors Methode
    override func viewDidLoad() {
        super.viewDidLoad()
//        UIView.animate(withDuration: 0.0, delay: 0.3, options: .curveEaseInOut, animations: {
//
//        })
        let newIteme = Item()
        newIteme.titel = "one"
        itemArray.append(newIteme)
        
        let newIteme2 = Item()
        newIteme2.titel = "two"
        itemArray.append(newIteme2)
        
        
        let newIteme3 = Item()
        newIteme3.titel = "three"
        itemArray.append(newIteme3)
        
        
        let newIteme4 = Item()
        newIteme4.titel = "fore"
        itemArray.append(newIteme4)
        
        
        if let items  = defult.array(forKey: "TodayListArray") as? [Item] {
            itemArray = items
//
//        func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//
//
//            if targetContentOffset.pointee.y < scrollView.contentOffset.y {
//                targetContentOffset.pointee.y = scrollView.contentOffset.y
//            } else {
//                // it's going down
//            }
//
//        }
        
        }
        
    }
        // Do any additional setup after loading the view, typically from a nib.
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // print("go meroo")
         //let cell = UITableViewCell(style: .default, reuseIdentifier: "ToDoItemCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.titel
        
        cell.accessoryType = item.done == true ? .checkmark : .none
        
//        if itemArray[indexPath.row].done == true {
//            cell.accessoryType = .checkmark
//        } else
//        {
//            cell.accessoryType = . none
//        }
          return cell
        
    }
    //MARK tableView Delegate Methode
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print(itemArray[indexPath.row])
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
//        if  itemArray[indexPath.row].done == false {
//            itemArray[indexPath.row].done == true
//        }else{
//            itemArray[indexPath.row].done == false
//        }
        
//        if   tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        }else{
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }
//
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add New Item
    
    @IBAction func addButtonPresed(_ sender: UIBarButtonItem) {
        var textFiled = UITextField()
        let alert = UIAlertController(title: "add new today item", message: "jhgfdsa", preferredStyle: .alert)
        let action = UIAlertAction(title: "add item", style: .default) { (action) in
            //            print("sucsess!")
            //            print(textFiled.text)
            let newItem = Item()
            newItem.titel = textFiled.text!
            self.itemArray.append(newItem)
            self.defult.set(self.itemArray, forKey: "TodayListArray")
            self.tableView.reloadData()
            
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
    

