enum Result {
    case success
    case failure
    
    var printed: String {
        switch self {
        case .success:
            return "YES"
        case .failure:
            return "NO"
        }
    }
}

func twoStrings(s1: String, s2: String) -> String {
    let s1 = Set(s1)
    let s2 = Set(s2)
    if s1.isDisjoint(with: s2) {
        return Result.failure.printed
    } else {
        return Result.success.printed
    }
}

let test0 = (s1: "hello", s2: "world")
let test1 = (s1: "hi", s2: "world")

twoStrings(s1: test0.s1, s2: test0.s2) // YES
twoStrings(s1: test1.s1, s2: test1.s2) // NO
