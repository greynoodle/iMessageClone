//
//  ContentView.swift
//  iMessageClone
//
//  Created by Yusif Tijani on 11/8/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ChannelListView(channel: Channel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ChannelData())
            .environmentObject(ChatHelper())
    }
}
