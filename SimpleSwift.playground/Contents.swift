import CoreFoundation
print("Welcome to the UW Calculator Playground")

func utils() -> (([String]) -> Double, ([String]) -> Double) {
    let avg1 : ([String]) -> Double = {
        (list) in
        var sum = 0.0
        if (list.count == 1 && Int(list[0]) == nil) {
            return 0.0
        }
        for i in list {
            if Int(i) != nil {
                sum += Double(i)!
            }
        }
        return sum / (Double(list.count) - 1)
    }
    
    let fact1 : ([String]) -> Double = {
        (list) in
        if (Int(list[0]) == nil) {
            return 0
        }
        var fact = 1
        var index = 1
        while index <= Int(list[0])! {
            fact *= index
            index += 1
        }
        if list.count <= 1 {
            return 0
        }
        
        return Double(fact)
    }
    
    
    return (avg1, fact1)
}

func switchCase(_ args: [String], _ index: Int, _ avg: ([String]) -> Double, _ fact: ([String]) -> Double) -> Double {
    let operation = args[index]
    var answer = 0.0
    
    switch operation {
    case "+":
        answer = Double(args[0])! + Double(args[2])!
    case "-":
        answer = Double(args[0])! - Double(args[2])!
    case "*":
        answer = Double(args[0])! * Double(args[2])!
    case "/":
        answer = Double(args[0])! / Double(args[2])!
    case "%":
        let leftSide = Double(args[0])!
        let rightSide = Double(args[2])!
        let intAnswer = Int(leftSide) % Int(rightSide)
        answer = Double(intAnswer)
    case "count":
        answer = Double(args.count - 1)
    case "avg":
        answer = avg(args)
    case "fact":
        answer = fact(args)
    default:
        answer = -1.0
        print("error")
    }
    return answer
}

func calculate(_ args: [String]) -> Int {
    
    var maybeAnInteger : Int? = 0
    var index = 0
    var answer = 0.0
    
    let utils = utils()
    let avg = utils.0
    let fact = utils.1

    while maybeAnInteger != nil {
        if index >= args.count {
            maybeAnInteger = nil
        } else {
            if Int(args[index]) == nil {
               answer = switchCase(args, index, avg, fact)
            }
        }
        index += 1
    }
    
    let flooredAnswer = floor(answer)
    return Int(flooredAnswer)
}

func calculate(_ arg: String) -> Int {
    let subSeqArr = arg.split(separator: " ")
    var list : [String] = []
    
    for i in subSeqArr {
        list.append(String(i))
    }
    var maybeAnInteger : Int? = 0
    var index = 0
    var answer = 0.0
    
    let utils = utils()
    let avg = utils.0
    let fact = utils.1

    while maybeAnInteger != nil {
        if index >= list.count {
            maybeAnInteger = nil
        } else {
            if Int(list[index]) == nil {
               answer = switchCase(list, index, avg, fact)
            }
        }
        index += 1
    }
    
    let flooredAnswer = floor(answer)
    return Int(flooredAnswer)
}

// -------------------------------------------
// All of these expressions should return true
// if you have implemented calculate() correctly
//
calculate(["2", "+", "2"]) == 4
calculate(["4", "+", "4"]) == 8
calculate(["2", "-", "2"]) == 0
calculate(["2", "*", "2"]) == 4
calculate(["2", "/", "2"]) == 1
calculate(["2", "%", "2"]) == 0

calculate(["1", "2", "3", "count"]) == 3
calculate(["1", "2", "3", "4", "5", "count"]) == 5
calculate(["count"]) == 0

calculate(["1", "2", "3", "4", "5", "avg"]) == 3
    // 15 / 5 = 3
calculate(["2", "2", "4", "4", "avg"]) == 3
    // 12 / 4 = 3
calculate(["2", "avg"]) == 2
    // 2 / 1 = 2
calculate(["avg"]) == 0
    // 0 / 0 = 0 (not really, but it's an edge case

calculate(["0", "fact"]) == 1
calculate(["1", "fact"]) == 1
calculate(["2", "fact"]) == 2 // 2*1
calculate(["5", "fact"]) == 120 // 5*4*3*2*1
calculate(["fact"]) == 0

calculate("2 + 2") == 4
calculate("2 * 2") == 4
calculate("2 - 2") == 0
calculate("2 / 2") == 1

calculate("1 2 3 4 5 count") == 5
calculate("1 2 3 4 5 avg") == 3
calculate("5 fact") == 120

// -------------------------------------------
// These are extra credit tests; commented out
// uncomment them to turn them on for evaluation

// Implement calculate([String]) and calculate(String)
// to handle negative numbers

calculate(["2", "+", "-2"]) == 0
calculate(["2", "-", "-2"]) == 4
calculate(["2", "*", "-2"]) == -4
calculate(["2", "/", "-2"]) == -1
calculate(["-5", "%", "2"]) == -1

calculate(["1", "-2", "3", "-2", "5", "avg"]) == 1

calculate("2 + -2") == 0
calculate("2 * -2") == -4
calculate("2 - -2") == 4
calculate("-2 / 2") == -1

calculate("1 -2 3 -4 5 count") == 5

// Implement calculate([String]) and calculate(String)
// to use floating-point values

func calculate(_ args: [String]) -> Double {
    var maybeAnInteger : Int? = 0
    var index = 0
    var answer = 0.0
    
    let utils = utils()
    let avg = utils.0
    let fact = utils.1

    while maybeAnInteger != nil {
        if index >= args.count {
            maybeAnInteger = nil
        } else {
            if Double(args[index]) == nil {
                answer = switchCase(args, index, avg, fact)
            }
        }
        index += 1
    }
    
    return answer
}


func calculate(_ arg: String) -> Double {
    let subSeqArr = arg.split(separator: " ")
    var list : [String] = []
    
    for i in subSeqArr {
        list.append(String(i))
    }
    var maybeAnInteger : Int? = 0
    var index = 0
    var answer = 0.0
    
    let utils = utils()
    let avg = utils.0
    let fact = utils.1

    while maybeAnInteger != nil {
        if index >= list.count {
            maybeAnInteger = nil
        } else {
            if Double(list[index]) == nil {
                answer = switchCase(list, index, avg, fact)
            }
        }
        index += 1
    }
    
    return answer
}

calculate(["2.0", "+", "2.0"]) == 4.0
calculate([".5", "+", "1.5"]) == 2.0
calculate(["12.0", "-", "12.0"]) == 0.0
calculate(["2.5", "*", "2.5"]) == 6.25
calculate(["2.0", "/", "2.0"]) == 1.0
calculate(["2.0", "%", "2.0"]) == 0.0
calculate("1.0 2.0 3.0 4.0 5.0 count") == 5.0

