extension Array {
    func rotateLeft(offset: Int) -> [Element] {
        let properOffset = offset % self.count
        let result = self[properOffset...] + self[..<properOffset]
        return Array(result)
    }
}

func rotLeft(a: [Int], d: Int) -> [Int] {
    return a.rotateLeft(offset: d)
}

let test0 = (a: [1, 2, 3, 4, 5], d: 4)
let test1 = (a: [41, 73, 89, 7, 10, 1, 59, 58, 84, 77, 77, 97, 58, 1, 86, 58, 26, 10, 86, 51], d: 10)
let test2 = (a: [33, 47, 70, 37, 8, 53, 13, 93, 71, 72, 51, 100, 60, 87, 97], d: 13)

rotLeft(a: test0.a, d: test0.d) // [5, 1, 2, 3, 4]
rotLeft(a: test1.a, d: test1.d) // [77, 97, 58, 1, 86, 58, 26, 10, 86, 51, 41, 73, 89, 7, 10, 1, 59, 58, 84, 77]
rotLeft(a: test2.a, d: test2.d) // [87, 97, 33, 47, 70, 37, 8, 53, 13, 93, 71, 72, 51, 100, 60]
