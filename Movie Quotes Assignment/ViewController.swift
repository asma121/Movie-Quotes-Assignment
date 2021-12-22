//
//  ViewController.swift
//  Movie Quotes Assignment
//
//  Created by admin on 22/12/2021.
//

import UIKit
import Kingfisher

class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    var moviesCollection = [Movie(name: "Mulan", quote: "The flower that blooms in adversity is the most rare and beautiful of all", image: "https://images-na.ssl-images-amazon.com/images/I/81mbLAxqn9L.jpg"),
                            Movie(name: "Peter Pan", quote: "All it takes is faith and trust", image: "https://flxt.tmsimg.com/assets/p53998_p_v13_af.jpg"),
                            Movie(name: "The Lion King", quote: "The past can hurt. But the way I see it, you can either run from it or learn from it", image: "https://lumiere-a.akamaihd.net/v1/images/p_thelionking_19752_1_0b9de87b.jpeg?region=0%2C0%2C540%2C810"),
                            Movie(name: "The Hunchback of Notre Dame", quote: "Today is a good day to try", image: "https://flxt.tmsimg.com/assets/p18139_p_v10_ab.jpg"),
                            Movie(name: "Cinderella", quote: "Just because it’s what’s done, doesn’t mean it’s what should be done", image: "https://images-na.ssl-images-amazon.com/images/I/918LXIZ5JWL.jpg"),
                            Movie(name: "Frozen", quote: "Some people are worth melting for", image: "https://lumiere-a.akamaihd.net/v1/images/p_frozen_18373_3131259c.jpeg?region=0%2C0%2C540%2C810"),
                            Movie(name: "The Princess and the Frog", quote: "The only way to get what you want in this world is through hard work", image: "https://lumiere-a.akamaihd.net/v1/images/p_theprincessandthefrog_20499_1c5f55a1.jpeg"),
                            Movie(name: "Beauty and the Beast", quote: "Can anybody be happy if they aren’t free?", image: "https://resizing.flixster.com/_sS5KRPtwLqzg4gGci9ZX02hmtY=/ems.ZW1zLXByZC1hc3NldHMvbW92aWVzL2Q1OWQzMzQ0LWY0YTgtNGI1ZS05NjRlLTk5NWMwMjVhYjQ0Yy53ZWJw"),
                            Movie(name: "Ratatouille", quote: "The only thing predictable about life is its unpredictability", image: "https://m.media-amazon.com/images/M/MV5BMTMzODU0NTkxMF5BMl5BanBnXkFtZTcwMjQ4MzMzMw@@._V1_FMjpg_UX1000_.jpg"),
                            Movie(name: "Pinocchio", quote: "Always let your conscience be your guide", image: "https://lumiere-a.akamaihd.net/v1/images/p_pinocchio_19879_d6304938.jpeg")]

    @IBOutlet weak var moviesCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return moviesCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CollectionViewCell
        cell.movieNameLabel.text = moviesCollection[indexPath.row].name
        let URL = URL(string: moviesCollection[indexPath.row].image)
        cell.imageView.kf.setImage(with: URL)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let showVC = self.storyboard?.instantiateViewController(withIdentifier: "ShowViewController") as! ShowViewController
        
        showVC.movieName = moviesCollection[indexPath.row].name
        showVC.movieQuote = moviesCollection[indexPath.row].quote
        
        navigationController?.pushViewController(showVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width * 0.3, height: self.view.frame.height * 0.3)
    }

}

struct Movie {
    var name : String
    var quote:String
    var image:String
}

