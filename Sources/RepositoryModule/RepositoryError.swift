//
//  RepositoryError.swift
//  RepositoryLayer
//
//  Created by MohammadHossan on 07/07/2025.
//

import Foundation


public enum RepositoryError: Error, LocalizedError {
  case invalidURL(String)
  case requestFailed(Error)
  case invalidResponse
  case decodingFailed(Error)
  case parsingError
  
  public var errorDescription: String? {
    switch self {
    case .invalidURL(let urlString):
      return "Invalid URL: \(urlString)"
    case .requestFailed(let error):
      return "Request failed: \(error.localizedDescription)"
    case .invalidResponse:
      return "Invalid response from server."
    case .decodingFailed(let error):
      return "Failed to decode response: \(error.localizedDescription)"
    case .parsingError:
      return "Failed to parse response"
    }
  }
}
