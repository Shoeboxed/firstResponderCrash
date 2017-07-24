//
//  LogoViewController.swift
//  firstResponderCrash
//
//  Created by Rob Witman on 7/24/17.
//  Copyright © 2017 Rob Witman. All rights reserved.
//

import Foundation
import UIKit

class LogoViewController : UIViewController, UITextFieldDelegate {
  var activeField: UITextField?                 // TextField currently being edited
  
  @IBOutlet weak var slideView : UIView?        // the container view that holds all of the views that should slide
  @IBOutlet weak var logoView : UIView?         // the view holding the Fetch logo

}

extension LogoViewController : UIViewControllerTransitioningDelegate {
  func animationController(forPresented presented: UIViewController,
                           presenting: UIViewController,
                           source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    let animator = SlideTransitionAnimator()
    animator.duration = 0.5
    return animator
  }
  
  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    let animator = SlideTransitionAnimator()
    animator.duration = 0.5
    animator.appearing = false
    return animator
  }
}
