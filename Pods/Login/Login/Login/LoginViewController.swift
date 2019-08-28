//
//  LoginViewController.swift
//  Login
//
//  Created by Mr.Zhu on 2019/8/10.
//  Copyright © 2019 Mr.Zhu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(accountTextField)
        view.addSubview(passTextField)
        view.addSubview(loginButton)
        title = "登录"
        view.backgroundColor = .white
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        accountTextField.frame = CGRect(x: 50, y: 200, width: 275, height: 50)
        passTextField.frame = CGRect(x: 50, y: 300, width: 275, height: 50)
        loginButton.frame = CGRect(x: 50, y: 400, width: 275, height: 50)
    }
    //MARK: Events
    @objc func login(){
        var message = ""
        let alertVC = UIAlertController(title: "系统提示:", message: message, preferredStyle: .alert)
        let action:UIAlertAction = UIAlertAction(title: "确定", style: .default) { [weak self] (action) in
            guard let weakSelf = self else { return }
            if message == "登录成功"{
                weakSelf.callback?(["status":"success","message":message])
                weakSelf.navigationController?.popViewController(animated: true)
            }
        }
        alertVC.addAction(action)
        if accountTextField.text == ""{
            message = "请输入账号"
            alertVC.message = message
            callback?(["status":"failed","message":message])
            present(alertVC, animated: true, completion: nil)
            
            return
        }
        if passTextField.text == ""{
            message = "请输入密码"
            callback?(["status":"failed","message":message])
            alertVC.message = message
            present(alertVC, animated: true, completion: nil)
            return
        }
        if accountTextField.text == "zx123" && passTextField.text == "123456"{
            message = "登录成功"
            alertVC.message = message
            present(alertVC, animated: true, completion: nil)
        }else{
            message = "登录失败:账号密码错误"
            callback?(["status":"failed","message":message])
            alertVC.message = message
            present(alertVC, animated: true, completion: nil)
        }
        
    }
    //登录回调（给其他模块返回数据（token））
    var callback:(([String:Any])->Void)?
    
    deinit {
        print("Login deinit")
    }
    
    //Getter Setter
    private lazy var accountTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "请输入账号"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var passTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "请输入密码"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var loginButton:UIButton = {
        let button = UIButton()
        button.setTitle("登录", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(UIColor.white.withAlphaComponent(0.42), for: .highlighted)
        button.backgroundColor = .red
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        return button
    }()
}

