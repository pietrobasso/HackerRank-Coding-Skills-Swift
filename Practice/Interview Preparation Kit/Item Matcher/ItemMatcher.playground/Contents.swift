protocol Item {
    
    var category: String { get }
    
    var group: String { get }
    
}

extension Item {
    func matchFor(group: String, category: String) -> Match? {
        if self.group == group && self.category == category {
            return .full
        }
        if self.group == group && self.category == "*" {
            return .half
        }
        if self.group == "*" && self.category == category {
            return .half
        }
        if self.group == "*" && self.category == "*" {
            return .broad
        }
        return nil
    }
}

enum Match: Int {
    case broad, half, full
}

class ItemMatcher {
    
    let items: [Item]
    init(items: [Item]) {
        self.items = items
    }
    
    // Complete the itemMatching function below.
    func itemMatching(group: String, category: String) -> Item? {
        return items.dropFirst().reduce(items.first) { (nearestMatch, item) -> Item? in
            let lhs = nearestMatch?.matchFor(group: group, category: category)
            let rhs = item.matchFor(group: group, category: category)
            switch (lhs, rhs) {
            case let (lhs?, rhs?):
                return lhs.rawValue < rhs.rawValue ? item : nearestMatch
            case (_, .some):
                return item
            default:
                return nearestMatch
            }
        }
    }
    
}

struct ItemImplementation: Item {
    let category: String
    let group: String
}

let matcher = ItemMatcher(items: [ItemImplementation(category: "*", group: "*"),
                                  ItemImplementation(category: "b1", group: "b2"),
                                  ItemImplementation(category: "c1", group: "*"),
                                  ItemImplementation(category: "d1", group: "d2"),
                                  ItemImplementation(category: "e1", group: "e2"),
                                  ItemImplementation(category: "f1", group: "f2"),
                                  ItemImplementation(category: "g1", group: "g2")])

matcher.itemMatching(group: "e2", category: "c1")
