//
//  HalfViewController.swift
//  PresentStylePractice
//
//  Created by Yulia on 2022/12/19.
//

import Foundation
import UIKit

class HalfViewController: UIViewController {
    
    var blackView = UIView(frame: UIScreen.main.bounds)
    
    var halfView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemMint
        
        return view
    }()
    
    var closeBtn: UIButton = {
        let btn = UIButton(type: .close)
        return btn
    }()
    
   // MARK: - LifeCyle
    override func viewDidLoad() {
        view.backgroundColor = .clear
        setupUI()
        blackViewDynamic()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tappedToDismiss()
    }
    
    // MARK: - helper
    private func setupUI() {
        view.addSubview(halfView)
        halfView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor,
                        right: view.rightAnchor, paddingLeft: 0,
                        paddingBottom: 0, paddingRight: 0, height: 400)
        cornerRadius()
        setupBtn()
    }
    
    private func cornerRadius() {
        halfView.layer.cornerRadius = 30
        halfView.clipsToBounds = true
        halfView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    private func blackViewDynamic() {
           blackView.backgroundColor = .black
           blackView.alpha = 0
           blackView.isUserInteractionEnabled = true
           presentingViewController?.view.addSubview(blackView)
           UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0) {
               self.blackView.alpha = 0.3
           }
    }
    
    func setupBtn() {
        view.addSubview(closeBtn)
        closeBtn.anchor(top: halfView.topAnchor, right: halfView.rightAnchor,
                        paddingTop: 15, paddingRight: 15)
        closeBtn.addTarget(self, action: #selector(tapToClose), for: .touchUpInside)
    }
    
    @objc func tapToClose() {
        self.dismiss(animated: true)
    }
    
    @objc private func tappedToDismiss() {
         blackView.removeFromSuperview()
         navigationController?.popViewController(animated: true)
         let presentVC = self.presentingViewController
         presentVC?.tabBarController?.tabBar.isHidden = false
         dismiss(animated: true, completion: nil)
     }
    
}

