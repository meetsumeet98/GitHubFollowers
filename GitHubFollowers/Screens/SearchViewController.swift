//
//  SearchViewController.swift
//  GitHubFollowers
//
//  Created by Sumeet Bhujang on 27/11/21.
//

import UIKit

class SearchViewController: UIViewController {

    static let alertTitle = "Invalid Username"
    static let alertMessage = "Please enter a valid username, we need to know who to look for 😃."

    let logoImageView = UIImageView()
    let userNameTextField = GFTextField()
    let ctaButton = GFButton(backgroundColor: .systemGreen)

    // MARK:- Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Search"
        configureLogoImageView()
        configureUserNameTextField()
        configureCTAButton()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    // MARK:- Configure

    private func configureLogoImageView() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoImageView)
        logoImageView.image = UIImage(named: "gh-logo")

        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }

    private func configureUserNameTextField() {
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userNameTextField)

        userNameTextField.returnKeyType = .go
        userNameTextField.delegate = self

        // Gesture recognizer to detect tap on main view to dismisses keyboard.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)

        NSLayoutConstraint.activate([
            userNameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            userNameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            userNameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            userNameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func configureCTAButton() {
        ctaButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ctaButton)

        ctaButton.setTitle("Get Followers", for: .normal)
        ctaButton.addTarget(self, action: #selector(pushFollowerListViewController), for: .touchUpInside)

        NSLayoutConstraint.activate([
            ctaButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            ctaButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            ctaButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            ctaButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc
    private func dismissKeyboard() {
        userNameTextField.resignFirstResponder()
    }

    @objc
    private func pushFollowerListViewController() {
        guard let userName =  userNameTextField.text, !userName.isEmpty else {
            presentGFAlertControllerOnMainThread(
                title: SearchViewController.alertTitle,
                description: SearchViewController.alertMessage,
                actionButtonText: "Ok")

            return
        }

        let followerListVC = FollowerListViewController(userName: userName)
        navigationController?.pushViewController(followerListVC, animated: true)
    }
}

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListViewController()
        return true
    }
}
