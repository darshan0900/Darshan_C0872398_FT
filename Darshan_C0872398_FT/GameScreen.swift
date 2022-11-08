//
//  ViewController.swift
//  Darshan_C0872398_FT
//
//  Created by Darshan Jain on 2022-11-07.
//

import UIKit

class GameScreen: UIViewController {

	@IBOutlet weak var numberLabel: UILabel!
	@IBOutlet weak var imageLabel: UIImageView!
	
	private var records: [RecordItem] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		nextGame()
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
			let isCorrect = isNumberEven == isUserResponseEven
			records.append(RecordItem(number: number, isEven: isNumberEven, isCorrect: isCorrect))
			var title = ""
			var message = ""
			if isCorrect{
				title = "Congrats!"
				message = "Your answer is correct."
				imageLabel.image = UIImage(named: "correct")
			} else{
				title = "Oops!"
				let correctAns = isNumberEven ? "Even" : "Odd"
				message = "Your answer is wrong. Correct ans is \(correctAns)"
				imageLabel.image = UIImage(named: "incorrect")
			}
			let nextGameAction = UIAlertAction(title: "Next Game", style: .default){ _ in
				self.nextGame()
			}
			let showProgressAction = UIAlertAction(title: "Show Progress", style: .default){ _ in
				self.showHistory()
			}
			showAlert(title:title, message: message, actions: [nextGameAction, showProgressAction])
		}
	}
	
	@IBAction func onResetPress(_ sender: UIButton) {
		resetGame()
	}
	
	@IBAction func onHistoryPress(_ sender: UIButton) {
	}
	
	func nextGame() {
		imageLabel.image = nil
		numberLabel.text = String(generateRandomNumber())
	}

	func resetGame() {
		generatedNumbers.removeAll()
		records.removeAll()
	}
	
	func showHistory() {
		
	}
	
	func showAlert(title: String, message: String, actions: [UIAlertAction]) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		for action in actions {
			alert.addAction(action)
		}
		present(alert, animated: true, completion:nil)
	}
}

