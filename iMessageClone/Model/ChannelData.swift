//
//  ChannelData.swift
//  iMessageClone
//
//  Created by Yusif Tijani on 11/18/22.
//

import Foundation
import SwiftUI

class ChannelData: ObservableObject {
    @Published var channels: [Channel] = [
        Channel(
            channelName: "+1 (888) 555-1212"
        ),
        Channel(
            channelName: "+1 (555) 564-8583"
        )
    ]
    
    func delete(_ channel: Channel) {
            channels.removeAll { $0.id == channel.id }
        }
    
    func sortedChannels() -> Binding<[Channel]> {
        Binding<[Channel]> (
            get: {
                self.channels
            }, set: { channels in
                for channel in channels {
                    if let index = self.channels.firstIndex(where: { $0.id == channel.id }) {
                        self.channels[index] = channel
                    }
                }
            }
        )
    }
    
}
