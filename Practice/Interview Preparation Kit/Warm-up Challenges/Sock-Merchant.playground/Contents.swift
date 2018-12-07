func sockMerchant(n: Int, ar: [Int]) -> Int {
    var colors = Set<Int>()
    return ar.reduce(0) { (pairs, sock) -> Int in
        guard colors.contains(sock) else {
            colors.insert(sock)
            return pairs
        }
        colors.remove(sock)
        return pairs + 1
    }
}

let test0 = [10, 20, 20, 10, 10, 30, 50, 10, 20]
let test1 = [1, 1, 3, 1, 2, 1, 3, 3, 3, 3]
sockMerchant(n: test0.count, ar: test0) // 3
sockMerchant(n: test1.count, ar: test1) // 4
