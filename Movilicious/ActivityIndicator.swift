//
//  ActivityIndicator.swift
//  Movilicious
//
//  Created by ESSA AL on 8/6/20.


import UIKit

class ActivityIndicator {
    var activityIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(style: .whiteLarge)
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.color = .black
        return activity
    }()
    
    // Display the indicator:
    func displayActivity(view: UIView) {
        view.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    // Start spinning the indicator:
    func startAnimating() {
        activityIndicator.startAnimating()
    }
    
    // Stop spinning the indicator and remove it from the view:
    func stopAnimating() {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
}
