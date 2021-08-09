//
//  DDSeatGeekListTableViewCell.swift
//  Digitat14Demo
//
//  Created by Dattatray Deokar on 09/08/21.
//

import UIKit
import Alamofire

class DDSeatGeekListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var pictureView: DDImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.pictureView?.roundCorners()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.nameLabel?.text = nil
        self.addressLabel?.text = nil
        self.timestampLabel?.text = nil
        self.pictureView?.image = nil
    }

    func loadData(name:String?, address:String?,timestamp:String?,imageUrl:String?, isFavorite:Bool){
        self.nameLabel?.text = name
        self.addressLabel?.text = address
        self.timestampLabel?.text = timestamp
        if let imageUrl = imageUrl, let url = URL(string: imageUrl){
            self.pictureView?.setImage(imageUrl: url, isFavorite: isFavorite)
        }
    }
    
    class var ReuseIdentifier:String{
        return "DDSeatGeekListTableViewCell"
    }
    
    class var Nib:UINib{
        return UINib(nibName: DDSeatGeekListTableViewCell.ReuseIdentifier, bundle: .main)
    }

}


