//
//  LoginInteractor.swift
//  Pampers_Rewards
//
//  Created by thinksysuser on 2/20/18.
//  Copyright © 2018 thinksysuser. All rights reserved.
//

import RIBs
import RxSwift

protocol LoginRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol LoginPresentable: Presentable {
    weak var listener: LoginPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol LoginListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
    func loginTaskComplete()
}

final class LoginInteractor: PresentableInteractor<LoginPresentable>, LoginInteractable, LoginPresentableListener {
    
    weak var router: LoginRouting?
    weak var listener: LoginListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: LoginPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    func dismissBtnPressed() {
        listener?.loginTaskComplete()
    }
    
    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
