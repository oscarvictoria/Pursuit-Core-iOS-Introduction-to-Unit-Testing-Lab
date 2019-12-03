//
//  StarWarsViewController.swift
//  UnitTestingLab
//
//  Created by Oscar Victoria Gonzalez  on 12/2/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class StarWarsViewController: UIViewController {
    
@IBOutlet weak var tableView: UITableView!
    
    var movie = [MovieData]() {
        didSet {
            tableView.dataSource = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        loadData()
        
    }
    
    func loadData() {
        movie = StarWarsData.getData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let movieDVC = segue.destination as? StarWarsDetailViewController,
            let indexPath = tableView.indexPathForSelectedRow else {
                fatalError("error")
        }
        
        let film = movie[indexPath.row]
        movieDVC.movieDescription = film
    }
}

extension StarWarsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        let movies = movie[indexPath.row]
        cell.textLabel?.text = movies.title
        return cell
    }
}

extension StarWarsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
}
