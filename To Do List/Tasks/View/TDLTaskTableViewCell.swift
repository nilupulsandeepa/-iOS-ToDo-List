//
//  TDLTaskTableViewCell.swift
//  To Do List
//
//  Created by Nilupul Sandeepa on 2024-09-07.
//

import UIKit

public class TDLTaskTableViewCell: UITableViewCell {
    
    //---- MARK: Properties
    private var g_CellIndex: Int = 0
    public var delegate: TDLTaskTableViewCellButtonDelegate?
    
    //---- MARK: Constructor
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //---- MARK: Helper Methods
    private func configureUI() -> Void {
        contentView.backgroundColor = .clear
        
        contentView.addSubview(g_BackgroundView)
        g_BackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        g_BackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        g_BackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        g_BackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    //---- MARK: Action Methods
    public func setTitleText(title: String) -> Void {
        g_TaskTitleView.text = title
    }
    
    public func setIndex(_ index: Int) -> Void {
        g_CellIndex = index
    }
    
    @objc func onCompleteButtonTap() {
        if (delegate != nil) {
            delegate!.completeButtonTap(index: g_CellIndex)
        }
    }
    
    //---- MARK: UI Components
    private lazy var g_BackgroundView: UIView = {
        let m_View: UIView = UIView()
        m_View.translatesAutoresizingMaskIntoConstraints = false
        
        m_View.layer.cornerRadius = 8
        m_View.backgroundColor = UIColor(red: 247 / 255, green: 241 / 255, blue: 220 / 255, alpha: 1)
        
        m_View.addSubview(g_TaskTitleView)
        g_TaskTitleView.widthAnchor.constraint(equalTo: m_View.widthAnchor, multiplier: 0.6).isActive = true
        g_TaskTitleView.leadingAnchor.constraint(equalTo: m_View.leadingAnchor, constant: 16).isActive = true
        g_TaskTitleView.centerYAnchor.constraint(equalTo: m_View.centerYAnchor).isActive = true
        
        m_View.addSubview(g_CompleteButtonView)
        g_CompleteButtonView.widthAnchor.constraint(equalToConstant: 32).isActive = true
        g_CompleteButtonView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        g_CompleteButtonView.trailingAnchor.constraint(equalTo: m_View.trailingAnchor, constant: -16).isActive = true
        g_CompleteButtonView.centerYAnchor.constraint(equalTo: m_View.centerYAnchor).isActive = true
        
        
        return m_View
    }()
    
    private lazy var g_TaskTitleView: UILabel = {
        let m_View: UILabel = UILabel()
        m_View.translatesAutoresizingMaskIntoConstraints = false
        
        m_View.textColor = UIColor(red: 50 / 255, green: 55 / 255, blue: 59 / 255, alpha: 1.0)
        m_View.adjustsFontSizeToFitWidth = true
        m_View.minimumScaleFactor = 0.45
        
        return m_View
    }()
    
    private lazy var g_CompleteButtonView: UIView = {
        let m_View: UIView = UIView()
        m_View.translatesAutoresizingMaskIntoConstraints = false
        
        m_View.layer.cornerRadius = 8
        m_View.backgroundColor = UIColor(red: 73 / 255, green: 132 / 255, blue: 103 / 255, alpha: 1.0)
        
        m_View.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onCompleteButtonTap)))
        
        m_View.addSubview(g_CompleteButtonImageView)
        g_CompleteButtonImageView.leadingAnchor.constraint(equalTo: m_View.leadingAnchor, constant: 4).isActive = true
        g_CompleteButtonImageView.trailingAnchor.constraint(equalTo: m_View.trailingAnchor, constant: -4).isActive = true
        g_CompleteButtonImageView.centerYAnchor.constraint(equalTo: m_View.centerYAnchor).isActive = true
        
        return m_View
        
    }()
    
    private lazy var g_CompleteButtonImageView: UIImageView = {
        let m_View: UIImageView = UIImageView()
        m_View.translatesAutoresizingMaskIntoConstraints = false
        
        m_View.image = UIImage(systemName: "checkmark")?.withRenderingMode(.alwaysTemplate)
        m_View.tintColor = .white
        m_View.contentMode = .center
        
        return m_View
    }()
}


public protocol TDLTaskTableViewCellButtonDelegate {
    func completeButtonTap(index: Int)
}
