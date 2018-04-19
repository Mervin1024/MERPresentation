//
//  MERGraduallyFadePresentationManager.m
//  MERPresentation
//
//  Created by 马遥 on 2017/11/29.
//  Copyright © 2017年 boxfish. All rights reserved.
//

#import "MERGraduallyFadePresentationManager.h"
#import "MERGraduallyFadePresentationController.h"
#import "MERGraduallyFadePresentationAnimator.h"

@implementation MERGraduallyFadePresentationManager

#pragma mark - UIViewControllerTransitioningDelegate

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    MERGraduallyFadePresentationController *controller = [[MERGraduallyFadePresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    controller.dismissBlock = self.dismissBlock;
    return controller;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    return [[MERGraduallyFadePresentationAnimator alloc] initWhenPresentation:YES];;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[MERGraduallyFadePresentationAnimator alloc] initWhenPresentation:NO];;
}


@end
