protocol Item {
    
    var category: String { get }
    
    var group: String { get }
    
}

extension Item {
    func narrowMatches(group: String) -> Bool {
        return self.group == group
    }
    
    func narrowMatches(category: String) -> Bool {
        return self.category == category
    }
    
    func broadMatches(group: String) -> Bool {
        return self.group == group || self.group == "*"
    }
    
    func broadMatches(category: String) -> Bool {
        return self.category == category || self.category == "*"
    }
}

class ItemMatcher {
    
    let items: [Item]
    init(items: [Item]) {
        self.items = items
    }
    
    // Complete the itemMatching function below.
    func itemMatching(group: String, category: String) -> Item? {
        var result: Item? = nil
        result = items.first { $0.narrowMatches(group: group) && $0.narrowMatches(category: category) }
        if result != nil { return result }
        result = items.first { $0.broadMatches(group: group) && $0.narrowMatches(category: category) }
        if result != nil { return result }
        result = items.first { $0.narrowMatches(group: group) && $0.broadMatches(category: category) }
        if result != nil { return result }
        return items.first { $0.broadMatches(group: group) && $0.broadMatches(category: category) }
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
