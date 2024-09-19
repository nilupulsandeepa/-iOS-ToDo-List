//
//  TDLTaskManager.swift
//  To Do List
//
//  Created by Nilupul Sandeepa on 2024-09-07.
//

import UIKit

public class TDLTaskManager {
    
    //---- MARK: Properties
    public static var shared: TDLTaskManager = TDLTaskManager()
    private var g_TaskList: [TDLTask] = []
    
    //---- MARK: Constructor
    private init() {
        loadTaskList()
    }
    
    //---- MARK: Action Methods
    public func create(taskTitle: String) -> Void {
        let m_NewTask: TDLTask = TDLTask(taskTitle: taskTitle)
        g_TaskList.append(m_NewTask)
        saveTaskList()
    }
    
    public func completeTask(index: Int) -> Void{
        g_TaskList.remove(at: index)
        saveTaskList()
    }
    
    public func getTaskList() -> [TDLTask] {
        return g_TaskList
    }
    
    //---- MARK: Helper Methods
    private func saveTaskList() -> Void {
        do {
            let m_TaskListData: Data = try JSONEncoder().encode(g_TaskList)
            UserDefaults.standard.setValue(m_TaskListData, forKey: TDLConstants.UserDefaults.USER_DEFAULT_TASK_LIST_ID)
        } catch { }
    }
    
    private func loadTaskList() -> Void {
        g_TaskList = []
        if let m_TaskListData: Data = UserDefaults.standard.data(forKey: TDLConstants.UserDefaults.USER_DEFAULT_TASK_LIST_ID) {
            do {
                g_TaskList = try JSONDecoder().decode([TDLTask].self, from: m_TaskListData)
            } catch { }
        }
    }
}
