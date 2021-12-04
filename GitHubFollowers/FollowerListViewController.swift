//
//  FollowerListViewController.swift
//  GitHubFollowers
//
//  Created by Sumeet Bhujang on 29/11/21.
//

import UIKit

class FollowerListViewController: UIViewController {
    let userName: String

    init(userName: String) {
        self.userName = userName
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        title = userName
    }
}
