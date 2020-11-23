//
//  TodoListPresenter.swift
//  ViperDemo
//
//  Created by Hiram Castro on 11/19/20.
//

import Foundation

class TodoListPresenter: TodoListPresenterProtocol {
    
    weak var view: TodoListViewProtocol?
    var interactor: TodoListInteractorInputProtocol?
    var router: TodoListRouterProtocol?
    
    func viewWillAppear() {
        
    }
    
    func viewDidLoad() {
        interactor?.retriveTodos()
    }
    
    func showTodoDetail(_ todo: TodoItem) {
        guard let view = view else { return }
        router?.presentTodoDetailScreen(from: view, for: todo)
    }
    
    func addTodo(_ todo: TodoItem) {
        interactor?.saveTodo(todo)
    }
    
    func removeTodo(_ todo: TodoItem) {
        interactor?.deleteTodo(todo)
    }
    
}

extension TodoListPresenter: TodoListInteractorOutputProtocol {
    func didAddTodo(_ todo: TodoItem) {
        interactor?.retriveTodos()
    }
    
    func didRemoveTodo(_ todo: TodoItem) {
        interactor?.retriveTodos()
    }
    
    func didRetriveTodos(_ todos: [TodoItem]) {
        view?.showTodos(todos)
    }
    
    func onError(_ message: String) {
        view?.showErrorMessage(message)
    }
    
    
}
