//
//  SuccessModalVC.swift
//  SwiftCheckout
//
//  Created by DA MAC  M1 154 on 2023/06/14.
//

import Foundation

import UIKit

class SuccessModalVC: UIViewController {

    // ... Existing code ...

    override func viewDidLoad() {
        super.viewDidLoad()

        // Customize the modal view's background color, layout, labels, buttons, etc.
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        titleLabel.text = "Successfully Registered"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.center = view.center
        titleLabel.textColor = .white
        view.addSubview(titleLabel)
        
        // Add any other UI elements or customize the modal view as needed
    }
    
    // ... Existing code ...
    
}


