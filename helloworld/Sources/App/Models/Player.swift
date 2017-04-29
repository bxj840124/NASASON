//
//  Player.swift
//  
//
//  Created by 楊喬宇 on 2017/4/26.
//
//

import Foundation
import Vapor

struct Player: Model {
    
    var exist: Bool = false
    var id: Node?
    let name: String
    let job: String
    let currency: Int
    
    init(name: String, job: String, currency: Int) {
        self.name = name
        self.job = job
        self.currency = currency
    }
    
    // NodeInitializable
    init(node: Node, in context: Context) throws {
        id = try node.extract("id")
        name = try node.extract("name")
        job = try node.extract("job")
        currency = try node.extract("currency")
    }
    
    // NodeRepresentable
    func makeNode(context: Context) throws -> Node {
        return try Node(node: ["id": id,
                               "name": name,
                               "job": job,
                               "currency": currency])
    }
    
    // Preparation
    static func prepare(_ database: Database) throws {
        try database.create("players") { players in
            players.id()
            players.string("name")
            players.string("job")
            players.int("currency")
        }
    }
    
    static func revert(_ database: Database) throws {
        try database.delete("players")
    }
}
