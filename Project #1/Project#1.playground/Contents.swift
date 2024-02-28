// Prim Number Function
func isPrime(_ number: Int) -> Bool {
    // Return false if number is less than 2, true if exactly 2
    guard number >= 2 else { return false }
    if number == 2 { return true }
    // Return false if number is even, as even numbers greater than 2 are not prime
    if number % 2 == 0 { return false }

    // Only need to check up to half of the number for divisors
    let half = number / 2
    // Optimization for numbers less than 4
    if half < 3 { return true }

    // Check for any divisors other than 1 and the number itself
    for divisor in 3...half where divisor % 2 != 0 {
        if number % divisor == 0 {
            return false
        }
    }
    return true
}


// Greatest Common Demonator
func gcd(_ a: Int, _ b: Int) -> Int {
    // Use the remainder to recursively find the GCD
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

    // Iterate through each character in the expression
    for char in expression {
        // Push opening parentheses onto stack
        if char == "(" {
            stack.append(char)
        } else if char == ")" {
            // Pop from stack if closing parenthesis is found
            if stack.isEmpty {
                return false
            }
            stack.removeLast()
        }
    }

    // Check for any unmatched parentheses
    return stack.isEmpty
}


// Compute the Sum of the powers
func sumOfPowers(n: Int, m: Int) -> Int {
    var sum = 0
    // Calculate the sum of each number from 1 to m raised to the power of n
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

