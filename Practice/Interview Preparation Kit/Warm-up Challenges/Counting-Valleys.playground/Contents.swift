func countingValleys(n: Int, s: String) -> Int {
    var valleysCount = 0
    s.reduce(0) { (count, step) -> Int in
        let count: Int = {
            switch step {
            case "U":
                return count + 1
            case "D":
                return count - 1
            default:
                return count
            }
        }()
        if count == 0 && step == "U" {
            valleysCount += 1
        }
        return count
    }
    return valleysCount
}

let test0 = "UDDDUDUU"
let test1 = "DDUUDDUDUUUD"

countingValleys(n: test0.count, s: test0) // 1
countingValleys(n: test1.count, s: test1) // 2

