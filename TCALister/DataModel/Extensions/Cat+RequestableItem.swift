import Foundation

extension Cat: RequestableItem {
    static func request(okHandler: @escaping ([Cat]) -> Void) {
        Requester.requestCats(okHandler: okHandler)
    }
}
