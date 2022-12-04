//
//  ChatHelper.swift
//  iMessageClone
//
//  Created by Yusif Tijani on 11/16/22.
//

import Foundation
import Combine

class ChatHelper: ObservableObject {
    var didChange = PassthroughSubject<Void, Never>()
    @Published var messages: [Message] = []
    
    func sendMessage(_ chatMessage: Message) {
        messages.append(chatMessage)
        didChange.send()
    }
}
