//
//  ImageView + Ext.swift
//  ReduxDemo
//
//  Created by Quoc Doan M. VN.DaNang on 12/26/21.
//

import UIKit
import Nuke

extension UIImageView {

    fileprivate var indicator: UIActivityIndicatorView {
        if let indicator = subviews.compactMap({ $0 as? UIActivityIndicatorView }).first {
            return indicator
        }
        let indicator = UIActivityIndicatorView(style: .medium)
        addSubview(indicator)
        addConstraint(NSLayoutConstraint(item: indicator, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
        return indicator
    }

    fileprivate func startLoading() {
        indicator.startAnimating()
    }

    fileprivate func stopLoading() {
        indicator.stopAnimating()
    }

    fileprivate var imageBaseURL: String {
        return "https://image.tmdb.org/t/p/w500"
    }

    func setPosterForMovie(_ movie: Movie) {
        guard let posterPath = movie.posterPath,
              let imageURL = URL(string: "\(imageBaseURL)\(posterPath)") else {
                  return
              }
        let options = ImageLoadingOptions(transition: .fadeIn(duration: 0.33))
        Nuke.loadImage(with: imageURL,
                       options: options,
                       into: self, completion:  { [weak self] _, _ in
            self?.stopAnimating()
        })
    }
}
