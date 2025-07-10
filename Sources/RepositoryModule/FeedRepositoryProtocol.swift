//
//  File.swift
//  FeedRepository
//
//  Created by MohammadHossan on 07/07/2025.
//

import Foundation
import ModelModule

 public protocol FeedRepositoryProtocol {
  func fetchFeed(from urlString: String) async throws -> [FeedElement]
}
