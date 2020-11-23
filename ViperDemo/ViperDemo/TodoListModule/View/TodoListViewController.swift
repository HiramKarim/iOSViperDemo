//
//  TodoListViewController.swift
//  ViperDemo
//
//  Created by Hiram Castro on 11/18/20.
//

import Foundation
import UIKit

class TodoListViewController: UITableViewController {
    
    var presenter:TodoListPresenterProtocol?
    
    var todos:[TodoItem] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    deinit {
        presenter = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        presenter?.viewWillAppear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    override func tableView(_ tableView:UITableView, cellForRowAt indepath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indepath)
        let todo = todos[indepath.row]
        cell.textLabel?.text = todo.title
        cell.detailTextLabel?.text = todo.content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = todos[indexPath.row]
        presenter?.showTodoDetail(todo)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let todoItem = todos[indexPath.row]
            presenter?.removeTodo(todoItem)
        }
    }
    
}

extension TodoListViewController: TodoListViewProtocol {
    func showTodos(_ todos: [TodoItem]) {
        self.todos = todos
    }
    
    func showErrorMessage(_ message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
