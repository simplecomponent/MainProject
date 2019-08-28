//
//  ViewController.swift
//  MainProject
//
//  Created by Mr.Zhu on 2019/8/9.
//  Copyright © 2019 Mr.Zhu. All rights reserved.
//

import UIKit
import Login
import Login_Extension

class ViewController: UIViewController {
    //MARK: Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        button.frame = CGRect(origin: CGPoint(x: 100, y: 100), size: CGSize(width: 100, height: 80))
    }
    
    //MARK: events
    @objc func buttonOnClick(){
        let param:[AnyHashable:Any] = ["text":"本地调用"]
        if let controller = CTMediator.sharedInstance()?.getLoginModule({ (result) in
            
            
        }){
            navigationController?.pushViewController(controller, animated: true)
        }

    }
    
    
    
    //MARK: getter setter
    private lazy var button:UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(buttonOnClick), for: .touchUpInside)
        button.setTitle("登录", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        return button
    }()
    
    
    
}
