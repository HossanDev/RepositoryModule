//
//  File.swift
//  FeedRepository
//
//  Created by MohammadHossan on 07/07/2025.
//

import Foundation

 protocol FeedRepositoryProtocol {
  func fetchFeed(from urlString: String) async throws -> [FeedElement]
}
