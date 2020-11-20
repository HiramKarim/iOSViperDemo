//
//  TodoListProtocols.swift
//  ViperDemo
//
//  Created by Hiram Castro on 11/18/20.
//

import UIKit

protocol TodoListViewProtocol: class {
    var presenter: TodoListPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showTodos(_ todos: [TodoItem])
    func showErrorMessage(_ message: String)
}

protocol TodoListPresenterProtocol: class {
    var view:       TodoListViewProtocol? { get set }
    var interactor: TodoListInteractorInputProtocol? { get set }
    var router:     TodoListRouterProtocol? { get set }
    
    //VIEW -> PRESENTER
    func viewWillAppear()
    func viewDidLoad()
    func showTodoDetail(_ todo: TodoItem)
    func addTodo(_ todo: TodoItem)
    func removeTodo(_ todo: TodoItem)
}

protocol TodoListInteractorInputProtocol: class {
    var presenter: TodoListInteractorOutputProtocol? { get set }
    
    //PRESENTER -> INTERACTOR
    func retriveTodos()
    func saveTodo(_ todo: TodoItem)
    func deleteTodo(_ todo: TodoItem)
}

protocol TodoListInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didAddTodo(_ todo: TodoItem)
    func didRemoveTodo(_ todo: TodoItem)
    func didRetriveTodos(_ todos: [TodoItem])
    func onError(_ message: String)
}

protocol TodoListRouterProtocol: class {
    static func createTodoListModule() -> UIViewController
    
    // PRESENTER -> ROUTER
    func presentTodoDetailScreen(from view: TodoListViewProtocol, for todo: TodoItem)
}
