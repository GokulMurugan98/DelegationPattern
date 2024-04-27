//
//  ViewController.swift
//  DelegatePattern
//
//  Created by Gokul Murugan on 19/04/24.
//

import UIKit

class MainViewController: UIViewController,NameChangeDelegate {

    private let nameLabel:UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.textColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let goToNextScreenButton:UIButton = {
        let button = UIButton()
        button.setTitle("Go to next screen", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(nameLabel)
        view.addSubview(goToNextScreenButton)
        goToNextScreenButton.addTarget(self, action: #selector(goToNextScreen) , for: .touchUpInside)
        
        NSLayoutConstraint.activate([
                   nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                   nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                   goToNextScreenButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
                   goToNextScreenButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
               ])
           
        // Do any additional setup after loading the view.
    }
    
    func changeNameInMain(name: String) {
        nameLabel.text = "Hello!!! \(name)"
    }

    @objc func goToNextScreen(){
        let vc = SecondViewController()
        vc.delegate = self
       present(vc, animated: true)
    }

}

