//
//  LoginViewController.swift
//  Pampers_Rewards
//
//  Created by thinksysuser on 2/20/18.
//  Copyright © 2018 thinksysuser. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol LoginPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func dismissBtnPressed()
    
}

final class LoginViewController: UIViewController, LoginPresentable, LoginViewControllable {

    weak var listener: LoginPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.magenta
        
        let button = UIButton(type: UIButtonType.system) as UIButton
        
        let xPostion:CGFloat = UIScreen.main.bounds.size.width/2 - 75
        let yPostion:CGFloat = 100
        let buttonWidth:CGFloat = 150
        let buttonHeight:CGFloat = 45
        button.frame = CGRect(x:xPostion, y:yPostion, width:buttonWidth, height:buttonHeight)
        button.backgroundColor = UIColor.green
        button.setTitle("Detach RIB", for: UIControlState.normal)
        button.tintColor = UIColor.black
        button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        
        self.view.addSubview(button)
    }
    
    @objc func buttonAction(_ sender:UIButton!)
    {
        print("Button tapped")
        listener?.dismissBtnPressed()
    }
    
    func present(viewController: ViewControllable) {
        present(viewController.uiviewController, animated: true, completion: nil)
    }
    
    
}
