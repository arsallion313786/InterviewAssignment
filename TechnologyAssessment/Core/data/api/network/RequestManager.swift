//
//  RequestManager.swift
//  TechnologyAssessment
//
//  Created by Muhammad Arslan Khalid on 15/12/2023.
//

import Foundation

protocol RequestManagerProtocol {
    var apiManager: APIManagerProtocol { get }
    var parser: DataParserProtocol { get }
    func initRequest<T: Decodable>(with data: RequestProtocol) async throws -> T
}


class RequestManager: RequestManagerProtocol {
    let apiManager: APIManagerProtocol
    
    init(
        apiManager: APIManagerProtocol = APIManager()
    ) {
        self.apiManager = apiManager
    }
    
    func initRequest<T: Decodable>(with data: RequestProtocol) async throws -> T {
        let data = try await apiManager.initRequest(with: data)
        let decoded: T = try parser.parse(data: data)
        return decoded
    }
}

// MARK: - Returns Data Parser
extension RequestManagerProtocol {
    var parser: DataParserProtocol {
        return DataParser()
    }
}
