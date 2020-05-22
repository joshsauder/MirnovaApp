//
//  Network.swift
//  Mirnova
//
//  Created by Josh Sauder on 5/18/20.
//  Copyright © 2020 Josh Sauder. All rights reserved.
//

import Foundation
import Apollo


class Network {
    //create Singleton
    static let shared = Network()
    private(set) lazy var apollo = ApolloClient(url: URL(string: "http://localhost:4000/graphql")!)
}

