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
        tableView.delegate = self
    }
    
    func loadData() {
        theJoke = Jokes.getJokes()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let jokesDVC = segue.destination as? DetailJokesViewController,
            let indexPath = tableView.indexPathForSelectedRow else {
                fatalError("error")
        }
        let punchline = theJoke[indexPath.row]
        jokesDVC.joke = punchline
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
        cell.backgroundColor = .systemYellow
        return cell
    }
}

extension JokesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 117
    }
}
