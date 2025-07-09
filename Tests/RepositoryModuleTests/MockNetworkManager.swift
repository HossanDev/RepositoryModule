//
//  File.swift
//  RepositoryModule
//
//  Created by MohammadHossan on 09/07/2025.
//

import Foundation
import NetworkModule
@testable import RepositoryModule

class MockNetworkManager: NetworkServiceProtocol {
  let mockData: Data
  
  init(mockData: Data) {
    self.mockData = mockData
  }
  
  func request(from urlString: String) async throws -> Data {
    return mockData
  }
}
