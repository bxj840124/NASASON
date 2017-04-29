import Vapor
import VaporPostgreSQL

let drop = Droplet()
drop.preparations.append(Player.self)

var light_num: String = ""

do {
    try drop.addProvider(VaporPostgreSQL.Provider.self)
} catch {
    assertionFailure("Error adding provider: \(error)")
}

drop.get { req in
    return try drop.view.make("welcome", [
        "message": drop.localization[req.lang, "welcome", "title"]
        ])
}

drop.get("players") { req in
    let players = try Player.all().makeNode()
    let playersDictionary = ["players": players]
    return try JSON(node: playersDictionary)
}

drop.get("light") { req in
    return light_num as String
}

drop.post("light_num") { req in
    guard let num = req.data["light"]?.string
        else {
            throw Abort.badRequest
    }
    light_num = num
    return light_num
}

drop.post("player") { req in
    guard
        let name = req.data["name"]?.string,
        let job = req.data["job"]?.string,
        let currency = req.data["currency"]?.int
    else {
        throw Abort.badRequest
    }
    var player = try Player(node: ["name": name, "job": job, "currency": currency])
    try player.save()
    return try player.makeJSON()
}

drop.resource("posts", PostController())
drop.run()
