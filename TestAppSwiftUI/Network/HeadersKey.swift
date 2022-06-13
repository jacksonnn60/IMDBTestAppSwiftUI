//
//  HeadersKey.swift
//  Sadaptizer
//
//  Created by Jackson  on 06.02.2022.
//

import Foundation

enum HeaderKey: String {
    case contentType = "Content-Type"
    case accessToken = "Authorization"
}


enum HeaderValue: String {
    case contentType = "application/json"
    case multiformData = "multipart/form-data"
}
