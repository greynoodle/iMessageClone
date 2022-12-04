//
//  iMessageCloneApp.swift
//  iMessageClone
//
//  Created by Yusif Tijani on 11/8/22.
//

import SwiftUI

@main
struct iMessageCloneApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ChannelData())
                .environmentObject(ChatHelper())
        }
    }
}
