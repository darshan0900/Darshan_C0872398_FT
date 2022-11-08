//
//  ViewController.swift
//  Darshan_C0872398_FT
//
//  Created by Darshan Jain on 2022-11-07.
//

import UIKit

class GameScreen: UIViewController {

	@IBOutlet weak var numberLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		nextGame()
	}
	
	func nextGame() {
		numberLabel.text = String(generateRandomNumber())
	}

	@IBAction func onEvenPress(_ sender: UIButton) {
		verifyAns(isUserResponseEven: true)
	}
	
	@IBAction func onOddPress(_ sender: UIButton) {
		verifyAns(isUserResponseEven: false)
	}
	
	func verifyAns(isUserResponseEven: Bool)  {
		if let number = Int(numberLabel.text!) {
			let isNumberEven = number % 2 == 0
			if isNumberEven == isUserResponseEven {
				print("correct")
			}else{
				print("wrong")
			}
		}else{
			print("wrong")
		}
		nextGame()
	}
	
	@IBAction func onResetPress(_ sender: UIButton) {
	}
	
	@IBAction func onHistoryPress(_ sender: UIButton) {
	}
}

