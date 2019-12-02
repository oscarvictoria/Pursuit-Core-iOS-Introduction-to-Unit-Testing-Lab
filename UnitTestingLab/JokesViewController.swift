//
//  JokesViewController.swift
//  UnitTestingLab
//
//  Created by Oscar Victoria Gonzalez  on 12/2/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class JokesViewController: UIViewController {
    
@IBOutlet weak var tableView: UITableView!
    
    var theJoke = [Jokes]() {
        didSet {
            tableView.reloadData()
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        theJoke = Jokes.getJokes()
    }
}

extension JokesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        theJoke.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jokesCell", for: indexPath)
        let jokes = theJoke[indexPath.row]
        cell.textLabel?.text = jokes.setup
        return cell
    }
}
