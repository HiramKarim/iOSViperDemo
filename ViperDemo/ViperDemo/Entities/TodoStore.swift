//
//  TodoStore.swift
//  ViperDemo
//
//  Created by Hiram Castro on 11/17/20.
//

import Foundation

class TodoStore {
    
    private init() {}
    public static let shared = TodoStore()
    
    var todos:[TodoItem] = [
        TodoItem(title: "Focus", content: "Decide on what you want to focus in your life"),
        TodoItem(title: "Value", content: "Decide on what values are meaningful in your life"),
        TodoItem(title: "Action", content: "Decide on what you should do to achieve empowering life")
    ]
    
    func addTodo(_ todo:TodoItem) {
        todos.append(todo)
    }
    
    func removeTodo(_ todo:TodoItem) {
        if let index = todos.firstIndex(where: {$0.title == todo.title}) {
            todos.remove(at: index)
        }
    }
    
}
