//
//  DetailJokesViewController.swift
//  UnitTestingLab
//
//  Created by Oscar Victoria Gonzalez  on 12/2/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class DetailJokesViewController: UIViewController {
    
@IBOutlet weak var punchLineLabel: UILabel!
    
   var joke: Jokes?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        view.backgroundColor = .green

    }
    
    func updateUI() {
        guard let jokes = joke else {
            fatalError("error")
        }
        punchLineLabel.text = jokes.punchline
    }
 

}
