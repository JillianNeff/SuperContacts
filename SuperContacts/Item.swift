//
//  Item.swift
//  SuperContacts
//
//  Created by Jillian Neff on 11/12/20.
//

import UIKit

class Item: NSObject, Codable {
    var name: String
    var universe: String
    var alignment: String
    var strengths: String
    var weaknesses: String
    
    init(name: String, universe: String, alignment: String, strengths: String, weaknesses: String) {
        self.name = name
        self.universe = universe
        self.alignment = alignment
        self.strengths = strengths
        self.weaknesses = weaknesses
        
        super.init()
    }
    
    convenience init(random: Bool = false) {
        if random {
            let people = ["Thor", "Joker", "Venom", "Captain America"]
            var idx = arc4random_uniform(UInt32(people.count))
            let randomName = people[Int(idx)]
            
            let universes = ["Marvel", "DC", "Red Circle"]
            idx = arc4random_uniform(UInt32(universes.count))
            let randomUniverse = universes[Int(idx)]
            
            let alignments = ["good", "evil", "neutral"]
            idx = arc4random_uniform(UInt32(alignments.count))
            let randomAlignment = alignments[Int(idx)]
            
            let strengths = ["Strength", "Speed", "Agility", "Fire", "Intelligence"]
            idx = arc4random_uniform(UInt32(strengths.count))
            let randomStrength = strengths[Int(idx)]
            
            let weaknesses = ["Kryptonite", "Water", "Ego", "Fire", "Fear"]
            idx = arc4random_uniform(UInt32(weaknesses.count))
            let randomWeakness = weaknesses[Int(idx)]
            
            self.init(name: randomName, universe: randomUniverse, alignment: randomAlignment, strengths: randomStrength, weaknesses: randomWeakness)
        }
        else {
            self.init(name: "", universe: "", alignment: "", strengths: "", weaknesses: "")
        }
    }
}
