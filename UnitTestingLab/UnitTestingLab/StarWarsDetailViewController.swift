//
//  StarWarsDetailViewController.swift
//  UnitTestingLab
//
//  Created by Oscar Victoria Gonzalez  on 12/2/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class StarWarsDetailViewController: UIViewController {
    
    @IBOutlet weak var crawlLabel: UILabel!
    
    var movieDescription: MovieData?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        guard let movieDetail = movieDescription else {
            fatalError("error")
        }
        crawlLabel.text = movieDetail.opening_crawl.replacingOccurrences(of:"\r\n", with: " ")
    }
 

}
