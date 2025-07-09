// The Swift Programming Language
// https://docs.swift.org/swift-book


import Foundation
import NetworkModule

public struct FeedRepository: FeedRepositoryProtocol {
  private let networkService: NetworkServiceProtocol
  
  public init(networkService: NetworkServiceProtocol = NetworkManager()) {
    self.networkService = networkService
  }
  
  public func fetchFeed(from urlString: String) async throws -> [FeedElement] {
    try await fetch(from: urlString)
  }
  
  private func fetch<T: Decodable>(from urlString: String) async throws -> T {
    let data = try await networkService.request(from: urlString)
    do {
      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase
      return try decoder.decode(T.self, from: data)
    } catch {
      throw RepositoryError.decodingFailed(error)
    }
  }
}
