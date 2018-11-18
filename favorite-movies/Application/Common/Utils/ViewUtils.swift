//
//  ViewUtils.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 15/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import Foundation

class ViewUtils {
    
    static func loadNibNamed<T>(_ nibName: String, owner: Any?) -> T {
        return Bundle.main.loadNibNamed(nibName, owner: owner, options: nil)?[0] as! T
    }
}
