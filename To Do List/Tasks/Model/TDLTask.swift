//
//  TDLTask.swift
//  To Do List
//
//  Created by Nilupul Sandeepa on 2024-09-07.
//

import Foundation

public class TDLTask: Codable {
    private var g_TaskTitle: String = ""
    private var g_IsCompleted: Bool = false
    
    //---- MARK: Initializer
    public init() {
        
    }
    
    public init(taskTitle: String) {
        g_TaskTitle = taskTitle
        g_IsCompleted = false
    }
    
    //---- MARK: Action Methods
    public func getTaskTitle() -> String {
        return g_TaskTitle
    }
    
    public func setTaskTitle(_ title: String) -> Void {
        g_TaskTitle = title
    }
    
    public func isCompleted() -> Bool {
        return g_IsCompleted
    }
    
    public func setIsCompleted(_ isCompleted: Bool) -> Void {
        g_IsCompleted = isCompleted
    }
}
