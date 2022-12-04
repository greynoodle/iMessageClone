//
//  MessageView.swift
//  iMessageClone
//
//  Created by Yusif Tijani on 11/14/22.
//

import SwiftUI
import Combine

struct MessageView: View {
    @State var channel: Channel
    @State var currentMessage: Message
    
    var body: some View {
        HStack {
            if channel.isCurrentUser {
                if channel.sendButtonTapped {
                    Spacer()
                    
                    ContentMessageView(contentMessage: currentMessage.content, isCurrentUser: channel.isCurrentUser, isFirst: true)
                } else {
                    ContentMessageView(contentMessage: currentMessage.content, isCurrentUser: false, isFirst: true)
                    
                    Spacer()
                }
            } else {
                if !channel.sendButtonTapped {
                    ContentMessageView(contentMessage: currentMessage.content, isCurrentUser: false, isFirst: true)
                    
                    Spacer()
                } else {
                    Spacer()
                    
                    ContentMessageView(contentMessage: currentMessage.content, isCurrentUser: channel.isCurrentUser, isFirst: true)
                }
            }
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var channelData = ChannelData()
    
    static var previews: some View {
        MessageView(channel: channelData.channels[0], currentMessage: Message(content: "Hi there hw r u 😊"))
    }
}
