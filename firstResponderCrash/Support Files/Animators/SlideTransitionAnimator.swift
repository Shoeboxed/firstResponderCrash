//
//  SlideTransitionAnimator.swift
//  Reimbursed
//
//  Created by Rob Witman on 9/19/16.
//  Copyright © 2016 Shoeboxed, Inc. All rights reserved.
//

import UIKit

class SlideTransitionAnimator : BaseTransitionAnimator {

  // this can be called if Either, Both or none of the transitioning views are LogoViewController
  override func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    let duration = transitionDuration(using: transitionContext)
    let containerView = transitionContext.containerView
    if let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
      let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) {
      let screenSize = UIScreen.main.bounds.size

      // we have the transitioning ViewsControllers that are required
      // get the views that will be 'sliding'  (defaulting to the entire view)
      var toLogoView : UIView?            // view that holds the 'to' brand logo image
      var toSlideView = toVC.view
      var fromSlideView = fromVC.view
      if let fromLogoVC = fromVC as? LogoViewController, let toLogoVC = toVC as? LogoViewController {
        fromSlideView = fromLogoVC.slideView ?? fromLogoVC.view
        toSlideView = toLogoVC.slideView ?? toLogoVC.view
        toLogoView = toLogoVC.logoView ?? nil
        fromVC.view.insertSubview(toVC.view, belowSubview: fromSlideView!)

        // the view isn't properly laid out when it is added to something other than container
        toVC.view.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height)
        toVC.view.layoutIfNeeded()
      }
      else {
        // when we are moving full VCs, we use the containerView
        containerView.addSubview(toSlideView!)
      }
      
      // set our initial conditions for the toVC's subviews
      let startXLoc = appearing ? screenSize.width : -screenSize.width
      toSlideView?.transform = CGAffineTransform(translationX: startXLoc, y: 0)

      // if the from and to are LogoViewControllers, setup the toLogoView w/ fromLogoView's Rect
      if let fromLogo = (fromVC as? LogoViewController)?.logoView, let toLogo = (toVC as? LogoViewController)?.logoView {
        toLogoView = toLogo
        toLogoView?.transform = transformFromRect(fromLogo.frame, toRect:toLogo.frame)
      }
      
      // animate our slide over and brand logo transformation (if applicable)
      UIView.animate(withDuration: duration,
                                 delay: 0,
                                 options: UIViewAnimationOptions(),
                                 animations: {
                                  let endXLoc = self.appearing ? -screenSize.width : screenSize.width
                                  toLogoView?.transform = CGAffineTransform.identity
                                  toSlideView?.transform = CGAffineTransform.identity
                                  fromSlideView?.transform = CGAffineTransform(translationX: endXLoc, y: 0)
        },
                                 completion: { (finished) in
                                  // in the case where we were manipulating subviews, we need to 
                                  // finalize by adding the main VC to the containerView before completion
                                  if toVC.view != toSlideView {
                                    containerView.addSubview(toVC.view)
                                  }
                                  transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
      })
    }
  }
  
  // helper function to generate a transform from one view rect to another
  // used for starting size of the logoView
  func transformFromRect(_ from: CGRect, toRect to: CGRect) -> CGAffineTransform {
    let transform = CGAffineTransform(translationX: from.midX-to.midX, y: from.midY-to.midY)
    return transform.scaledBy(x: from.width/to.width, y: from.height/to.height)
  }
}
