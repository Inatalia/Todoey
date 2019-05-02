//
//  Item.swift
//  Todoey
//
//  Created by Irene Natalia on 4/21/19.
//  Copyright © 2019 Irene Hardjono. All rights reserved.
//

import Foundation

class Item : Encodable, Decodable {
    var title : String = ""
    var done : Bool = false
}
