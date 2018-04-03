//
//  RootViewController.swift
//  Pampers_Rewards
//
//  Created by thinksysuser on 2/19/18.
//  Copyright © 2018 thinksysuser. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol RootPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    
    func btnLoginTapped()
    
}

final class RootViewController: UIViewController, RootPresentable, RootViewControllable {
    
    weak var listener: RootPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.green
        
        
        let button = UIButton(type: UIButtonType.system) as UIButton
        
        let xPostion:CGFloat = UIScreen.main.bounds.size.width/2 - 75
        let yPostion:CGFloat = 100
        let buttonWidth:CGFloat = 150
        let buttonHeight:CGFloat = 45
        
        button.frame = CGRect(x:xPostion, y:yPostion, width:buttonWidth, height:buttonHeight)
        
        button.backgroundColor = UIColor.magenta
        button.setTitle("Attach RIB", for: UIControlState.normal)
        button.tintColor = UIColor.black
        button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        
        self.view.addSubview(button)
    }
    
    @objc func buttonAction(_ sender:UIButton!)
    {
        print("Button tapped")
        listener?.btnLoginTapped()
    }
    
    func present(viewController: ViewControllable) {
        present(viewController.uiviewController, animated: true, completion: nil)
    }
    
    func dismiss(viewController: ViewControllable) {
        dismiss(animated: true, completion: nil)
    }
    
}
