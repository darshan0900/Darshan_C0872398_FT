//
//  RecordScreen.swift
//  Darshan_C0872398_FT
//
//  Created by Darshan Jain on 2022-11-07.
//

import UIKit

class RecordScreen: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	
	var data: [RecordItem] = []
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
	
}

extension RecordScreen: UITableViewDelegate, UITableViewDataSource{
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return data.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: "recordItem") as? RecordItemCell{
			let item = data[indexPath.row]
			
			cell.descriptionLabel.text = "\(item.number) is " + (item.isUserResponseEven ? "Even" : "Odd")
			cell.imageLabel.image = item.isCorrect ? UIImage(named: "correct") : UIImage(named: "incorrect")
			
			return cell
		}
		return UITableViewCell()
	}
	
	
}
