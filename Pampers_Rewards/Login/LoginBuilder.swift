//
//  LoginBuilder.swift
//  Pampers_Rewards
//
//  Created by thinksysuser on 2/20/18.
//  Copyright © 2018 thinksysuser. All rights reserved.
//

import RIBs

protocol LoginDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class LoginComponent: Component<LoginDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol LoginBuildable: Buildable {
    func build(withListener listener: LoginListener) -> LoginRouting
}

final class LoginBuilder: Builder<LoginDependency>, LoginBuildable {

    override init(dependency: LoginDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: LoginListener) -> LoginRouting {
        let component = LoginComponent(dependency: dependency)
        let viewController = LoginViewController()
        let interactor = LoginInteractor(presenter: viewController)
        interactor.listener = listener
        return LoginRouter(interactor: interactor, viewController: viewController)
    }
}
