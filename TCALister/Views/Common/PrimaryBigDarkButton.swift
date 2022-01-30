import Foundation
import SwiftUI

struct PrimaryBigDarkButton: View {
    let title: String
    let action: () -> Void
    var body: some View {
        Button(title, action: action)
                .font(.title)
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(Color.primaryDark)
                .cornerRadius(6)
    }
}
