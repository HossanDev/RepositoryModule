//
//  File.swift
//  FeedRepository
//
//  Created by MohammadHossan on 07/07/2025.
//

import Foundation

// MARK: - FeedElement
public struct FeedElement: Codable, Hashable, Sendable {
  public let id: String
  public let urls: Urls
  public let createdAt: String
  public  let altDescription: String?
  public let likes: Int?
  public let user: User?
  
  public init(id: String, urls: Urls, createdAt: String, altDescription: String?, likes: Int?, user: User?) {
    self.id = id
    self.urls = urls
    self.createdAt = createdAt
    self.altDescription = altDescription
    self.likes = likes
    self.user = user
  }
}


// MARK: - User
public struct User: Codable, Hashable, Sendable {
  public let username, name, firstName: String
  public let profileImage: ProfileImage
  public let instagramUsername: String?
  public let bio: String?
  public let totalCollections, totalLikes, totalPhotos, totalPromotedPhotos: Int
  
  public init(username: String, name: String, firstName: String, profileImage: ProfileImage, instagramUsername: String?, bio: String?, totalCollections: Int, totalLikes: Int, totalPhotos: Int, totalPromotedPhotos: Int) {
    self.username = username
    self.name = name
    self.firstName = firstName
    self.profileImage = profileImage
    self.instagramUsername = instagramUsername
    self.bio = bio
    self.totalCollections = totalCollections
    self.totalLikes = totalLikes
    self.totalPhotos = totalPhotos
    self.totalPromotedPhotos = totalPromotedPhotos
  }
}


// MARK: - ProfileImage
public struct ProfileImage: Codable, Hashable, Sendable {
  public let small, medium, large: String
  
  public init(small: String, medium: String, large: String) {
    self.small = small
    self.medium = medium
    self.large = large
  }
}


// MARK: - Urls
public struct Urls: Codable, Hashable, Sendable {
  public let raw, full, regular, small: String
  
  public init(raw: String, full: String, regular: String, small: String) {
    self.raw = raw
    self.full = full
    self.regular = regular
    self.small = small
  }
}
