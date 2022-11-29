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
    var imageCounter = 0
    var appID = "dtKKqC4Cnqk_7YZZQeV4lvlMoPqXXET2wP5aJAfjlkM"
    var images = [JSON]()
    var imageView = [UIImageView]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = view.subviews.compactMap{$0 as? UIImageView}
        imageView.forEach {$0.alpha = 0}
        creditLabel.layer.cornerRadius = 15
        
        guard let url = URL(string: "https://api.unsplash.com/search/photos?client_id=\(appID)&query=\(category)&per_page=100") else {return}
        
        DispatchQueue.global(qos: .userInteractive).async {
            self.fetch(url)
        }
    }
    
    func fetch(_ url: URL) {
        
        if let data = try? Data(contentsOf: url){
            let json = JSON(data)
            images = json["results"].arrayValue
            downloadImage()
        }
        
    }
    
    func downloadImage() {
        let currentImage = images[imageCounter % images.count]
        
        let imageName = currentImage["urls"]["full"].stringValue
        let imageCredit = currentImage["user"]["name"].stringValue
        
        imageCounter += 1
        
        guard let imageURL = URL(string: imageName) else {return}
        guard let imageData = try? Data(contentsOf: imageURL) else {return}
        
        guard let image = UIImage(data: imageData) else {return}
        
        
        DispatchQueue.main.async {
            self.show(image, credit: imageCredit)
        }
           
    }
    
    func show(_ image: UIImage, credit: String) {
        spinner.stopAnimating()
        
        let imageViewToUse = imageView[imageCounter % imageView.count]
        let otherImageView = imageView[(imageCounter+1) % imageView.count]
        
        UIView.animate(withDuration: 2.0, animations: {
            imageViewToUse.image = image
            imageViewToUse.alpha = 1
            
            self.creditLabel.alpha = 0
            
            self.view.sendSubviewToBack(otherImageView)
        }) { _ in
            self.creditLabel.text = ("   \(credit.uppercased())")
            self.creditLabel.alpha = 1
            otherImageView.alpha = 0
            otherImageView.transform = .identity
            
            UIView.animate(withDuration: 10.0, animations: {
                imageViewToUse.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            }) { _ in
                DispatchQueue.global(qos: .userInteractive).async {
                    self.downloadImage()
                }
            }
        }
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
