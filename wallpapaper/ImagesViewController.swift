//
//  ImagesViewController.swift
//  wallpapaper
//
//  Created by Abhilash k George on 30/11/22.
//

import UIKit

class ImagesViewController: UIViewController {

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var creditLabel: UILabel!
    
    var category = ""
    
    var appID = "dtKKqC4Cnqk_7YZZQeV4lvlMoPqXXET2wP5aJAfjlkM"
    var images = [JSON]()
    var imageView = [UIImageView]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func fetch(_ url: URL) {
        
    }
    
    func downloadImage() {
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
