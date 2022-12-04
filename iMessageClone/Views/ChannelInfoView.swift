//
//  ChannelInfoView.swift
//  iMessageClone
//
//  Created by Yusif Tijani on 11/23/22.
//

import SwiftUI

struct ChannelInfoView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) private var dismiss
    @State private var showingAlert = false
    @State private var hideAlerts = false
    @State private var sendReadReceipts = false
    
    @State var channel: Channel
    
    @Binding var selectedTab: Tabs

    var body: some View {
        ZStack {
            Color(UIColor.secondarySystemBackground)
            
            VStack(spacing: 10) {
                HStack {
                    Spacer()
                    
                    Button {
                        dismiss()
                    } label: {
                        Text("Done")
                    }
                    .padding(.horizontal, 25)
                }
                .padding(.top, 20)
                .padding(.bottom, 20)
                
                VStack {
                    channel.avatar
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 90, height: 90)
                        .foregroundColor(.gray)
                        .clipShape(Circle())
                    
                    Text(channel.channelName)
                        .bold()
                        .font(.title)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .lineLimit(1)
                }
                .padding(.vertical, 10)
                
                HStack {
                    Button {
                        showingAlert.toggle()
                        selectedTab = .call
                    } label: {
                        TabButtonView(
                            buttonText: "Call",
                            imageName: "phone.fill",
                            isSelected: selectedTab == .call
                        )
                    }
                    .alert("This functionality is not implemented", isPresented: $showingAlert) {
                        Button("OK", role: .cancel) {}
                    }
                    
                    Button {
                        showingAlert.toggle()
                        selectedTab = .mail
                    } label: {
                        TabButtonView(
                            buttonText: "Mail",
                            imageName: "envelope.fill",
                            isSelected: selectedTab == .mail
                        )
                    }
                    .alert("This functionality is not implemented", isPresented: $showingAlert) {
                        Button("OK", role: .cancel) {}
                    }
                    
                    Button {
                        showingAlert.toggle()
                        selectedTab = .info
                    } label: {
                        TabButtonView(
                            buttonText: "Info",
                            imageName: "person.circle.fill",
                            isSelected: selectedTab == .info
                        )
                    }
                    .alert("This functionality is not implemented", isPresented: $showingAlert) {
                        Button("OK", role: .cancel) {}
                    }
                }
                
                Form {
                    Section {
                        Link(destination: URL(string: "https://www.apple.com")!) {
                            Text("Send My Current Location")
                        }
                        
                        Link(destination: URL(string: "https://www.apple.com")!) {
                            Text("Share My Location")
                        }
                    }
                    
                    Section {
                        Toggle(isOn: $hideAlerts) {
                            Text("Hide Alerts")
                        }
                        
                        Toggle(isOn: $sendReadReceipts) {
                            Text("Send Read receipts")
                        }
                    }
                }
            }
        }
    }
}

struct ChannelInfoView_Previews: PreviewProvider {
    static var channelData = ChannelData()

    static var previews: some View {
        ChannelInfoView(channel: channelData.channels[0], selectedTab: .constant(.info))
    }
}
