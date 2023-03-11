//
//  FeedView.swift
//  TwitterSwiftUI
//
//  Created by Slava on 04/03/2023.
//

import SwiftUI

struct FeedView: View {
    
    @State private var showNewTweetView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack {
                    ForEach(0 ... 20, id: \.self) { _ in
                        TweetsRowView()
                    }
                }
            }
            
            Button {
                showNewTweetView.toggle()
            } label: {
                Image(systemName: "pencil.line")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 22, height: 22)
                    .padding()
                    .background(Color(.systemBlue))
                    .clipShape(Circle())
                    .padding()
                    .foregroundColor(.white)
                    .fullScreenCover(isPresented: $showNewTweetView) {
                        Text("newTweet view")
                    }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
