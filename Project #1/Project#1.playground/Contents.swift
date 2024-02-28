// Prim Number Function
func isPrime(_ number: Int) -> Bool {
    guard number >= 2 else { return false }
    if number == 2 { return true }
    if number % 2 == 0 { return false }

    let half = number / 2
    if half < 3 { return true }

    for divisor in 3...half where divisor % 2 != 0 {
        if number % divisor == 0 {
            return false
        }
    }
    return true
}

// Greatest Common Demonator
func gcd(_ a: Int, _ b: Int) -> Int {
    let r = a % b
    if r != 0 {
        return gcd(b, r)
    } else {
        return b
    }
}

// verify Equal number of closing and opening parenthesis
func verifyParenthesis(expression: String) -> Bool {
    var stack = [Character]()

    for char in expression {
        if char == "(" {
            stack.append(char)
        } else if char == ")" {
            if stack.isEmpty {
                return false
            }
            stack.removeLast()
        }
    }

    return stack.isEmpty
}

// Compute the Sum of the powers
func sumOfPowers(n: Int, m: Int) -> Int {
    var sum = 0
    for i in 1...m {
        var power = 1
        for _ in 1...n {
            power *= i
        }
        sum += power
    }
    return sum
}


//Main function to test print everythnig
func main(){
    print(isPrime(10)) // Output: false
    print(gcd(8, 12))  // Output: 4
    print(verifyParenthesis(expression: "()")) // Output: true
    print(verifyParenthesis(expression: "((")) // Output: false
    print(sumOfPowers(n: 3, m: 3))  // Output: 36
}

main()

