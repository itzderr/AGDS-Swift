//
//  Backtracking.swift
//  Swift-AGDS
//
//  Created by Derrick Park on 2023-03-13.
//

import Foundation

func rollDice(_ n: Int) {
  var choices = [Int]()
  rollDiceHelper(n, choices: &choices)
}

func rollDiceHelper(_ n: Int, choices: inout [Int]) {
  // base case: when to stop (no decisions to make)
  if n == 0 {
    print(choices)
  } else {
    // recursive
    // for all possible choices
    for i in 1...6 {
    //   choose one
      choices.append(i)
    //   explore
      rollDiceHelper(n - 1, choices: &choices)
    // un-choose
      choices.removeLast()
    }
  }
}

// Backtracking Problem
func rollDiceSumNaive(_ n: Int, _ sum: Int) {
  var choices = [Int]()
  rollDiceSumHelper(n, sum, &choices)
}

var recCount = 0
func rollDiceSumHelper(_ n: Int, _ sum: Int, _ choices: inout [Int]) {
  recCount += 1
  if n == 0 {
    if sum == 0 {
      print(choices)
    }
  } else {
    for i in 1...6 {
      choices.append(i)
      // reduce the number of recursive calls
      rollDiceSumHelper(n - 1, sum - i, &choices)
      choices.removeLast()
    }
  }
}

// Optimized

func rollDiceSum(_ n: Int, _ sum: Int) {
  var choices = [Int]()
  rollDiceSumBetter(n, sum, 0, &choices)
}

func rollDiceSumBetter(_ n: Int, _ sum: Int, _ soFar: Int, _ choices: inout [Int]) {
  recCount += 1
  if n == 0 {
    if soFar == sum {
      print(choices)
    }
  } else {
    for i in 1...6 {
      if (soFar + i + 1 * (n - 1) <= sum && (soFar + i + 6 * (n - 1) >= sum)) {
        choices.append(i)
        rollDiceSumBetter(n - 1, sum, soFar + i, &choices)
        choices.removeLast()
      }
    }
  }
}
