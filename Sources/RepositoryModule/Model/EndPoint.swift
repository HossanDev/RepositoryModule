//
//  File.swift
//  FeedRepository
//
//  Created by MohammadHossan on 07/07/2025.
//

import Foundation

public struct EndPoint {
  public static func photosURL(page: Int, perPage: Int = 10) -> String {
    return "https://api.unsplash.com/photos?page=\(page)&per_page=\(perPage)&client_id=yW6VbXeq363gDf5rd4cRqJJIzyK2gH36NbB6eztpI2E"
  }
}

