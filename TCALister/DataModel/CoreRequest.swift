//
//  CoreRequest.swift
//  TCALister
//
//  Created by Tomasz Serafin on 16/01/2022.
//

import Foundation

enum TypeOfPages {
    case dogs
}

struct MenuItem: Equatable, Identifiable {
    static func == (lhs: MenuItem, rhs: MenuItem) -> Bool {
        return lhs.id == rhs.id
    }
    let id: String
    var title = ""
    let pageId: TypeOfPages
}

struct Dog: Equatable, Identifiable {
    static func == (lhs: Dog, rhs: Dog) -> Bool {
        return lhs.id == rhs.id
    }
    let id: String
    var title = ""
    var subTitle: String?
}

class Requester {
    
    static func requestMenuItems(okHandler: @escaping ([MenuItem]) -> Void) {
        let _ = Task {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                okHandler([
                    MenuItem(id: "1", title: "Dogs to adopt", pageId: TypeOfPages.dogs)])
            }
        }
    }
    
    static func requestItems(okHandler: @escaping ([Dog]) -> Void) {
        let _ = Task {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                okHandler([
                    Dog(id: "1", title: "Dalmatian"),
                    Dog(id: "2", title: "Bulldog"),
                    Dog(id: "3", title: "Yorkshire Terrier", subTitle: "Young")])
            }
        }
    }
}
