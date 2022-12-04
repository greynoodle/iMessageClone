//
//  ChatView.swift
//  iMessageClone
//
//  Created by Yusif Tijani on 11/29/22.
//

import SwiftUI

enum Tabs: Int {
    case call = 0
    case mail = 1
    case info = 2
}

struct ChatView: View {
    @StateObject var channelData = ChannelData()
    @EnvironmentObject var chatHelper: ChatHelper
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var showingAlert = false
    @State private var showingSheet = false
    
    @State var channel: Channel
    @State var typingMessage = ""
    
    @Binding var selectedTab: Tabs
    
    var body: some View {
        VStack {
            ZStack {
                Color(UIColor.secondarySystemBackground)
                    .ignoresSafeArea()
                
                Spacer()
                
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15)
                            .foregroundColor(.blue)
                    }
                    
                    Spacer()
                    
                    Button {
                        showingSheet = true
                    } label: {
                        VStack {
                            channel.avatar
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .foregroundColor(.gray)
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                            
                            Text(channel.channelName)
                                .font(.headline)
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .lineLimit(1)
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        showingAlert.toggle()
                    } label: {
                        Image(systemName: "video")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30)
                            .foregroundColor(.blue)
                    }
                    .alert("This functionality is not implemented", isPresented: $showingAlert) {
                        Button("OK", role: .cancel) {}
                    }
                }
                .padding(.horizontal, 10)
            }
            .frame(height: 100)
            
            Spacer()
            
            TypedMessageView(channel: channel)
                .padding(.horizontal, 10)
            
            Spacer()
            
            HStack(spacing: 10) {
                Button {
                    showingAlert.toggle()
                } label: {
                    Image(systemName: "camera.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .foregroundColor(.gray)
                }
                .alert("This functionality is not implemented", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) {}
                }
                
                Button {
                    showingAlert.toggle()
                } label: {
                    Image("store")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45)
                }
                .alert("This functionality is not implemented", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) {}
                }
                
                HStack {
                    TextField("iMessage", text: $typingMessage)
                    
                    Button {
                        showingAlert.toggle()
                    } label: {
                        if !typingMessage.isEmpty {
                            Button {
                                sendMessage()
                                typingMessage = ""
                                channel.sendButtonTapped = true
                            } label: {
                                Image(systemName: "arrow.up.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.blue)
                                    .font(.body.weight(.semibold))
                            }
                        } else {
                            Image(systemName: "waveform")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25)
                                .foregroundColor(.gray)
                        }
                    }
                    .alert("This functionality is not implemented", isPresented: $showingAlert) {
                        Button("OK", role: .cancel) {}
                    }
                }
                .padding(6)
                .overlay(Capsule()
                    .stroke(.tertiary, lineWidth: 1)
                    .opacity(0.7)
                )
                .padding(.trailing, 8)
            }
            .padding(.horizontal, 10)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .sheet(isPresented: $showingSheet) {
            ChannelInfoView(channel: channel, selectedTab: $selectedTab)
        }
    }
    
    func sendMessage() {
        chatHelper.sendMessage(Message(content: typingMessage))
        self.channel.lastMessage = chatHelper.messages.last?.content ?? "No Messages"
    }
}

struct ChatView_Previews: PreviewProvider {
    static var channelData = ChannelData()

    static var previews: some View {
        ChatView(channel: channelData.channels[0], selectedTab: .constant(.info))
            .environmentObject(ChatHelper())
    }
}
