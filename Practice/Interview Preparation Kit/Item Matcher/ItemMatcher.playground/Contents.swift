protocol Item {
    
    var category: String { get }
    
    var group: String { get }
    
}

extension Item {
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
        let matchingItem = items.first { $0.group == group && $0.category == category }
        guard matchingItem != nil else {
            return items.first { $0.broadMatches(group: group) && $0.broadMatches(category: category) }
        }
        return matchingItem
    }
    
}
