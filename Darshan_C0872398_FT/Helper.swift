//
//  Helper.swift
//  Darshan_C0872398_FT
//
//  Created by Darshan Jain on 2022-11-07.
//

import Foundation

var generatedNumbers:[Int] = []

func generateRandomNumber() -> Int {
	var number = 0
	repeat {
		let random = Int.random(in: 1...1000)
		if !generatedNumbers.contains(random) {
			number = random
			generatedNumbers.append(random)
		}
	} while(number == 0 && generatedNumbers.count < 999)
	return number
}
