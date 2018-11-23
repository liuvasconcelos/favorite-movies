//
//  BaseCallback.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 15/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

public class BaseCallback<T> {
    private let status: String
    private var responseSuccess: T?
    private var error: Any?
    
    public class func success(_ response: T) -> BaseCallback {
        return BaseCallback(status: CallbackEnum.success.rawValue, responseSuccess: response)
    }
    
    public class func failed(error: Any? = nil) -> BaseCallback {
        return BaseCallback(status: CallbackEnum.failed.rawValue, error: error)
    }
    
    public class func emptyData() -> BaseCallback {
        return BaseCallback(status: CallbackEnum.onEmptyData.rawValue)
    }
    
    public class func action(_ action: T) -> BaseCallback {
        return BaseCallback(status: CallbackEnum.onAction.rawValue, responseSuccess: action)
    }
    
    private init(status: String, error: Any? = nil) {
        self.status = status
        self.error  = error
    }
    
    private init(status: String, responseSuccess: T) {
        self.status          = status
        self.responseSuccess = responseSuccess
    }
    
    public func onSuccess(_ response: (T) -> Void) {
        if status == CallbackEnum.success.rawValue {
            response(responseSuccess!)
        }
    }
    
    public func onAction(_ action: (T) -> Void) {
        if status == CallbackEnum.onAction.rawValue {
            action(responseSuccess!)
        }
    }
    
    public func onFailed(_ response: (Any?) -> Void) {
        if status == CallbackEnum.failed.rawValue {
            response(error)
        }
    }
    
    public func onEmptyData(_ response: () -> Void){
        if status == CallbackEnum.onEmptyData.rawValue {
            response()
        }
    }
    
}
