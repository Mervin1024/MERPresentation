//
//  MERSlidePresentationAnimator.h
//  MERPresentation
//
//  Created by 马遥 on 2017/11/21.
//  Copyright © 2017年 boxfish. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MERPresentationHeader.h"

@interface MERSlidePresentationAnimator : NSObject <UIViewControllerAnimatedTransitioning>

- (instancetype)initWithDirection:(MERSlidePresentationDirection)direction isPresentation:(BOOL)isPresentation;

@end
