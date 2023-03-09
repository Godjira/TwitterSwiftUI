//
//  UserRowView.swift
//  TwitterSwiftUI
//
//  Created by Slava on 09/03/2023.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Joker")
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                
                Text("Head Ledger")
                    .font(.subheadline).bold()
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
    }
}
