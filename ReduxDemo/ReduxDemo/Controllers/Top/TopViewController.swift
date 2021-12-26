//
//  TopViewController.swift
//  ReduxDemo
//
//  Created by Quoc Doan M. VN.DaNang on 12/23/21.
//

import UIKit
import ReSwift

final class TopViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!

    var viewModel: TopViewModel = TopViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainStore.subscribe(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TOP"
        tableView.register(UINib(nibName: Define.indentifier, bundle: nil), forCellReuseIdentifier: Define.indentifier)
        mainStore.dispatch(viewModel.fetchUpcomingMovies)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        mainStore.unsubscribe(self)
    }}

extension TopViewController: StoreSubscriber {
    func newState(state: AppState) {
        viewModel.movies = state.movieState.movies
        tableView.reloadData()
    }
}

extension TopViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Define.heightForCell
    }
}

extension TopViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Define.indentifier, for: indexPath) as? MovieCell else { return UITableViewCell() }
        cell.viewModel = viewModel.cellForRow(at: indexPath)
        return cell
    }
}

extension TopViewController {
    
    private struct Define {
        static let indentifier = "MovieCell"
        static let heightForCell: CGFloat = 100
    }
}
