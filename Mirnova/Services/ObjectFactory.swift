//
//  ApolloConstructor.swift
//  Mirnova
//
//  Created by Josh Sauder on 5/18/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import Foundation
import Apollo

protocol ObjectFactory {
    func getApolloClient() -> ApolloClient
}

extension ObjectFactory {
    func getApolloClient() -> ApolloClient {
        let url = URL(string: "http://localhost:4000/graphql")!
        
        return ApolloClient(
            networkTransport: HTTPNetworkTransport(url: url)
        )
    }
}

extension CourseViewModel: ObjectFactory {}
