//
//  ViewController.swift
//  MainProject
//
//  Created by Mr.Zhu on 2019/8/9.
//  Copyright © 2019 Mr.Zhu. All rights reserved.
//

import UIKit
import HomePage_Extension
import native_wallet_extension

class ViewController: UIViewController {
    //MARK: Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        view.addSubview(button2)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        button.frame = CGRect(origin: CGPoint(x: 100, y: 100), size: CGSize(width: 100, height: 80))
        button2.frame = CGRect(origin: CGPoint(x: 100, y: 300), size: CGSize(width: 100, height: 80))
    }
    
    //MARK: events
    @objc func buttonOnClick(){
        let param:[AnyHashable:Any] = ["text":"本地调用"]
        if let controller = CTMediator.sharedInstance()?.showHomePage(params: param, clouser: { (result) in
            print(result)
        }){
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    @objc func button2OnClick(){
        let param:[AnyHashable:Any] = ["id":"4"]
        if let controller = CTMediator.sharedInstance()?.getWalletController(params: param, clouser: { (result) in
            print(result)
        }){
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    //MARK: getter setter
    private lazy var button:UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(buttonOnClick), for: .touchUpInside)
        button.setTitle("jump", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        return button
    }()
    
    private lazy var button2:UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(button2OnClick), for: .touchUpInside)
        button.setTitle("钱包", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        return button
    }()
    
}
