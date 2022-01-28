import Foundation
import SwiftUI

struct DogListItemView: View {
    let dog: Dog
    var body: some View {
        HStack {
            Image(systemName: "pawprint.fill")
            VStack(
                    alignment: .leading)
            {
                Text(dog.title)
                        .font(.system(size: 20))
                        .foregroundColor(.blue)
                if let subTitle = dog.subTitle {
                    Text(subTitle)
                            .font(.system(size: 16, weight: .light))
                            .foregroundColor(.blue)
                }
            }
        }
    }
}
