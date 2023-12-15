//
//  ArticleDetail.swift
//  TechnologyAssessment
//
//  Created by Muhammad Arslan Khalid on 15/12/2023.
//

import UIKit
import Combine
import Kingfisher
class ArticleDetailVC: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet private weak var imgVArticle:UIImageView!
    @IBOutlet private weak var lblTitle:UILabel!
    @IBOutlet private weak var lblAbstract:UILabel!
    @IBOutlet private weak var lblByLine:UILabel!
    @IBOutlet private weak var lblSource:UILabel!
    @IBOutlet private weak var lblPublishedAt:UILabel!
    
    // MARK: Properties
    private var cancelable = Set<AnyCancellable>()
    private let viewModel:ArticleDetailVCViewModel
    required init?(viewModel:ArticleDetailVCViewModel, coder: NSCoder) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.methodsOnViewLoaded()
    }

}

//MARK: - Utility Methods
extension ArticleDetailVC{
    private func methodsOnViewLoaded(){
        self.roundArticleImageView()
        self.addViewModelBinding()
    }
    
    private func roundArticleImageView(){
        self.imgVArticle.layer.cornerRadius = 75/2;
        self.imgVArticle.layer.masksToBounds = true;
    }
    
    private func addViewModelBinding(){
        self.viewModel.$articleDetailViewModel
            .sink {[weak self] data in
                guard let self , let data else {return}
                self.setUI(articleDetailViewModel: data);
            }
            .store(in: &self.cancelable)
    }
    
    private func setUI(articleDetailViewModel:ArticleDetailViewModel){
        self.imgVArticle.kf.setImage(with: articleDetailViewModel.url)
        self.lblTitle.text = articleDetailViewModel.title
        self.lblAbstract.text = articleDetailViewModel.abstract
        self.lblByLine.text = articleDetailViewModel.byLine
        self.lblSource.text = articleDetailViewModel.source
        self.lblPublishedAt.text = articleDetailViewModel.publishDate
    }
}
