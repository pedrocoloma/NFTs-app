//
//  FeaturedViewController.swift
//  NFTs
//
//  Created by Pedro Felipe Coloma de Araujo on 19/03/22.
//

import UIKit

class FeaturedViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var viewModel: FeaturedViewModel?
    var items: [NFT] = []
    
    // MARK: - Initializers
    init(viewModel: FeaturedViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: - Overrides Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "featured NFTs"
        setupTableView()
        viewModel?.fetchData()
    }
    
    // MARK: - Private Methods
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.register(UINib(nibName: "FeaturedCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
}
// MARK: - TableView Delegate & DataSource
extension FeaturedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeaturedCell
        cell.nameLabel.text = items[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.didSelect(at: indexPath.row)
    }
}

// MARK: - ViewDelegate
extension FeaturedViewController: FeaturedViewDelegate {
    func isLoadingData() {
        // TODO: show shimmer
    }
    
    func dataLoadedWithSuccess() {
        items = viewModel!.nfts
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func dataLoadedWithErrror(error: AppError) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: "Error loading featured NFTs", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
