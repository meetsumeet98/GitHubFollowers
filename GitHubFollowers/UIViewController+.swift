//
//  UIViewController+.swift
//  GitHubFollowers
//
//  Created by Sumeet Bhujang on 04/12/21.
//

import UIKit

extension UIViewController {

    func presentGFAlertControllerOnMainThread(title: String,
                                              description: String?,
                                              actionButtonText: String?) {
        DispatchQueue.main.async {
            let alertVC = GFAlertViewController(
                titleText: title,
                descriptionText: description,
                actionButtonText: actionButtonText)
            
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve // For a nice fade-in fade-out animation

            self.present(alertVC, animated: true)
        }
    }
}
