//
//  PeopleCell.swift
//  Clothing-Sizes
//
//  Created by Matthew Curtner on 8/27/16.
//  Copyright © 2016 Matthew Curtner. All rights reserved.
//

import UIKit

class PeopleCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!

    var person: Person? {
        didSet {
            guard let person = person else { return }
            nameLabel.text = person.name
        }
    }
    
}
