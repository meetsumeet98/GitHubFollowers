//
//  GFAlertView.swift
//  GitHubFollowers
//
//  Created by Sumeet Bhujang on 04/12/21.
//

import UIKit

protocol GFAlertViewDelegate {

    func didTapAlertActionButton()
}

class GFAlertView: UIView {

    private static let padding: CGFloat = 20

    private let titleLabel = GFTitleLabel(textAlignment: .center, fontSize: 20)
    private let descriptionLabel = GFDescriptionLabel(textAlignment: .center)
    private let actionButton = GFButton(backgroundColor: .systemPink)

    var delegate: GFAlertViewDelegate?

    // MARK:- Inits

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK:- Setup

    private func setup() {
        setupViewHierarchy()
        stylizeView()
        setupConstraints()

        actionButton.addTarget(self, action: #selector(didTapActionButton), for: .touchUpInside)
    }

    private func setupViewHierarchy() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(actionButton)
    }

    private func stylizeView() {
        backgroundColor = .systemBackground
        layer.cornerRadius = 16
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor

        descriptionLabel.numberOfLines = 4
    }

    private func setupConstraints() {
        var constraints = [NSLayoutConstraint]()

        // Title label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        constraints.append(contentsOf: [
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: GFAlertView.padding),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: GFAlertView.padding),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -GFAlertView.padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])

        // Action button
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        constraints.append(contentsOf: [
            actionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: GFAlertView.padding),
            actionButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -GFAlertView.padding),
            actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -GFAlertView.padding),
            actionButton.heightAnchor.constraint(equalToConstant: 48)
        ])

        // Description label
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        constraints.append(contentsOf: [
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: GFAlertView.padding),
            descriptionLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -GFAlertView.padding)
        ])

        NSLayoutConstraint.activate(constraints)
    }

    func inflate(with viewModel: GFAlertViewModel) {
        titleLabel.text = viewModel.titleText
        descriptionLabel.text = viewModel.descriptionText
        actionButton.setTitle(viewModel.actionButtonText ?? "Ok", for: .normal)
    }

    @objc
    private func didTapActionButton() {
        delegate?.didTapAlertActionButton()
    }
}
