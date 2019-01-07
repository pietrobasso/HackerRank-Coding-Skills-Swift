enum Result {
    case success
    case failure
    
    func printed() {
        switch self {
        case .success:
            print("Yes")
        case .failure:
            print("No")
        }
    }
}

extension Array where Element == String {
    var occurrencies: [String: Int] {
        return reduce([:]) { (count, element) -> [String: Int] in
            var count = count
            count[element] = (count[element] ?? 0) + 1
            return count
        }
    }
}

func checkMagazine(magazine: [String], note: [String]) {
    var result: Result = .failure
    var counter = magazine.reduce(into: [:]) { (count, word) in
        count[word, default: 0] += 1
    }
    for word in note {
        guard counter[word, default: 0] != 0 else {
            result = .failure
            result.printed()
            return
        }
        counter[word, default: 0] -= 1
    }
    result = .success
    result.printed()
}

let test0 = (magazine: ["give", "me", "one", "grand", "today", "night"], note: ["give", "one", "grand", "today"])
let test1 = (magazine: ["two", "times", "three", "is", "not", "four"], note: ["two", "times", "two", "is", "four"])

checkMagazine(magazine: test0.magazine, note: test0.note) // Yes
checkMagazine(magazine: test1.magazine, note: test1.note) // No
