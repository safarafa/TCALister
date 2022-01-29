import Foundation
import SwiftUI

struct PrimaryBigWhiteButton: View {
    let title: String
    let action: () -> Void
    var body: some View {
        Button(title, action: action)
                .font(.title)
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(.accentColor)
                .background(Color.white)
                .cornerRadius(6)
    }
}
