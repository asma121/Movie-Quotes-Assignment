//
//  ShowViewController.swift
//  Movie Quotes Assignment
//
//  Created by admin on 22/12/2021.
//

import UIKit

class ShowViewController: UIViewController {
    
    var movieName:String?
    var movieQuote:String?

    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var filmNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let movieName = movieName , let movieQuote = movieQuote {
            filmNameLabel.text = movieName
            quoteLabel.text = movieQuote
        }
    }
    
}
