//
//  TweetFilterViewModel.swift
//  TwitterSwiftUI
//
//  Created by Slava on 07/03/2023.
//

import Foundation

enum TweetFilterViewModel: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var title: String {
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Replies"
        case .likes: return "Likes"
        }
    }
}
