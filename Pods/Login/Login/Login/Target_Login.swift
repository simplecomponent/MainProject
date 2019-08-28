//
//  Target_Login.swift
//  Login
//
//  Created by Mr.Zhu on 2019/8/10.
//  Copyright © 2019 Mr.Zhu. All rights reserved.
//

import UIKit

@objc class Target_Login: NSObject {
    @objc func Action_goLoginVC(_ params:[AnyHashable:Any]?)->UIViewController?{
        let loginVC = LoginViewController()
        if var actionParams = params{
            loginVC.callback = actionParams["login_callback"] as? (([String:Any]) -> Void)
            print("获取到LoginViewController")
        }
        return loginVC
    }
}
