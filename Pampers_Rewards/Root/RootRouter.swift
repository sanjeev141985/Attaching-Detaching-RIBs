//
//  RootRouter.swift
//  Pampers_Rewards
//
//  Created by thinksysuser on 2/19/18.
//  Copyright © 2018 thinksysuser. All rights reserved.
//

import RIBs

protocol RootInteractable: Interactable, LoginListener {
    weak var router: RootRouting? { get set }
    weak var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    
    func present(viewController: ViewControllable)
    func dismiss(viewController: ViewControllable)
}

//final class RootRouter: ViewableRouter<RootInteractable, RootViewControllable>, RootRouting {
//
//    // TODO: Constructor inject child builder protocols to allow building children.
//    override init(interactor: RootInteractable, viewController: RootViewControllable) {
//        super.init(interactor: interactor, viewController: viewController)
//        interactor.router = self
//    }
//}


final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {

    private let loginBuilder: LoginBuildable
    private var login: ViewableRouting?
    
    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: RootInteractable, viewController: RootViewControllable, loginBuilder: LoginBuildable) {
        self.loginBuilder = loginBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func routeToLogin() {
        self.login = loginBuilder.build(withListener: interactor)
        attachChild(self.login!)
        viewController.present(viewController: (self.login?.viewControllable)!)
    }
    
    func removeLogin() {
        if let login = self.login{
            detachChild(login)
            viewController.dismiss(viewController: (self.login?.viewControllable)!)
        }
    }
    
}
