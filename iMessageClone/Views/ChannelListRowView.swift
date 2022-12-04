//
//  ChannelListRowView.swift
//  iMessageClone
//
//  Created by Yusif Tijani on 11/8/22.
//

import SwiftUI

struct ChannelListRowView: View {
    @Binding var channel: Channel
    
    var body: some View {
        HStack {
            channel.avatar
                .resizable()
                .aspectRatio(contentMode: .fill)
                .foregroundColor(.gray)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text(channel.channelName)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .lineLimit(1)
                    
                    Spacer()
                    
                    HStack {
                        Text(channel.lastMessageStamp)
                            .foregroundColor(.secondary)
                            .font(.subheadline)
                        
                        Image(systemName: "chevron.right")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.secondary)
                            .frame(width: 7)
                    }
                }
                
                HStack(alignment: .top, spacing: 4) {
                    Text(channel.lastMessage)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(2)
                        .frame(maxWidth: .infinity, minHeight: 40, alignment: .topLeading)
                    
                    if channel.isMuted {
                        Image(systemName: "bell.slash.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.secondary)
                            .frame(width: 12)
                            .padding(.top, 4)
                    }
                }
            }
        }
    }
}

struct ChannelListRowView_Previews: PreviewProvider {
    static var channelData = ChannelData()
    
    static var previews: some View {
        ChannelListRowView(channel: .constant(channelData.channels[0]))
    }
}
