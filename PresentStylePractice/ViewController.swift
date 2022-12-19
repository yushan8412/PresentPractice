//
//  ViewController.swift
//  PresentStylePractice
//
//  Created by Yulia on 2022/12/16.
//

import UIKit

class ViewController: UIViewController {
    
    var middleLB: UILabel = {
        let lb = UILabel()
        lb.backgroundColor = .systemCyan
        lb.text = " welcome " .uppercased()
        lb.font = UIFont.boldSystemFont(ofSize: 20)
        lb.textColor = .white
        return lb
    }()
    
    var goNextBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .lightGray
        btn.setTitle(" basic present " .uppercased(), for: .normal)
        return btn
    }()
    
    var pushToNextBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .lightGray
        btn.setTitle(" Push to next page " .uppercased(), for: .normal)
        return btn
    }()
    
    var pushHalfViewBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .lightGray
        btn.setTitle(" to half view " .uppercased(), for: .normal)
        return btn
    }()
    
    var popViewBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .lightGray
        btn.setTitle(" pop the view " .uppercased(), for: .normal)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    func setupUI() {
        setupLB()
        setupBtn()
    }
    
    func setupLB() {
        view.addSubview(middleLB)
        middleLB.anchor(top: view.topAnchor, paddingTop: 200)
        middleLB.centerX(inView: view)
//        middleLB.centerY(inView: view)
    }
    
    func setupBtn() {
        view.addSubview(goNextBtn)
        view.addSubview(pushToNextBtn)
        view.addSubview(pushHalfViewBtn)
        view.addSubview(popViewBtn)
        goNextBtn.anchor(top: middleLB.bottomAnchor, paddingTop: 20, height: 30)
        goNextBtn.centerX(inView: middleLB)
        goNextBtn.addTarget(self, action: #selector(goByBasicPresent), for: .touchUpInside)
        
        pushToNextBtn.anchor(top: goNextBtn.bottomAnchor, paddingTop: 20, height: 30)
        pushToNextBtn.centerX(inView: middleLB)
        pushToNextBtn.addTarget(self, action: #selector(goByPushToNext), for: .touchUpInside)
        
        pushHalfViewBtn.anchor(top: pushToNextBtn.bottomAnchor, paddingTop: 20, height: 30)
        pushHalfViewBtn.centerX(inView: middleLB)
        pushHalfViewBtn.addTarget(self, action: #selector(goHalfView), for: .touchUpInside)
        
        popViewBtn.anchor(top: pushHalfViewBtn.bottomAnchor, paddingTop: 20, height: 30)
        popViewBtn.centerX(inView: middleLB)
        popViewBtn.addTarget(self, action: #selector(popTheView), for: .touchUpInside)
    }
    
    @objc func goByBasicPresent() {
        let vc = SecondVC()
        vc.title = "Basic present"
        let rootVc = UINavigationController(rootViewController: vc)
        present(rootVc, animated: true)
    }
    
    @objc func goByPushToNext() {
        let vc = UIViewController()
        vc.view.backgroundColor = .yellow
        vc.title = "PUSH"
        //使用這個需要先 embed in navigation controller
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func goHalfView() {
        let vc = HalfViewController()
        vc.title = "Half"
        // 目標 VC present 的方式
        vc.modalPresentationStyle = .overCurrentContext
        navigationController?.present(vc, animated: true)
    }
    
    @objc func popTheView() {
        let vc = PopViewController()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true)
    }


}

