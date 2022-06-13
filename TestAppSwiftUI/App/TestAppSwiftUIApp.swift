//
//  TestAppSwiftUIApp.swift
//  TestAppSwiftUI
//
//  Created by Jackson  on 13/06/2022.
//

import SwiftUI

@main
struct TestAppSwiftUIApp: App {
    
    private let httpClient = AsyncHTTPClient(urlSession: URLSession.init(configuration: .default))
    
    var body: some Scene {
        WindowGroup {
            IMDBMostPopularView(viewModel: IMDBViewModel(httpClient: httpClient))
        }
    }
}
