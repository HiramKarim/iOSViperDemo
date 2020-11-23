//
//  TodoListRouter.swift
//  ViperDemo
//
//  Created by Hiram Castro on 11/22/20.
//

import UIKit

class TodoListRouter: TodoListRouterProtocol {
    
    static func createTodoListModule() -> UIViewController {
        let todoListVC = TodoListViewController()
        let presenter: TodoListPresenterProtocol & TodoListInteractorOutputProtocol = TodoListPresenter()
        let interactor: TodoListInteractorInputProtocol = TodoListInteractor()
        let router = TodoListRouter()
        
        todoListVC.presenter = presenter
        
        presenter.view = todoListVC
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        return todoListVC
    }
    
    func presentTodoDetailScreen(from view: TodoListViewProtocol, for todo: TodoItem) {
        
    }
    
}
