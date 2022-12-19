//
//  PopViewController.swift
//  PresentStylePractice
//
//  Created by Yulia on 2022/12/19.
//

import Foundation
import UIKit

class PopViewController: UIViewController {
    
    var blackView = UIView(frame: UIScreen.main.bounds)
    
    var popView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemMint
        return view
    }()
    
    var closeBtn: UIButton = {
        let btn = UIButton(type: .close)
        return btn
    }()
    
    // MARK: - Lifcycle
    override func viewDidLoad() {
        view.backgroundColor = .clear
        setupUI()
        setupBtn()
        blackViewDynamic()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tappedToDismiss()
    }
    
   // MARK: - helper
    func setupUI() {
        view.addSubview(popView)
        popView.backgroundColor = .systemBrown
        popView.anchor(width: 300, height: 200)
        popView.centerX(inView: view)
        popView.centerY(inView: view)
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
        closeBtn.anchor(top: popView.topAnchor, right: popView.rightAnchor,
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
