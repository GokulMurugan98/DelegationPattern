//
//  SecondViewController.swift
//  DelegatePattern
//
//  Created by Gokul Murugan on 19/04/24.
//

import UIKit

protocol NameChangeDelegate{
    func changeNameInMain(name:String)   
}

class SecondViewController: UIViewController {
    
    var delegate:NameChangeDelegate?
    
    private let changeName:UIButton = {
        let button = UIButton()
        button.setTitle("Change Name", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let name:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Please enter your name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(changeName)
        view.addSubview(name)
        view.backgroundColor = .yellow
        changeName.addTarget(self, action: #selector(changeNameInMainScreen), for: .touchUpInside)
        NSLayoutConstraint.activate([
            changeName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeName.centerYAnchor.constraint(equalTo: view.topAnchor,constant: 100),
            name.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            name.centerYAnchor.constraint(equalTo: view.topAnchor,constant: 50)
        ])
    }
    
    @objc func changeNameInMainScreen(){
        if let name = name.text{
            delegate?.changeNameInMain(name: name)
            self.dismiss(animated: true)
        }
    }
}
