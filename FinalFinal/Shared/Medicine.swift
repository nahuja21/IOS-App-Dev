import Foundation


struct Medicine: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var quantity: String
    var days: [String]  // Array of days
    var sideEffects: String?
    var notes: String?
}
