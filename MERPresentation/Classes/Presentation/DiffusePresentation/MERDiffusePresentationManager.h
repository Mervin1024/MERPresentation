//
//  MERDiffusePresentationManager.h
//  MERPresentation
//
//  Created by 马遥 on 2018/2/5.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MERDiffusePresentationManager : NSObject <UIViewControllerTransitioningDelegate>

@property (nonatomic, assign) CGPoint startingPoint;

- (instancetype)initWithStartingPoint:(CGPoint)startingPoint;

@end
