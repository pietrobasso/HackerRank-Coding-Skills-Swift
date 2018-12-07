extension Array {
    subscript (safe index: Int) -> Element? {
        return (Int(index) >= 0 && Int(index) < count) ? self[Int(index)] : nil
    }
}

func hourglassSum(arr: [[Int]]) -> Int {
    var sums = Set<Int>()
    for i in 0..<arr.count {
        guard let upper = arr[safe: i], let middle = arr[safe: i + 1], let lower = arr[safe: i + 2] else { continue }
        for j in 0..<upper.count {
            let haha = [upper[safe: j],
                        upper[safe: j + 1],
                        upper[safe: j + 2],
                        middle[safe: j + 1],
                        lower[safe: j],
                        lower[safe: j + 1],
                        lower[safe: j + 2]]
                .compactMap { $0 }
            guard haha.count == 7 else { continue }
            sums.insert(haha.reduce(0, +))
        }
    }
    return sums.max() ?? 0
}

let test0 = [[1, 1, 1, 0, 0, 0],
             [0, 1, 0, 0, 0, 0],
             [1, 1, 1, 0, 0, 0],
             [0, 0, 2, 4, 4, 0],
             [0, 0, 0, 2, 0, 0],
             [0, 0, 1, 2, 4, 0]]
let test1 = [[1, 1, 1, 0, 0, 0],
             [0, 1, 0, 0, 0, 0],
             [1, 1, 1, 0, 0, 0],
             [0, 9, 2, -4, -4, 0],
             [0, 0, 0, -2, 0, 0],
             [0, 0, -1, -2, -4, 0]]
let test2 = [[-9, -9, -9, 1, 1, 1],
             [0, -9, 0, 4, 3, 2],
             [-9, -9, -9, 1, 2, 3],
             [0, 0, 8, 6, 6, 0],
             [0, 0, 0, -2, 0, 0],
             [0, 0, 1, 2, 4, 0]]
hourglassSum(arr: test0) // 19
hourglassSum(arr: test1) // 13
hourglassSum(arr: test2) // 28
