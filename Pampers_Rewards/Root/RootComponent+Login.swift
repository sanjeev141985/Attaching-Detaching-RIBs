//
//  RootComponent+Login.swift
//  Pampers_Rewards
//
//  Created by thinksysuser on 2/26/18.
//  Copyright © 2018 thinksysuser. All rights reserved.
//

import RIBs

/// The dependencies needed from the parent scope of Root to provide for the Login scope.
// TODO: Update RootDependency protocol to inherit this protocol.
protocol RootDependencyLogin: Dependency {
    // TODO: Declare dependencies needed from the parent scope of Root to provide dependencies
    // for the Login scope.
}

extension RootComponent: LoginDependency {

    // TODO: Implement properties to provide for Login scope.
}
