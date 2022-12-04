//
//  Channel.swift
//  iMessageClone
//
//  Created by Yusif Tijani on 11/10/22.
//

import Foundation
import SwiftUI

struct Channel: Identifiable, Hashable {
    var id = UUID()
    var channelName = ""
    var avatar = Image(systemName: "person.circle.fill")
    var lastMessageAt = Date()
    var lastMessage = ""
    var isMuted = false
    var isCurrentUser = true
    var sendButtonTapped = false
    
//    var isPinned: Bool
        
    var lastMessageStamp: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter.string(from: lastMessageAt)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(channelName)
    }
    
//    var isWithinSevenDays: Bool {
//        lastMessageAt < Date.now
//    }
//    
//    // Convenience methods for dates.
//    extension Date {
//        var sevenDaysAgo: Date {
//            Calendar.autoupdatingCurrent.date(byAdding: .day, value: 7, to: self) ?? self
//        }
//    }
}
