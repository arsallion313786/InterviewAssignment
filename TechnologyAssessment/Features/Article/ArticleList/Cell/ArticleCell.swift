//
//  ArticleCell.swift
//  TechnologyAssessment
//
//  Created by Muhammad Arslan Khalid on 15/12/2023.
//

import UIKit
import Kingfisher

class ArticleCell: UITableViewCell {
    
    @IBOutlet private weak var imgV:UIImageView!
    @IBOutlet private weak var lblTitle:UILabel!
    @IBOutlet private weak var lblByLine:UILabel!
    @IBOutlet private weak var lblSource:UILabel!
    @IBOutlet private weak var lblPublishedAt:UILabel!
    
    
    var article:ArticleCellViewModel!{
        didSet{
            self.imgV.kf.setImage(with: article.url)
            self.lblTitle.text = article.title
            self.lblByLine.text = article.byLine
            self.lblSource.text = article.source
            self.lblPublishedAt.text = article.publishDate
        }
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.imgV.layer.cornerRadius = 75/2;
        self.imgV.layer.masksToBounds = true;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
