//
//  CardGameApp.swift
//  CardGame
//
//  Created by SangWon Park on 11/23/21.
//

import SwiftUI
import Parse

@main
struct CardGameApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
    
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        let parseConfig = ParseClientConfiguration {
            $0.applicationId = "hxTZiAEVL2EWRr82RxGHfcLKXYgcYgsYay1HvtaY"
            $0.clientKey = "CSibE4zZi854KYOZMC029pwEJUdo2yWqvRdnLWLN"
            $0.server = "https://parseapi.back4app.com"
        }
        
        Parse.initialize(with: parseConfig)
        
    return true
    }
}



    
