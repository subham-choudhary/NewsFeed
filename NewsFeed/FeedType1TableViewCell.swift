//
//  FeedType1TableViewCell.swift
//  NewsFeed
//
//  Created by Subham on 14/05/19.
//  Copyright © 2019 Subham. All rights reserved.
//

import UIKit
enum ImageType {
    case creator
    case content
}
class FeedType1TableViewCell: UITableViewCell {
    
    @IBOutlet weak var creatorImage: UIImageView!
    @IBOutlet weak var creatorName: UILabel!
    @IBOutlet weak var creatorCompany: UILabel!
    @IBOutlet weak var articleTime: UILabel!
    @IBOutlet weak var articleContent: UILabel!
    @IBOutlet weak var likesCount: UILabel!
    @IBOutlet weak var commentCount: UILabel!
    @IBOutlet weak var articleLocation: UILabel!
    @IBOutlet weak var contentImage: UIImageView!
    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    var contentImageDefaultHeight: CGFloat = 323

    func configure(model: ArticleAndCreator) {
        creatorName.text = model.creator.name
        creatorCompany.text = model.creator.company
        likesCount.text = "\(model.article.likes?.count ?? 0) Likes"
        commentCount.text = "\(model.article.comments?.count ?? 0) Comments"
        articleLocation.text = model.article.city
        imageHeight.constant = contentImageDefaultHeight
        setImage(urlString: model.creator.imageLoc, imageType: .creator)
        setImage(urlString: model.article.imageLoc, imageType: .content)
        if let content = model.article.content.value() as? [String] {
            articleContent.text = content.first
        } else if let content = model.article.content.value() as? String {
            articleContent.text = content
        }
        layoutSubviews()
    }
    
    private func setImage(urlString: String?, imageType: ImageType) {
        guard let urlString = urlString else {
            if imageType == .content {
                imageHeight.constant = 0
            }
            return
        }
        if let image = Utility.shared.imageCache.object(forKey:NSString(string: urlString)) {
            switch imageType {
            case .content:
                contentImage.image = image
                setContentImageHeight()
            case .creator:
                creatorImage.image = image
            }
        } else {
            DispatchQueue.global(qos: .background).async {
                if let url = URL(string:(urlString)) {
                    URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                        if error != nil {
                            print(error!)
                            return
                        }
                        guard let data = data, let image = UIImage(data: data) else {
                            return
                        }
                        DispatchQueue.main.async { [weak self] in
                            Utility.shared.imageCache.setObject(image, forKey: NSString(string: urlString))
                            switch imageType {
                            case .content:
                                self?.contentImage.image = image
                                self?.setContentImageHeight()
                            case .creator:
                                self?.creatorImage.image = image
                            }
                        }
                    }).resume()
                }
            }
        }
    }
    
    func setContentImageHeight() {
        let ratio = contentImage.image!.size.width / contentImage.image!.size.height
        let newHeight = contentImage.frame.width / ratio
        imageHeight.constant = newHeight
        layoutIfNeeded()
    }
}
