//
//  LoginRouter.swift
//  Pampers_Rewards
//
//  Created by thinksysuser on 2/20/18.
//  Copyright © 2018 thinksysuser. All rights reserved.
//

import RIBs

protocol LoginInteractable: Interactable {
    weak var router: LoginRouting? { get set }
    weak var listener: LoginListener? { get set }
}

protocol LoginViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    //func dismiss(viewController: ViewControllable)
}

final class LoginRouter: ViewableRouter<LoginInteractable, LoginViewControllable>, LoginRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: LoginInteractable, viewController: LoginViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
