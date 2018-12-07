func arrayManipulation(n: Int, queries: [[Int]]) -> Int {
    var array = Array(repeating: 0, count: n)
    for query in queries {
        let (a, b, k) = (query[0], query[1], query[2])
        array[a-1] += k
        if b < n {
            array[b] -= k
        }
    }
    print(array)
    var sum = 0
    return array.reduce(0) { (maxItem, item) -> Int in
        sum += item
        return max(maxItem, sum)
    }
}

func slowArrayManipulation(n: Int, queries: [[Int]]) -> Int {
    var array = Array(repeating: 0, count: n)
    for query in queries {
        for i in query[0]-1..<query[1] {
            array[i] += query[2]
        }
    }
    print(array)
    return array.max() ?? 0
}

let test0 = [[1, 2, 100], [2, 5, 100], [3, 4, 100]]
let test1 = [[2, 4, 603], [2, 3, 603], [1, 5, 286], [4, 20, 882], [4, 4, 5000], [4, 4, 5]]
let test2 = [[5, 7, 2000], [4, 6, 1000], [1, 3, 100], [1, 2, 100], [1, 2, 100], [4, 5, 5], [7, 8, 200]]


arrayManipulation(n: 5, queries: test0) // 200
slowArrayManipulation(n: 5, queries: test0) // 200

arrayManipulation(n: 20, queries: test1) // 6776
slowArrayManipulation(n: 20, queries: test1) // 6776

arrayManipulation(n: 8, queries: test2) // 3005
slowArrayManipulation(n: 8, queries: test2) // 3005
