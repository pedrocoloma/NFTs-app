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
    
    let items: [String] = []
    
    // MARK: - Overrides Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "alguma coisa"
        setupTableView()
    }
    
    // MARK: - Private Methods
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.register(UINib(nibName: "FeaturedCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
}

extension FeaturedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeaturedCell
        cell.nameLabel.text = items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
