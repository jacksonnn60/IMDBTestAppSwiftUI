//
//  IMDBViewModel.swift
//  TestAppSwiftUI
//
//  Created by Jackson  on 13/06/2022.
//

import SwiftUI

protocol IIMDBViewModel: ObservableObject {
    func fetchIMDBMostPopular() async throws
}

final class IMDBViewModel: IIMDBViewModel {
    
    // MARK: - Properties
    
    private let httpClient: IAsyncHTTPClient
    
    // MARK: - Observable properties
    
    @Published var items: [IMDBItem] = []
        
    // MARK: - Init
    
    init(httpClient: IAsyncHTTPClient) {
        self.httpClient = httpClient
    }
    
    // MARK: - IIMDBViewModel
    
    func fetchIMDBMostPopular() async throws {
        let response: IMDBMostPopularResponseData? = try await httpClient.perform(IMDBRequest.getMostPopular)
        
        DispatchQueue.main.async { [weak self] in
            self?.items = response?.items ?? []
        }
    }
}
