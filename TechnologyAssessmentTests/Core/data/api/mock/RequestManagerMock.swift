//
//  RequestManagerMock.swift
//  TechnologyAssessmentTests
//
//  Created by Muhammad Arslan Khalid on 15/12/2023.
//

import XCTest
@testable import TechnologyAssessment

class RequestManagerMock: RequestManagerProtocol {
  let apiManager: APIManagerProtocol

  init(apiManager: APIManagerProtocol = APIManagerMock()) {
    self.apiManager = apiManager

  }

  func initRequest<T: Decodable>(with data: RequestProtocol) async throws -> T {
    let data = try await apiManager.initRequest(with: data)
    let decoded: T = try parser.parse(data: data)
    return decoded
  }
}

