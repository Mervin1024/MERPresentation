//
//  MERGraduallyFadePresentationAnimator.m
//  boxfish-english
//
//  Created by 马遥 on 2017/11/29.
//  Copyright © 2017年 boxfish. All rights reserved.
//

#import "MERGraduallyFadePresentationAnimator.h"

@interface MERGraduallyFadePresentationAnimator ()
@property (nonatomic, assign) BOOL isPresentation;// 判断当前需要弹出动画还是收回动画
@end

@implementation MERGraduallyFadePresentationAnimator

- (instancetype)initWhenPresentation:(BOOL)isPresentation {
    self = [super init];
    if (self) {
        _isPresentation = isPresentation;
    }
    return self;
}

#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    NSString *key = self.isPresentation ? UITransitionContextToViewControllerKey : UITransitionContextFromViewControllerKey;
    UIViewController *controller = [transitionContext viewControllerForKey:key];
    if (self.isPresentation) {
        [transitionContext.containerView addSubview:controller.view];
    }
    
    CGFloat initialAlpha = self.isPresentation ? 0 : 1;
    CGFloat finalAlpha = self.isPresentation ? 1 : 0;
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    controller.view.alpha = initialAlpha;
    
    [UIView animateWithDuration:duration delay:0.f usingSpringWithDamping:1.f initialSpringVelocity:5.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        controller.view.alpha = finalAlpha;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished];
    }];
    
}

@end
