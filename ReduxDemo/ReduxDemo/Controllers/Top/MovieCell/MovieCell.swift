//
//  MovieCell.swift
//  ReduxDemo
//
//  Created by Quoc Doan M. VN.DaNang on 12/26/21.
//

import UIKit

final class MovieCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    var viewModel: MovieCellViewModel? {
        didSet {
            updateView()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    private func updateView() {
        guard let viewModel = viewModel else {
            return
        }
        movieImageView.setPosterForMovie(viewModel.movie)
        titleLabel.text = viewModel.movie.title
        subtitleLabel.text = viewModel.movie.overview
    }
}
