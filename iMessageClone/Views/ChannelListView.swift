//
//  ChannelListView.swift
//  iMessageClone
//
//  Created by Yusif Tijani on 11/8/22.
//

import SwiftUI

struct ChannelListView: View {
    @EnvironmentObject var chatHelper: ChatHelper
    @EnvironmentObject var channelData: ChannelData
    
    @State private var isAddingNewChannel = false
    @State private var searchText: String = ""
    @State private var showingAlert = false
    @State private var showingSheet = false
    @State private var typingMessage = ""
    @State private var selectedTab: Tabs = .info
    
    @State var channel: Channel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(channelData.sortedChannels()) { $channel in
                    ZStack {
                        NavigationLink(destination: ChatView(channel: channel, selectedTab: $selectedTab), label: {})
                            .buttonStyle(PlainButtonStyle())
                            .opacity(0)
                        ChannelListRowView(channel: $channel)
                    }
                }
                .swipeActions(edge: .leading, allowsFullSwipe: false) {
                    Button {
                        // TBD
                    } label: {
                        Image(systemName: "pin.fill")
                    }
                    .tint(.yellow)
                }
                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                    Button(role: .destructive) {
                        channelData.delete(channel)
                    } label: {
                        Image(systemName: "trash.fill")
                    }
                    
                    Button {
                        channel.isMuted.toggle()
                    } label: {
                        if channel.isMuted {
                            Image(systemName: "bell.slash.fill")
                        } else {
                            Image(systemName: "bell.fill")
                        }
                    }
                    .tint(Color(UIColor.systemPurple))
                }
            }
            .listStyle(.plain)
            .navigationTitle("Messages")
            .navigationBarBackButtonHidden(true)
            .searchable(text: $searchText, prompt: "Search")
            .sheet(isPresented: $showingSheet) {
                ChannelEditorView(channel: $channel)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        showingAlert.toggle()
                    } label: {
                        Text("Edit")
                    }
                    .alert("This functionality is not implemented", isPresented: $showingAlert) {
                        Button("Ok", role: .cancel) {}
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
//                        newChannel = Channel()
//                        isAddingNewChannel = true
                        showingSheet = true
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
        }
    }
}

struct ChannelListView_Previews: PreviewProvider {
    static var previews: some View {
        ChannelListView(channel: Channel())
            .environmentObject(ChannelData())
            .environmentObject(ChatHelper())
    }
}
