//
//  SecondVC.swift
//  PresentStylePractice
//
//  Created by Yulia on 2022/12/16.
//

import Foundation
import UIKit

class SecondVC: UIViewController {
    
    var middleLB: UILabel = {
        let lb = UILabel()
        lb.backgroundColor = .gray
        lb.text = "welcome to Second VC" .uppercased()
        lb.font = UIFont.boldSystemFont(ofSize: 30)
        lb.textColor = .white
        return lb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        setupUI()
    }
    
    
    func setupUI() {
        view.addSubview(middleLB)
        setupLB()
    }
    
    func setupLB() {
        middleLB.centerX(inView: view)
        middleLB.centerY(inView: view)
    }
    
}
