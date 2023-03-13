//
//  ExhaustiveSearch.swift
//  Swift-AGDS
//
//  Created by Derrick Park on 2023-03-10.
//

import Foundation

func printBinaryExhaustiveSearch(_ n: Int) {
  printBinaryExhaustiveSearchHelper(n)
}

func printBinaryExhaustiveSearchHelper(_ n: Int, _ soFar: String = "") {
  if n == 0 { // no more digits to print
    print(soFar)
  } else {
    // for each available choices (0 or 1)
    for i in 0...1 {
      //   choose one
      let c = i
      //   search
      printBinaryExhaustiveSearchHelper(n - 1, soFar + "\(c)")
    }
  }
}

/// Print all decimal number representation with n digits
/// - Parameter n: the number digits
func printDecimal(_ n: Int, _ soFar: String = "") {
  if n == 0 {
    print(soFar)
  } else {
    for i in 0...9 {
      printDecimal(n - 1, soFar + "\(i)")
    }
  }
}

func permutation(_ word: String, _ soFar: String = "") {
  if word.count == 0 {
    print(soFar)
  } else {
    for i in 0..<word.count {
      let c = word[i]
      permutation(word[0, i] + word[i+1, word.count], soFar + c)
    }
  }
}

func permutationUnique(_ word: String, _ soFar: String = "", _ set: inout Set<String>) {
  if word.count == 0 {
    set.insert(soFar)
  } else {
    for i in 0..<word.count {
      let c = word[i]
      permutationUnique(word[0, i] + word[i+1, word.count], soFar + c, &set)
    }
  }
}

