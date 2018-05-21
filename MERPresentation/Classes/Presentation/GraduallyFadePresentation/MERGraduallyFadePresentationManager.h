//
//  MERGraduallyFadePresentationManager.h
//  MERPresentation
//
//  Created by 马遥 on 2017/11/29.
//  Copyright © 2017年 boxfish. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MERPresentationHeader.h"

@interface MERGraduallyFadePresentationManager : NSObject <UIViewControllerTransitioningDelegate>
@property (nonatomic, copy) PresentationAfterDismiss dismissBlock;
@end
