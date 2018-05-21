//
//  MERGraduallyFadePresentationAnimator.h
//  MERPresentation
//
//  Created by 马遥 on 2017/11/29.
//  Copyright © 2017年 boxfish. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MERGraduallyFadePresentationAnimator : NSObject <UIViewControllerAnimatedTransitioning>

- (instancetype)initWhenPresentation:(BOOL)isPresentation;

@end
