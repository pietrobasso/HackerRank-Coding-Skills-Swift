extension Collection {
    func count(where test: (Element) throws -> Bool) rethrows -> Int {
        return try self.filter(test).count
    }
}

func repeatedString(s: String, n: Int) -> Int {
    let test = { (char: Character) -> Bool in
        return char == "a"
    }
    let count = s.lazy.count
    let matchingCount = s.lazy.count(where: test)
    return matchingCount * ( n / count ) + s.lazy.prefix(n % count).count(where: test)
}

let test0 = (string: "aba", n: 10)
let test1 = (string: "a", n: 1000000000000)

repeatedString(s: test0.string, n: test0.n) // 7
repeatedString(s: test1.string, n: test1.n) // 1000000000000
