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
                NCMB.initialize(applicationKey: "9170ffcb91da1bbe0eff808a967e12ce081ae9e3262ad3e5c3cac0d9e54ad941", clientKey: "9e5014cd2d76a73b4596deffdc6ec4028cfc1373529325f8e71b7a6ed553157d")
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
