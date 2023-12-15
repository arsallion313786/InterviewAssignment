//
//  APIManager.swift
//  TechnologyAssessment
//
//  Created by Muhammad Arslan Khalid on 15/12/2023.
//

import Foundation

protocol APIManagerProtocol {
    func initRequest(with data: RequestProtocol) async throws -> Data
}

class APIManager: APIManagerProtocol {
    private let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func initRequest(with data: RequestProtocol) async throws -> Data {
        let (data, response) = try await urlSession.data(for: data.request())
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else { throw NetworkError.invalidServerResponse }
        return data
    }
}
