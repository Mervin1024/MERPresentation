//
//  MERDiffusePresentationAnimator.h
//  MERPresentation
//
//  Created by 马遥 on 2018/2/5.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MERDiffuseDelegate <NSObject>

- (void)setAnimatingMaskViewAfterPresented:(UIView *)animatingMaskView;
- (UIView *)getAnimatingMaskViewBeforeDismiss;

@end

@interface MERDiffusePresentationAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, weak) id<MERDiffuseDelegate> delegate;

- (instancetype)initWhenPresentation:(BOOL)isPresentation startingPoint:(CGPoint)startingPoint;

@end
