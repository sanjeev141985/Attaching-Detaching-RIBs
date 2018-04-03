//
//  RootInteractor.swift
//  Pampers_Rewards
//
//  Created by thinksysuser on 2/19/18.
//  Copyright © 2018 thinksysuser. All rights reserved.
//

import RIBs
import RxSwift

protocol RootRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func routeToLogin()
    func removeLogin()
}

protocol RootPresentable: Presentable {
    weak var listener: RootPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol RootListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
    
}

final class RootInteractor: PresentableInteractor<RootPresentable>, RootInteractable, RootPresentableListener {
    func loginTaskComplete() {
        router?.removeLogin()
    }
    
    func btnLoginTapped() {
        router?.routeToLogin()
    }
    

    weak var router: RootRouting?
    weak var listener: RootListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: RootPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
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
