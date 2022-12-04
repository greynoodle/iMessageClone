//
//  PinnedChannelsView.swift
//  iMessageClone
//
//  Created by Yusif Tijani on 11/11/22.
//

import SwiftUI

struct PinnedChannelsView: View {
//    @ObservedObject var viewModel: ChannelListViewModel
//    var channel: Channel
    var avatar = Image(systemName: "person.circle.fill")
    
    let columnStructure = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columnStructure) {
//            ForEach(viewModel.pinnedChannels) { channel in
//                Button {
//                    // TBD
//                } label: {
//                    VStack {
//                        avatar
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .foregroundColor(.green)
//                            .frame(width: 50, height: 50)
//                            .clipShape(Circle())
//                        Text(channel.channelName)
//                            .font(.headline)
//                            .foregroundColor(.primary)
//                            .lineLimit(1)
//                    }
//                }
//
//                NavigationLink {
//                    ChatView(channel: channel)
//                } label: {
//                    EmptyView()
//                }
//            }
        }
    }
}

struct PinnedChannelsView_Previews: PreviewProvider {
    static var previews: some View {
        PinnedChannelsView()
    }
}
