//
//  CoreRequest.swift
//  TCALister
//
//  Created by Tomasz Serafin on 16/01/2022.
//

import Foundation

enum TypeOfPages {
    case dogs
    case cats
}

struct MenuItem: Equatable, Identifiable {
    static func ==(lhs: MenuItem, rhs: MenuItem) -> Bool {
        lhs.id == rhs.id
    }

    let id: String
    var title = ""
    let pageId: TypeOfPages
}

struct Dog: Equatable, Identifiable {
    static func ==(lhs: Dog, rhs: Dog) -> Bool {
        lhs.id == rhs.id
    }

    let id: String
    var title = ""
    var subTitle: String?
}

struct Cat: Equatable, Identifiable {
    static func ==(lhs: Cat, rhs: Cat) -> Bool {
        lhs.id == rhs.id
    }

    let id: String
    var name = ""
    var breed = ""
}

class Requester {

    static func requestMenuItems(okHandler: @escaping ([MenuItem]) -> Void) {
        let _ = Task {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                okHandler([
                              MenuItem(id: "1", title: "Dogs to adopt", pageId: .dogs),
                              MenuItem(id: "2", title: "Cats to adopt", pageId: .cats)])
            }
        }
    }

    static func requestDogs(okHandler: @escaping ([Dog]) -> Void) {
        let _ = Task {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                okHandler([
                              Dog(id: "1", title: "Dalmatian"),
                              Dog(id: "2", title: "Bulldog"),
                              Dog(id: "3", title: "Yorkshire Terrier", subTitle: "Young")])
            }
        }
    }

    static func requestCats(okHandler: @escaping ([Cat]) -> Void) {
        let _ = Task {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                okHandler([
                              Cat(id: "1", name: "Bobby", breed: "Munchkin"),
                              Cat(id: "2", name: "Fairy", breed: "Maine Coon"),
                              Cat(id: "3", name: "Meow", breed: "Russian Blue Cat")])
            }
        }
    }
}
