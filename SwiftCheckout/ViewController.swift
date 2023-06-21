//
//  ViewController.swift
//  SwiftCheckout
//


//  Created by DA MAC M1 126 on 2023/06/05.
//

import UIKit
import SwiftUI


class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let contentView = ContentView()
        let hostingController = UIHostingController(rootView: contentView)
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        hostingController.didMove(toParent: self)
    }
}

struct ContentView: View {
    @State private var counter = 0

    var body: some View {
        VStack {
            Text("Counter: \(counter)")
                .font(.title)
            
            Button("Increment") {
                counter += 1
            }
            
            Button("Decrement") {
                counter -= 1
            }
        }
    }
}


//class ViewController: UIViewController {
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//            }
    


