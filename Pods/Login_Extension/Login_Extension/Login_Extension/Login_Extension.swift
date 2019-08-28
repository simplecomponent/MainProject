//
//  Login_Extension.swift
//  Login_Extension
//
//  Created by Mr.Zhu on 2019/8/10.
//  Copyright © 2019 Mr.Zhu. All rights reserved.
//

import CTMediator
public extension CTMediator{
    @objc func getLoginModule(_ callBack:(([String:Any])->Void)?)->UIViewController?{
        let params:[AnyHashable:Any] = ["login_callback":callBack ?? (([String:Any])->Void).self ,kCTMediatorParamsKeySwiftTargetModuleName:"Login"]
        if let target = performTarget("Login", action: "goLoginVC", params: params, shouldCacheTarget: false) as? UIViewController{
            return target
        }
        return nil
    }
}
