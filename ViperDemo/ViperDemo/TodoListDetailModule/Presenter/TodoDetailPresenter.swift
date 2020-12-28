//
//  TodoDetailPresenter.swift
//  ViperDemo
//
//  Created by Hiram Castro on 11/24/20.
//

import UIKit

class TodoDetailPresenter: TodoDetailPresenterProtocol {
    
    weak var view: TodoDetailViewProtocol?
    var interactor: TodoDetailInteractorInputProtocol?
    var router: TodoDetailRouterProtocol?
    
    func viewDidLoad() {
        if let todoItem = interactor?.todoItem {
            view?.showTodo(todoItem)
        }
    }
    
    func viewWillAppear() {
        
    }
    
    func editTodo(title: String, content: String) {
        
    }
    
    func deleteTodo() {
        
    }
    
}

extension TodoDetailPresenter: TodoDetailInteractorOutputProtocol {
    func didDeleteTodo() {
        
    }
    
    func didEditTodo(_ todo: TodoItem) {
        
    }
}
