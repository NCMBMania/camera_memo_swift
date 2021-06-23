//
//  cameraApp.swift
//  camera
//
//  Created by Atsushi on 2021/06/22.
//

import SwiftUI
import NCMB

@main
struct cameraApp: App {
    @Environment(\.scenePhase) private var scenePhase // 追加
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) { scene in
            switch scene {
            case .active:
                NCMB.initialize(applicationKey: "YOUR_APPLICATION_KEY", clientKey: "YOUR_CLIENT_KEY")
            case .background:
                print("background")
            case .inactive:
                print("inactive")
            @unknown default:
                print("default")
            }
        }
    }
}
