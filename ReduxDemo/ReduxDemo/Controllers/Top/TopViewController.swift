//
//  TopViewController.swift
//  ReduxDemo
//
//  Created by Quoc Doan M. VN.DaNang on 12/23/21.
//

import UIKit

final class TopViewController: UIViewController {

    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var logoutButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TOP"
    }

    @IBAction private func logoutButtonTouchUpInside(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
