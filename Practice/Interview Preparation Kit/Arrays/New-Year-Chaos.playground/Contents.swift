enum Result {
    case success(Int)
    case failure
    
    func printed() {
        switch self {
        case let .success(minimumBribes):
            print(minimumBribes)
        case .failure:
            print("Too chaotic")
        }
    }
}

func minimumBribes(q: [Int]) -> Void {
    var result: Result = .failure
    var minimumBribes = 0
    for item in q.enumerated().reversed() {
        let rhs = item.element
        guard rhs - (item.offset + 1) <= 2 else {
            result = .failure
            result.printed()
            return
        }
        guard max(0, rhs - 2) <= item.offset else { continue }
        for lhs in q[max(0, rhs - 2)...item.offset] {
            if lhs > rhs {
                minimumBribes += 1
                result = .success(minimumBribes)
            }
        }
    }
    result.printed()
}

let test0 = [2, 1, 5, 3, 4]
let test1 = [5, 1, 2, 3, 7, 8, 6, 4]
let test2 = [1, 2, 5, 3, 4, 7, 8, 6]

minimumBribes(q: test0) // 3
minimumBribes(q: test1) // Too chaotic
minimumBribes(q: test2) // 4
