//
//  SignUpViewController.swift
//  firstResponderCrash
//
//  Created by Rob Witman on 7/24/17.
//  Copyright © 2017 Rob Witman. All rights reserved.
//

import Foundation

class SignUpViewController : LogoViewController {
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    let dispatchTime: DispatchTime = DispatchTime.now() + Double(Int64(1 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
    DispatchQueue.main.asyncAfter(deadline: dispatchTime, execute: {
      let signInVC = SignInViewController(nibName: "SignInViewController", bundle: nil)
      signInVC.transitioningDelegate = self
      self.present(signInVC, animated: true, completion: nil)
    })
  }
}
