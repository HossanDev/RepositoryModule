import XCTest
@testable import RepositoryModule

final class RepositoryModuleTests: XCTestCase {
  var repository: FeedRepository?

  func test_Get_Feed_In_Success_Case() async throws {
    let jsonString = """
    [
      {
        "id": "lLenwc__YmU",
        "urls": {
          "raw": "https://example.com/raw.jpg",
          "full": "https://example.com/full.jpg",
          "regular": "https://example.com/regular.jpg",
          "small": "https://example.com/small.jpg"
        },
        "createdAt": "2023-07-09T12:00:00Z",
        "altDescription": "An example description",
        "likes": 42,
        "user": {
          "username": "user123",
          "name": "John Doe",
          "firstName": "John",
          "profileImage": {
            "small": "https://example.com/profile_small.jpg",
            "medium": "https://example.com/profile_medium.jpg",
            "large": "https://example.com/profile_large.jpg"
          },
          "instagramUsername": "john_doe_insta",
          "total_collections": 0,
          "total_likes": 9,
          "total_photos": 68,
          "total_promoted_photos": 11,
          "total_illustrations": 0,
          "total_promoted_illustrations": 0
        }
      }
    ]
    """
    guard let mockData = jsonString.data(using: .utf8) else {
      XCTFail("Failed to convert mock JSON string to Data")
      return
    }
    let mockNetworkManager = MockNetworkManager(mockData: mockData)
    repository = FeedRepository(networkService: mockNetworkManager)
    
    let feedList = try await repository?.fetchFeed(from: "any_url")
    XCTAssertNotNil(feedList)
    XCTAssertTrue(feedList!.count > 0)
    XCTAssertEqual(feedList!.first?.id, "lLenwc__YmU")
  }

  func test_FetchFeed_DecodingFailure() async throws {
    let invalidJsonString = """
    {
      "invalid": "This does not match the expected array of FeedElement"
    }
    """
    guard let mockData = invalidJsonString.data(using: .utf8) else {
      XCTFail("Failed to convert mock JSON string to Data")
      return
    }
    let mockNetworkManager = MockNetworkManager(mockData: mockData)
    repository = FeedRepository(networkService: mockNetworkManager)
    
    do {
      let feedList = try await repository?.fetchFeed(from: "any_url")
      XCTFail("Expected decoding failure but got feedList: \(String(describing: feedList))")
    } catch let error as RepositoryError {
      switch error {
      case .decodingFailed:
        break
      case .invalidURL(let urlString):
        XCTFail("Unexpected invalidURL error: \(urlString)")
      case .requestFailed(let innerError):
        XCTFail("Unexpected requestFailed error: \(innerError.localizedDescription)")
      case .invalidResponse:
        XCTFail("Unexpected invalidResponse error")
      case .parsingError:
        XCTFail("Unexpected parsingError")
      }
    } catch {
      XCTFail("Unexpected non-RepositoryError: \(error)")
    }
  }
}
