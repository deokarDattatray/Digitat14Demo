//
//  DDImageView.swift
//  Digitat14Demo
//
//  Created by Dattatray Deokar on 09/08/21.
//

import UIKit
import AlamofireImage

class DDImageView: UIView {
    
    @IBOutlet weak fileprivate var imageView: UIImageView!
    @IBOutlet weak fileprivate var favoriteImageView: UIImageView!
    @IBOutlet weak fileprivate var contentView: UIView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("DDImageView", owner: self, options: nil)
        self.addSubview(self.contentView)
        self.contentView?.frame = self.bounds
        self.contentView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        Bundle.main.loadNibNamed("DDImageView", owner: self, options: nil)
        self.addSubview(self.contentView)
        self.contentView?.frame = self.bounds
        self.contentView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func roundCorners(cornerRadius:CGFloat = 8.0){
        self.imageView?.layer.cornerRadius = cornerRadius
    }
    
    public var image:UIImage?{
        set{
            self.imageView?.image = newValue
        }
        get{
            return  self.imageView?.image
        }
    }
    
    public var isFavorite:Bool = false{
        didSet{
            self.favoriteImageView?.isHidden = !self.isFavorite
        }
    }
    
    public func setImage(image:UIImage?, isFavorite:Bool){
        self.imageView?.image = image
        self.isFavorite = isFavorite
    }
    
    public func setImage(imageName:String, isFavorite:Bool){
        self.setImage(image: UIImage(named: imageName), isFavorite: isFavorite)
    }
    
    public func setImage(systemName:String, isFavorite:Bool){
        self.setImage(image: UIImage(systemName: systemName), isFavorite: isFavorite)
    }
    
    public func setImage(imageUrl:URL, isFavorite:Bool){
        self.imageView?.af.setImage(withURL: imageUrl)
        self.isFavorite = isFavorite
    }
}
