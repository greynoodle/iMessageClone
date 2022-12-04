//
//  ChannelEditorView.swift
//  iMessageClone
//
//  Created by Yusif Tijani on 11/18/22.
//

import SwiftUI

struct ChannelEditorView: View {
    @EnvironmentObject var chatHelper: ChatHelper
    @EnvironmentObject var channelData: ChannelData
    @Environment(\.dismiss) private var dismiss
    
    @State private var channelCopy = Channel()
    @State private var typingMessage = ""
    @State private var showingAlert = false
    
    @State var selectedTab: Tabs = .info
    
    @Binding var channel: Channel
    
    var body: some View {
        VStack {
            ZStack {
                Color(UIColor.secondarySystemBackground)
                    .ignoresSafeArea()
                
                HStack {
                    Spacer()
                    
                    Text("New Message")
                        .bold()
                    
                    Spacer()
                    
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
                .padding(.horizontal, 25)
            }
            .frame(height: 70)
            
            HStack {
                Text("To: ")
                    .bold()
                    .foregroundColor(.secondary)
                
                HStack(spacing: 0) {
                    TextField("New Channel", text: $channel.channelName)
                        .font(.title2)
                    
                    Button {
//                        channelCopy.channelName = channel.channelName
//                        channelCopy.lastMessage = channel.lastMessage
//                        channelData.channels.append(channelCopy)
//                        dismiss()
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.blue)
                            .padding(5)
                            .background(Color(UIColor.secondarySystemBackground))
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal, 10)
            
            Divider()
            
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
                                showingAlert.toggle()
                            } label: {
                                Image(systemName: "arrow.up.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.blue)
                                    .font(.body.weight(.semibold))
                            }
                            .alert("This functionality is not implemented", isPresented: $showingAlert) {
                                Button("OK", role: .cancel) {}
                            }
                        } else {
                            Image(systemName: "arrow.up.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color(UIColor.secondarySystemBackground))
                                .font(.body.weight(.semibold))
                        }
                    }
                }
                .padding(6)
                .overlay(Capsule()
                    .stroke(.tertiary, lineWidth: 1)
                    .opacity(0.7)
                )
                .padding(.trailing, 8)
            }
        }
        .onAppear {
            channelCopy = channel
        }
        .padding(.horizontal, 10)
    }
}

struct ChannelEditor_Previews: PreviewProvider {
    static var previews: some View {
        ChannelEditorView(channel: .constant(Channel()))
            .environmentObject(ChannelData())
            .environmentObject(ChatHelper())
    }
}
