//
//  GFAlertViewController.swift
//  GitHubFollowers
//
//  Created by Sumeet Bhujang on 04/12/21.
//

import UIKit

class GFAlertViewController: UIViewController, GFAlertViewDelegate {

    private let alertViewModel: GFAlertViewModel
    private let alertView = GFAlertView()

    // MARK:- Inits

    init(titleText: String, descriptionText: String?, actionButtonText: String?) {
        alertViewModel = GFAlertViewModel(
            titleText: titleText,
            descriptionText: descriptionText,
            actionButtonText: actionButtonText)

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        configureAlertView()
    }

    private func configureAlertView() {
        alertView.delegate = self
        view.addSubview(alertView)
        alertView.inflate(with: alertViewModel)

        // Constraints
        alertView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            alertView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            alertView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            alertView.widthAnchor.constraint(equalToConstant: 280),
            alertView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }

    // MARK:- GFAlertViewDelegate

    func didTapAlertActionButton() {
        dismiss(animated: true)
    }
}
