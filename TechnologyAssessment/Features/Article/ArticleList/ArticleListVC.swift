//
//  ArticleListVC.swift
//  TechnologyAssessment
//
//  Created by Muhammad Arslan Khalid on 15/12/2023.
//

import UIKit
import Combine

class ArticleListVC: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    
    // MARK: Properties
    
    private var viewModelStateCancellable: AnyCancellable?
    private let viewModel:ArticlesListViewModel
    
    
    
    // MARK: Initialization
    required init?(viewModel:ArticlesListViewModel,  coder: NSCoder) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Deinitialization
    
    deinit {
        viewModelStateCancellable = nil
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNib()
        viewModel.viewDidLoad()
        bindViewModel()
        setupUI()
    }
    
    
    private func registerNib(){
        self.tableView.register(UINib(nibName: "ArticleCell", bundle: nil), forCellReuseIdentifier: String(describing: ArticleCell.self))
    }
    
    private func setupUI() {
        title = viewModel.screenTitle
    }
    
    private func bindViewModel() {
        viewModelStateCancellable = viewModel.viewStatePublisher
            .sink {[weak self] state in
                self?.render(state: state)
            }
    }
    
    private func render(state: ArticlesViewState) {
        switch state {
        case .idle:
            break
        case .refreshList:
            tableView.reloadData()
        case let .refreshItemAtIndexPath(indexPath):
            tableView.reloadRows(at: [indexPath], with: .automatic)
        case .showMessageWithTitle(let title, let message):
            showAlertWithTitle(title, message: message)
        }
    }
}

extension ArticleListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension ArticleListVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier = String(describing: ArticleCell.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? ArticleCell
        cell?.article = self.viewModel.articleViewModel(for: indexPath)
        return cell!
    }
}
