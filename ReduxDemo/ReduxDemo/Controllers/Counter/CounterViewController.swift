//
//  LoginViewController.swift
//  ReduxDemo
//
//  Created by Quoc Doan M. VN.DaNang on 12/23/21.
//

import UIKit
import ReSwift

class CounterViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "COUNTER NUMBER"
        mainStore.subscribe(self)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        mainStore.unsubscribe(self)
    }

    @IBAction private func increase(_ sender: UIButton) {
        mainStore.dispatch(CounterAction.Increase())
    }

    @IBAction private func decrease(_ sender: UIButton) {
        mainStore.dispatch(CounterAction.Decrease())
    }

    @IBAction private func reset(_ sender: UIButton) {
        mainStore.dispatch(CounterAction.Reset())
    }
}

extension CounterViewController: StoreSubscriber {
    func newState(state: AppState) {
        titleLabel.text = "\(mainStore.state.counterState.counter)"
    }
}
