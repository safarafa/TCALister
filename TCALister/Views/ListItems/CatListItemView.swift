//
//  CatListItemView.swift
//  TCALister
//
//  Created by Tomasz Serafin on 28/01/2022.
//

import SwiftUI

struct CatListItemView: View {
    let cat: Cat
    var body: some View {
        VStack(
                alignment: .leading)
        {
            Text(cat.name)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
            if !cat.breed.isEmpty {
                Text(cat.breed)
                        .font(.system(size: 16, weight: .light))
                        .foregroundColor(.black)
            }
        }
    }
}
