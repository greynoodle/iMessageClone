//
//  ContentMessageView.swift
//  iMessageClone
//
//  Created by Yusif Tijani on 11/14/22.
//

import SwiftUI

struct ContentMessageView: View {
    var contentMessage: String
    var isCurrentUser: Bool
    var isFirst: Bool
    
    var body: some View {
        Text(contentMessage)
            .foregroundColor(isCurrentUser ? .white : .primary)
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(isCurrentUser ? .blue : Color(uiColor: .secondarySystemBackground), in: RoundedRectangle(cornerRadius: 14, style: .continuous))
            .background(alignment: isCurrentUser ? .bottomTrailing : .bottomLeading) {
                isFirst ? Image(isCurrentUser ? "outgoingTail" : "incomingTail") : nil
            }
    }
}

struct ContentMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ContentMessageView(contentMessage: "This is a test message", isCurrentUser: false, isFirst: true)
    }
}
