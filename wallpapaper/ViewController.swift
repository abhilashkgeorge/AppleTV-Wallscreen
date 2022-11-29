//
//  ViewController.swift
//  wallpapaper
//
//  Created by Abhilash k George on 28/11/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var categories = ["Airplanes", "Beaches", "Cats", "Cities", "Dogs", "Earth", "Forests", "Galaxies", "Landmarks", "Mountains", "People"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "images") as? ImagesViewController else { return }
        vc.category = categories[indexPath.row]
        present(vc, animated: true )
    }

}

