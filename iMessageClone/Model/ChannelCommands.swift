//
//  ChannelCommands.swift
//  iMessageClone
//
//  Created by Yusif Tijani on 11/26/22.
//

import Foundation
import SwiftUI

struct ChannelCommands: Commands {
    @FocusedBinding(\.selectedChannel) var selectedChannel
    
    var body: some Commands {
        SidebarCommands()
        
        CommandMenu("Channels") {
            Button("\(selectedChannel?.isMuted == true ? "Remove" : "Mark") as Muted") {
                selectedChannel?.isMuted.toggle()
            }
            .keyboardShortcut("k", modifiers: [.shift, .option])
            .disabled(selectedChannel == nil)
        }
    }
}

private struct SelectedChannelKey: FocusedValueKey {
    typealias Value = Binding<Channel>
}

extension FocusedValues {
    var selectedChannel: Binding<Channel>? {
        get { self[SelectedChannelKey.self] }
        set { self[SelectedChannelKey.self] = newValue }
    }
}
