//
//  APIManagerMock.swift
//  TechnologyAssessmentTests
//
//  Created by Muhammad Arslan Khalid on 15/12/2023.
//

import Foundation
@testable import TechnologyAssessment

struct APIManagerMock: APIManagerProtocol {
    var bundle: Bundle {
        Bundle(for: RepoArticleTest.self)
    }
    
  func initRequest(with data: RequestProtocol) async throws -> Data {
      
      guard let url = bundle.url(forResource: "Articles", withExtension: "json") else {
        fatalError("file named Articles.json not found.")
      }
      
      return try Data(contentsOf: url);
      
  }
}
