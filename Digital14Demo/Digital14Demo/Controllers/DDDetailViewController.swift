//
//  DDDetailViewController.swift
//  Digitat14Demo
//
//  Created by Dattatray Deokar on 09/08/21.
//

import UIKit
protocol DDDetailViewControllerDelegate: AnyObject {
    func favoriteTapped(item:DDListItem)
}
class DDDetailViewController: UIViewController {

    @IBOutlet fileprivate weak var imageView: DDImageView!
    @IBOutlet fileprivate weak var timestampLabel: UILabel!
    @IBOutlet fileprivate weak var addressLabel: UILabel!
    @IBOutlet fileprivate var favoriteButton: UIBarButtonItem!
    var item:DDListItem?
    weak var delegate:DDDetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.backBarButtonItem = UIBarButtonItem()
        self.title = self.item?.title ?? ""
        self.imageView?.roundCorners(cornerRadius: 12.0)
        self.addressLabel?.text = self.item?.location
        self.timestampLabel?.text = self.item?.timestamp
        self.configureFavoriteButton()
        if let imageUrl = self.item?.imageUrl, let url = URL(string: imageUrl){
            self.imageView?.setImage(imageUrl: url, isFavorite: false)
        }else{
            self.imageView?.isFavorite = false
            self.imageView?.image = nil
        }
    }
    
    @IBAction func favoriteTapped(_ sender: UIBarButtonItem) {
        self.item?.isFavourite.toggle()
        self.configureFavoriteButton()
        guard let item = self.item else { return  }
        self.delegate?.favoriteTapped(item: item)
    }
    
    fileprivate func configureFavoriteButton(){
        let isFavorite = self.item?.isFavourite ?? false
        let systemName = isFavorite ? "heart.fill" : "heart"
        let image = UIImage(systemName: systemName)
        let button = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(favoriteTapped(_:)))
        button.tintColor = .red
        self.navigationItem.rightBarButtonItems = [button]
        self.favoriteButton = button
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
