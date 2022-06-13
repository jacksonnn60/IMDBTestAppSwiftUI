//
//  IMDBItemView.swift
//  TestAppSwiftUI
//
//  Created by Jackson  on 13/06/2022.
//

import SwiftUI

struct IMDBItemView: View {
    
    var item: IMDBItem
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Text(item.title)
                .font(.system(size: 24, weight: .medium, design: .default))
            
            Spacer()
            
            HStack {
                AsyncImage(url: URL(string: item.image)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 100, height: 140)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(radius: 5)
                
                Text(item.crew)
                
                Spacer()
                
                HStack {
                    Text("rank: ")
                    Text(item.rank)
                }
                .padding(.trailing)
            }
        }
    }
}

