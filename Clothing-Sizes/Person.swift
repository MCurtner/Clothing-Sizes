//
//  Person.swift
//  Clothing-Sizes
//
//  Created by Matthew Curtner on 8/27/16.
//  Copyright © 2016 Matthew Curtner. All rights reserved.
//

import UIKit
import RealmSwift

class Person: Object {
    
    // MARK: Properties
    dynamic var name = ""
}

extension Realm {
    var people: Results<Person> { return objects(Person.self).sorted("name") }
}

extension Realm {
    func addPerson(name: String) {
        do {
            try write {
                let person = Person()
                person.name = name
                add(person)
            }
        } catch {
            print("Add person action failed: \(error)")
        }
    }
    
    func deletePerson(person: String) {
        do {
            let personToDelete = personRealm.objects(Person).filter("name == %@", person)
            try write {
                delete(personToDelete)
            }
        } catch {
            print("Delete person action failed: \(error)")
        }
    }
    
    func deleteAllPeople() {
        do {
            try write {
                self.deleteAll()
            }
        } catch {
            print("Delete all people action failed: \(error)")
        }
    }
}

let personRealm = try! Realm()