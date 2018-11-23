//
//  Action.swift
//  favorite-moviesTests
//
//  Created by Stant 02 on 19/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import Foundation

struct Action {
    let block: () -> ()
    
    func call() {
        block()
    }
}

func execute(action: Action, _ setup: () -> () ) {
    setup()
    action.block()
}
