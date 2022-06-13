//
//  ContentView.swift
//  TestAppSwiftUI
//
//  Created by Jackson  on 13/06/2022.
//

import SwiftUI

struct IMDBMostPopularView: View {
    
    // MARK: - ObservedObject
    
    @ObservedObject var viewModel: IMDBViewModel
    
    // MARK: - Body
    
    var body: some View {
        List(viewModel.items) {
            IMDBItemView(item: $0)
        }
        .onAppear {
            Task { try? await viewModel.fetchIMDBMostPopular() }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        IMDBMostPopularView(viewModel: IMDBViewModel(httpClient: AsyncHTTPClient(urlSession: URLSession.shared)))
    }
}

