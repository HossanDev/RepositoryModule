//
//  File.swift
//  FeedRepository
//
//  Created by MohammadHossan on 08/07/2025.
//

import Foundation

public struct Story: Identifiable, Equatable {
  public let id = UUID()
  public let username: String
  public let imageName: String
  public let isUserStory: Bool
  
  public init(username: String, imageName: String, isUserStory: Bool) {
    self.username = username
    self.imageName = imageName
    self.isUserStory = isUserStory
  }
}
