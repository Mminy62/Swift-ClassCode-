//
//  FirebaseDemoApp.swift
//  FirebaseDemo
//
//  Created by 박준영 on 1/4/24.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct FirebaseDemoApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
//            FireStoreView()
//            QueryView()
//            StorageView()
            AuthView()
        }
    }
}
