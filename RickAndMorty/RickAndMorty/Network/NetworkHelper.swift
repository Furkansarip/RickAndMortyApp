//
//  NetworkHelper.swift
//  RickAndMorty
//
//  Created by Furkan Sarı on 30.07.2024.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
}

protocol EndpointProtocol {
    var baseURL: String { get }
    var path: String { get }
    var method: String { get }
    var header: String { get }
    func request() -> URLRequest
}

enum Endpoints: String {
    case characters = "/character"
}

struct WarningResult: Codable {
    let title: String?
    let message: String?
    let imageName: String?
}

struct RetrievedData<T: Codable>: Codable {
    let warningResult: WarningResult?
    let data: T?
}
