//
//  Item.swift
//  Todoey 2
//
//  Created by Rajagopal Srinivasan on 12/4/19.
//  Copyright © 2019 Rajagopal Srinivasan. All rights reserved.
//

import Foundation

class Item: Encodable,Decodable {
    
    var title: String = ""
    var done: Bool = false
    
}
