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
        List(viewModel.items) { item in
            let query = item.title.split(separator: " ").joined(separator: "+")
            
            Link(destination: URL(string: "https://www.google.com/search?q=\(query)")!) {
                IMDBItemView(item: item)
            }
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

