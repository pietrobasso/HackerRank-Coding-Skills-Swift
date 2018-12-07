func minimumSwaps(arr: [Int]) -> Int {
    let sorted = arr.enumerated().sorted { $0.element < $1.element }
    var visited = Array(repeating: false, count: arr.count)
    var minimumSwaps = 0
    for i in 0..<visited.count {
        if visited[i] || sorted[i].offset == i { continue }
        var cycleSize = 0
        var j = i
        while !visited[j] {
            visited[j] = true
            j = sorted[j].offset
            cycleSize += 1
        }
        if cycleSize > 0 {
            minimumSwaps += cycleSize - 1
        }
    }
    return minimumSwaps
}

let test0 = [4, 3, 1, 2]
let test1 = [2, 31, 1, 38, 29, 5, 44, 6, 12, 18, 39, 9, 48, 49, 13, 11, 7, 27, 14, 33, 50, 21, 46, 23, 15, 26, 8, 47, 40, 3, 32, 22, 34, 42, 16, 41, 24, 10, 4, 28, 36, 30, 37, 35, 20, 17, 45, 43, 25, 19]
let test2 = [3, 7, 6, 9, 1, 8, 10, 4, 2, 5]

minimumSwaps(arr: test0) // 3
minimumSwaps(arr: test1) // 46
minimumSwaps(arr: test2) // 9
