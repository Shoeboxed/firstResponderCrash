//
//  BaseTransitionAnimator.swift
//  Reimbursed
//
//  Created by Rob Witman on 5/20/16.
//  Copyright © 2016 Shoeboxed, Inc. All rights reserved.
//

import UIKit

class BaseTransitionAnimator : NSObject, UIViewControllerAnimatedTransitioning {
  
  var duration : TimeInterval = 0.5             // default transition time of 1/2 second
  var appearing : Bool = true                     // is the animation appearing (or disappearing)
  
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return duration
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    assert(true, "animateTransition MUST be implemented by child class")
  }
}
