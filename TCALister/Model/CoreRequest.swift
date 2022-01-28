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

struct Animal: Equatable, Identifiable {
    static func == (lhs: Animal, rhs: Animal) -> Bool {
        return lhs.id == rhs.id
    }
    let id: String
    var title = ""
    var subTitle: String?
}

class Requester {
    
    static func requestItems(okHandler: @escaping ([Animal]) -> Void) {
        let _ = Task {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                okHandler([
                    Animal(id: "1", title: "Dog"),
                    Animal(id: "2", title: "Cat"),
                    Animal(id: "3", title: "Lion", subTitle: "Wild animal")])
            }
        }
    }
}
