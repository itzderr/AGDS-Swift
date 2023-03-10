//
//  Recursion.swift
//  Swift-AGDS
//
//  Created by Derrick Park on 2023-03-09.
//

import Foundation

// 1. power(base, exponent): base^exponent
// assume exponent >= 0
func power(base: Int, exponent: Int) -> Int {
  assert(exponent >= 0)
  // base case
  if exponent == 0 { return 1 }
  // recursive case
  return base * power(base: base, exponent: exponent - 1)
}

// 2. isPalindrome(word): checks if a word is palindrome
func isPalindrome(word: String) -> Bool {
  // base case
  if word.count <= 1 { return true }
  // recursice case
  if let first = word.first, let last = word.last, first == last {
    let s = word.index(after: word.startIndex)
    let l = word.index(before: word.endIndex)
    return isPalindrome(word: String(word[s..<l]))
  }
  return false
}

// 3. printBinary(n): prints binary form of given int
func printBinary(_ n: Int) {
  // base case
  printBinaryHelper(n)
}

func printBinaryHelper(_ n: Int, _ padding: String = "") {
  print(padding, #function, n)
  if n < 0 {
    print("-", terminator: "")
    printBinaryHelper(-n, padding + " ")
  }
  // base case
  if n < 2 {
    print(n, terminator: "")
    return
  }
  printBinaryHelper(n / 2, padding + "  ")
  print(n % 2, terminator: "")
}

// 4. reverseLines
// - Print all lines in reverse order (recursively) from a text file
// - You can change the function header if you want
func reverseLines(_ line: Int) {
  let contents = try! String(contentsOfFile: "/Users/park/Desktop/Swift-AGDS/Swift-AGDS/Recursion/story.txt")
  let sentences = contents.split(separator: "\n")
  if line < sentences.count {
    reverseLines(line + 1)
    print(sentences[line])
  }
}

// 5. evaluate
// Write a recursive function evaluate that accepts a string representing a math expression and computes its value.
// - The expression will be "fully parenthesized" and will consist of + and * on single-digit integers only.
// - You can use a helper function. (Do not change the original function header)
// - Use Recursion
//
// Examples)
// evaluate("7")                 -> 7
// evaluate("(2+2)")             -> 4
// evaluate("(1+(2*4))")         -> 9
// evaluate("((1+3)+((1+2)*5))") -> 19
func evaluate(_ expr: String) -> Int {
  var i = 0
  return evaluateHelper(expr, &i)
}

func evaluateHelper(_ expr: String, _ i: inout Int) -> Int {
  // self-similar? yes! math expressions are self-similar
  // base case
  if Character(expr[i]).isNumber {
    return Int(expr[i])!
  } else {
    // operand, operator
    // expression = (ex op ex) => num
    i += 1  // skip (
    let left = evaluateHelper(expr, &i)
    i += 1
    let op = expr[i]
    i += 1
    let right = evaluateHelper(expr, &i)
    i += 1  // skip )
    if op == "+" {
      return left + right
    } else {
      return left * right
    }
  }
}
