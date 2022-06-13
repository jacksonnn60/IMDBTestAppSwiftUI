//
//  AsyncHTTPClient.swift
//  TestAppSwiftUI
//
//  Created by Jackson  on 13/06/2022.
//

import Foundation
import UIKit

protocol IAsyncHTTPClient {
    func perform<T: Codable>(_ request: Request) async throws -> T?
}

final class AsyncHTTPClient: IAsyncHTTPClient {
    
    // MARK: - Properties
    
    private let urlSession: URLSession
    
    // MARK: - Init
    
    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
    
    // MARK: - IAsyncHTTPClient
    
    func perform<T: Codable>(_ request: Request) async throws -> T? {
        let response = try await urlSession.data(for: request.request)
        
        if isSuccessResponse(response.1) {
            return try JSONDecoder().decode(T.self, from: response.0)
        }
        
        return nil
    }
    
}

// MARK: -

private extension AsyncHTTPClient {
    
    private func isSuccessResponse(_ response: URLResponse) -> Bool {
        guard let httpResponse = response as? HTTPURLResponse,
              let httpStatusCode = HTTPStatusCode(rawValue: httpResponse.statusCode) else {
            
            print("⛔️Error casting response.")
            
            return false
        }
        
        switch httpStatusCode.responseType {
        case .serverError, .clientError:
            print("⛔️\(httpStatusCode.rawValue): \(response.url?.absoluteString ?? "~url~")")
            
            return false
        case .success:
            print("✅\(httpStatusCode.rawValue): \(response.url?.absoluteString ?? "~url~")")
            
            return true
            
        default:
            print("Default.")
        }
        
        return false
    }
    
}
