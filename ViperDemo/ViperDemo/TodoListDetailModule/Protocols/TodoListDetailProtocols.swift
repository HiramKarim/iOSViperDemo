//
//  TodoListDetailProtocols.swift
//  ViperDemo
//
//  Created by Hiram Castro on 11/23/20.
//

import UIKit


protocol TodoDetailViewProtocol: class {
    var presenter: TodoDetailPresenterProtocol? { get set }
    // PRESENTER -> VIEW
    func showTodo(_ todo: TodoItem)
}

protocol TodoDetailPresenterProtocol: class {
    var view: TodoDetailViewProtocol? { get set }
    var interactor: TodoDetailInteractorInputProtocol? { get set }
    var router: TodoDetailRouterProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func viewWillAppear()
    func editTodo(title: String, content:String)
    func deleteTodo()
}

protocol TodoDetailInteractorInputProtocol: class {
    var presenter: TodoDetailInteractorOutputProtocol? { get set }
    var todoItem: TodoItem? { get set }
    
    //PRESENTER -> INTREACTOR
    func deleteTodo()
    func editTodo(title: String, content: String)
}

protocol TodoDetailInteractorOutputProtocol: class {
    //INTERACTOR -> PRESENTER
    func didDeleteTodo()
    func didEditTodo(_ todo: TodoItem)
}

protocol TodoDetailRouterProtocol: class {
    static func createTodoDetailRouterModule(with todo: TodoItem) -> UIViewController
    //PRESENTER -> ROUTER
    func navigationBackToListViewController(from view: TodoDetailViewProtocol)
}
