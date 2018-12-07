extension Array {
    subscript (safe index: Int) -> Element? {
        return (Int(index) >= 0 && Int(index) < count) ? self[Int(index)] : nil
    }
}

func jumpingOnClouds(c: [Int]) -> Int {
    var jumps = 0
    var index = 0
    while index < c.count - 1 {
        jumps += 1
        guard c[safe: index+2] == 0 else {
            index += 1
            continue
        }
        index += 2
    }
    return jumps
}

let test0 = [0, 0, 1, 0, 0, 1, 0]
let test1 = [0, 0, 0, 1, 0, 0]

jumpingOnClouds(c: test0) // 4
jumpingOnClouds(c: test1) // 3
