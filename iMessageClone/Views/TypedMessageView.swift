//
//  TypedMessageView.swift
//  iMessageClone
//
//  Created by Yusif Tijani on 11/16/22.
//

import SwiftUI
import Combine

struct TypedMessageView: View {
    @EnvironmentObject var chatHelper: ChatHelper
    var channel: Channel

    var body: some View {
        VStack {
            ScrollView {
                ForEach(chatHelper.messages, id: \.self) { message in
                    MessageView(channel: channel, currentMessage: message)
                }
            }
        }
    }
}

struct TypedMessageView_Previews: PreviewProvider {
    static var channelData = ChannelData()
    
    static var previews: some View {
        TypedMessageView(channel: channelData.channels[0])
            .environmentObject(ChatHelper())
    }
}
