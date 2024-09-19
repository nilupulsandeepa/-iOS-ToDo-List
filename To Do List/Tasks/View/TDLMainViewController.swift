//
//  TDLMainViewController.swift
//  To Do List
//
//  Created by Nilupul Sandeepa on 2024-09-07.
//

import UIKit

public class TDLMainViewController: UIViewController {
    
    //---- MARK: Properties
    
    
    public override func viewDidLoad() {
        configureUI()
    }
    
    //---- MARK: Helper Methods
    private func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(g_AppTitleView)
        g_AppTitleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        g_AppTitleView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        g_AppTitleView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        
        view.addSubview(g_NewTaskSectionHolderBackgroundView)
        g_NewTaskSectionHolderBackgroundView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        g_NewTaskSectionHolderBackgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
        g_NewTaskSectionHolderBackgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        g_NewTaskSectionHolderBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        view.addSubview(g_NewTaskSectionHolderView)
        g_NewTaskSectionHolderView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        g_NewTaskSectionHolderView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        g_NewTaskSectionHolderView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        g_NewTaskSectionHolderView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        view.addSubview(g_TaskTableView)
        g_TaskTableView.topAnchor.constraint(equalTo: g_AppTitleView.bottomAnchor, constant: 16).isActive = true
        g_TaskTableView.bottomAnchor.constraint(equalTo: g_NewTaskSectionHolderView.topAnchor, constant: -4).isActive = true
        g_TaskTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        g_TaskTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
    }
    
    //---- MARK: Action Methods
    @objc func createTaskButtonTap() {
        if g_NewTaskTextInputView.text != nil && g_NewTaskTextInputView.text != "" {
            let m_InputTaskTitle: String = g_NewTaskTextInputView.text!
            TDLTaskManager.shared.create(taskTitle: m_InputTaskTitle)
            g_TaskTableView.reloadData()
            g_NewTaskTextInputView.text = ""
        }
    }
    
    //---- MARK: UI Components
    private lazy var g_AppTitleView: UILabel = {
        let m_View: UILabel = UILabel()
        m_View.translatesAutoresizingMaskIntoConstraints = false
        
        m_View.text = "To Do List".localizedString(key: "TDL_APP_TITLE")
        m_View.textColor = .black
        
        
        return m_View
    }()
    
    private lazy var g_TaskTableView: UITableView = {
        let m_View: UITableView = UITableView()
        m_View.translatesAutoresizingMaskIntoConstraints = false
        
        m_View.dataSource = self
        m_View.delegate = self
        m_View.separatorStyle = .none
        m_View.register(TDLTaskTableViewCell.self, forCellReuseIdentifier: TDLConstants.CellIdentifiers.UI_TASK_TABLE_CELL_IDENTIFIER)
        
        return m_View
    }()
    
    private lazy var g_NewTaskSectionHolderBackgroundView: UIView = {
        let m_View: UIView = UIView()
        m_View.translatesAutoresizingMaskIntoConstraints = false
        
        
        m_View.backgroundColor = UIColor(red: 247 / 255, green: 241 / 255, blue: 220 / 255, alpha: 1)
        
        return m_View
    }()
    
    private lazy var g_NewTaskSectionHolderView: UIView = {
        let m_View: UIView = UIView()
        m_View.translatesAutoresizingMaskIntoConstraints = false
        
        m_View.addSubview(g_NewTaskTextInputHolderView)
        g_NewTaskTextInputHolderView.topAnchor.constraint(equalTo: m_View.topAnchor, constant: 4).isActive = true
        g_NewTaskTextInputHolderView.leadingAnchor.constraint(equalTo: m_View.leadingAnchor, constant: 16).isActive = true
        g_NewTaskTextInputHolderView.trailingAnchor.constraint(equalTo: m_View.trailingAnchor, constant: -16).isActive = true
        g_NewTaskTextInputHolderView.heightAnchor.constraint(equalTo: m_View.heightAnchor, multiplier: 0.5, constant: -4).isActive = true
        
        m_View.addSubview(g_NewTaskCreateButtonView)
        g_NewTaskCreateButtonView.topAnchor.constraint(equalTo: g_NewTaskTextInputHolderView.bottomAnchor, constant: 4).isActive = true
        g_NewTaskCreateButtonView.centerXAnchor.constraint(equalTo: g_NewTaskTextInputHolderView.centerXAnchor).isActive = true
        g_NewTaskCreateButtonView.heightAnchor.constraint(equalTo: m_View.heightAnchor, multiplier: 0.5, constant: -4).isActive = true
        g_NewTaskCreateButtonView.widthAnchor.constraint(equalTo: g_NewTaskTextInputHolderView.widthAnchor).isActive = true
        
        return m_View
    }()
    
    private lazy var g_NewTaskTextInputHolderView: UIView = {
        let m_View: UIView = UIView()
        m_View.translatesAutoresizingMaskIntoConstraints = false
        
        m_View.backgroundColor = .white
        m_View.layer.cornerRadius = 8
        
        m_View.addSubview(g_NewTaskTextInputView)
        g_NewTaskTextInputView.centerXAnchor.constraint(equalTo: m_View.centerXAnchor).isActive = true
        g_NewTaskTextInputView.centerYAnchor.constraint(equalTo: m_View.centerYAnchor).isActive = true
        g_NewTaskTextInputView.widthAnchor.constraint(equalTo: m_View.widthAnchor, constant: -16).isActive = true
        g_NewTaskTextInputView.heightAnchor.constraint(equalTo: m_View.heightAnchor).isActive = true
        
        return m_View
    }()
    
    private lazy var g_NewTaskTextInputView: UITextField = {
        let m_View: UITextField = UITextField()
        m_View.translatesAutoresizingMaskIntoConstraints = false
        
        m_View.backgroundColor = .clear
        m_View.textAlignment = .natural
        m_View.textColor = UIColor(red: 50 / 255, green: 55 / 255, blue: 59 / 255, alpha: 1.0)
        
        return m_View
    }()
    
    private lazy var g_NewTaskCreateButtonView: UIView = {
        let m_View: UIView = UIView()
        m_View.translatesAutoresizingMaskIntoConstraints = false
        
        m_View.layer.cornerRadius = 8
        m_View.backgroundColor = UIColor(red: 73 / 255, green: 132 / 255, blue: 103 / 255, alpha: 1.0)
        m_View.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(createTaskButtonTap)))
        
        m_View.addSubview(g_NewTaskCreateButtonTextView)
        g_NewTaskCreateButtonTextView.widthAnchor.constraint(equalTo: m_View.widthAnchor, constant: -16).isActive = true
        g_NewTaskCreateButtonTextView.heightAnchor.constraint(equalTo: m_View.heightAnchor).isActive = true
        g_NewTaskCreateButtonTextView.centerXAnchor.constraint(equalTo: m_View.centerXAnchor).isActive = true
        g_NewTaskCreateButtonTextView.centerYAnchor.constraint(equalTo: m_View.centerYAnchor).isActive = true
        
        return m_View
    }()
    
    private lazy var g_NewTaskCreateButtonTextView: UILabel = {
        let m_View: UILabel = UILabel()
        m_View.translatesAutoresizingMaskIntoConstraints = false
        
        m_View.backgroundColor = .clear
        m_View.textAlignment = .center
        m_View.textColor = .white
        m_View.text = "Create".localizedString(key: "TDL_CREATE_BUTTON_TEXT")
        
        return m_View
    }()
}

//---- MARK: Extension
//---- MARK: Table View Extensions
extension TDLMainViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        TDLTaskManager.shared.getTaskList().count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TDLConstants.CellIdentifiers.UI_TASK_TABLE_CELL_IDENTIFIER, for: indexPath) as! TDLTaskTableViewCell
        let task = TDLTaskManager.shared.getTaskList()[indexPath.row]
        cell.setTitleText(title: task.getTaskTitle())
        cell.setIndex(indexPath.row)
        cell.delegate = self
        return cell
    }
}

extension TDLMainViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
}

extension TDLMainViewController: TDLTaskTableViewCellButtonDelegate {
    public func completeButtonTap(index: Int) {
        TDLTaskManager.shared.completeTask(index: index)
        g_TaskTableView.reloadData()
    }
}
