import CoreFoundation
print("Welcome to the UW Calculator Playground")

func calculate(_ args: [String]) -> Int {
    
    func avg(_ list : [Int]) -> Int {
        return 1
    }
    
    let avg : ([String]) -> Int = {
        (list) in
        var sum = 0;
        for i in list {
            if Int(i) != nil {
                sum += Int(i)!
            }
        }
        return sum / list.count
    }
    
    var maybeAnInteger : Int? = 0
    var index = 0
    var answer = 0

    while maybeAnInteger != nil {
        if index >= args.count {
            maybeAnInteger = nil
        } else {
            if Int(args[index]) == nil {
                let operation = args[index]
                switch operation {
                case "+":
                    answer = Int(args[0])! + Int(args[2])!
                case "-":
                    answer = Int(args[0])! - Int(args[2])!
                case "*":
                    answer = Int(args[0])! * Int(args[2])!
                case "/":
                    answer = Int(args[0])! / Int(args[2])!
                case "%":
                    answer = Int(args[0])! % Int(args[2])!
                case "count":
                    answer = args.count - 1
                case "avg":
                    answer = avg(args)
                    print(answer)
                case "fact":
                    answer = -1
                    print("fact")
                default:
                    answer = -1
                    print("error")
                }
            }
        }
        index += 1
    }
    
    return answer
}

func calculate(_ arg: String) -> Int {
    return -1
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
/*
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
*/
 
// Implement calculate([String]) and calculate(String)
// to use floating-point values
/*
func calculate(_ args: [String]) -> Double {
    return -1.0
}
func calculate(_ arg: String) -> Double {
    return -1.0
}

calculate(["2.0", "+", "2.0"]) == 4.0
calculate([".5", "+", "1.5"]) == 2.0
calculate(["12.0", "-", "12.0"]) == 0.0
calculate(["2.5", "*", "2.5"]) == 6.25
calculate(["2.0", "/", "2.0"]) == 1.0
calculate(["2.0", "%", "2.0"]) == 0.0
calculate("1.0 2.0 3.0 4.0 5.0 count") == 5
*/


