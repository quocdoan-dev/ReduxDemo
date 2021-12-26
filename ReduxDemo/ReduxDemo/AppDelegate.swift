//
//  AppDelegate.swift
//  ReduxDemo
//
//  Created by Quoc Doan M. VN.DaNang on 12/23/21.
//

import UIKit
import ReSwift
import ReSwiftThunk

let thunkMiddleware: Middleware<AppState> = createThunkMiddleware()
var mainStore = Store<AppState>(reducer: Reducers.appReducer(action:state:),
                                state: AppState(),
                                middleware: [thunkMiddleware])

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
}
