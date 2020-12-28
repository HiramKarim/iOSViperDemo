//
//  TodoDetailVC.swift
//  ViperDemo
//
//  Created by Hiram Castro on 11/23/20.
//

import UIKit

class TodoDetailVC: UIViewController {
    
    var presenter: TodoDetailPresenterProtocol?

    let titleLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let contentLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let deleteButton:UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("Delete", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let editButton:UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("Edit", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        presenter?.viewWillAppear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        self.navigationController?.navigationItem.title = "Detail"
    }
    
    private func configView() {
        self.view.addSubview(titleLabel)
        self.view.addSubview(contentLabel)
        self.view.addSubview(deleteButton)
        self.view.addSubview(editButton)
        
        deleteButton.addTarget(self, action: #selector(deleteButtonPressed), for: .touchUpInside)
        editButton.addTarget(self, action: #selector(editButtonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            titleLabel.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            contentLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            deleteButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            deleteButton.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 10)
        ])
        NSLayoutConstraint.activate([
            editButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            editButton.topAnchor.constraint(equalTo: deleteButton.bottomAnchor, constant: 10)
        ])
    }
    
    @objc private func deleteButtonPressed() {
        presenter?.deleteTodo()
    }
    
    @objc private func editButtonPressed() {
        let alertController = UIAlertController(title: "Edit Todo Item", message: "Enter title and content", preferredStyle: .alert)
        alertController.addTextField { $0.text = self.titleLabel.text }
        alertController.addTextField { $0.text = self.contentLabel.text }
        alertController.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { [weak self](_) in
            let titleText = alertController.textFields![0].text ?? ""
            let contentText = alertController.textFields![1].text ?? ""
            guard !titleText.isEmpty else { return }
            self?.presenter?.editTodo(title: titleText, content: contentText)
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }

}

extension TodoDetailVC: TodoDetailViewProtocol {
    func showTodo(_ todo: TodoItem) {
        titleLabel.text = todo.title
        contentLabel.text = todo.content
    }
}
