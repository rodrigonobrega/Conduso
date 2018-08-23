//
//  LoginViewController.swift
//  Conduso
//
//  Created by Mac mini on 23/08/2018.
//  Copyright © 2018 Foxcode. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var heightTopViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var loginButton: UIButton!
    var flagConstraint:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginButton.layer.cornerRadius = 5
        flagConstraint = heightTopViewConstraint.constant
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        heightTopViewConstraint.constant = flagConstraint
        self.loginButton.layer.removeAllAnimations()
        UIView.animate(withDuration: 0.7) {
            self.view.layoutIfNeeded()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(_ sender: Any) {
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.toValue = 0
        
        let radiusAnimation = CABasicAnimation(keyPath: "cornerRadius")
        radiusAnimation.toValue = 30
        
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.toValue = 2

        let groupAnimation = CAAnimationGroup()
        groupAnimation.duration = 0.7
        groupAnimation.animations = [scaleAnimation, radiusAnimation, opacityAnimation]
        
        groupAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        groupAnimation.isRemovedOnCompletion = false
        groupAnimation.fillMode = kCAFillModeForwards
        self.loginButton.layer.add(groupAnimation, forKey: "Myanimation")
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(removeAnimation), userInfo: nil, repeats: false)
        self.heightTopViewConstraint.constant = self.loginButton.frame.origin.y
        UIView.animate(withDuration: 2) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc  func removeAnimation() {
        self.performSegue(withIdentifier: "dashboardSegue", sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
