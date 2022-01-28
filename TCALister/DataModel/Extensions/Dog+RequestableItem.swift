import Foundation

extension Dog: RequestableItem {
    static func request(okHandler: @escaping ([Dog]) -> Void) {
        Requester.requestDogs(okHandler: okHandler)
    }
}
