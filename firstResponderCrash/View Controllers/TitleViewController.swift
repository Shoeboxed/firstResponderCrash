//
//  TitleViewController.swift
//  firstResponderCrash
//
//  Created by Rob Witman on 7/24/17.
//  Copyright © 2017 Rob Witman. All rights reserved.
//

import UIKit

class TitleViewController: LogoViewController {

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    let dispatchTime: DispatchTime = DispatchTime.now() + Double(Int64(0.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
    DispatchQueue.main.asyncAfter(deadline: dispatchTime, execute: {
      let signUpVC = SignUpViewController(nibName: "SignUpViewController", bundle: nil)
      signUpVC.transitioningDelegate = self
      self.present(signUpVC, animated: true, completion: nil)
    })
  }
}
