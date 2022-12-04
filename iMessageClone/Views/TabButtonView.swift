//
//  TabButtonView.swift
//  iMessageClone
//
//  Created by Yusif Tijani on 11/15/22.
//

import SwiftUI

struct TabButtonView: View {
    @Environment(\.colorScheme) var colorScheme
    var buttonText: String
    var imageName: String
    var isSelected: Bool
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 20)
            
            Text(buttonText)
                .font(.subheadline)
        }
        .frame(width: 110, height: 60)
        .background(colorScheme == .dark ? .gray : .white)
        .foregroundColor(isSelected ? .blue : colorScheme == .dark ? .white : .gray)
        .cornerRadius(10)
    }
}

struct TabButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TabButtonView(buttonText: "Info", imageName: "phone.fill", isSelected: false)
    }
}
