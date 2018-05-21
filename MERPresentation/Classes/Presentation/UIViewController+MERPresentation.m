//
//  UIViewController+MERPresentation.h
//  MERPresentation
//
//  Created by 马遥 on 2017/11/23.
//  Copyright © 2017年 boxfish. All rights reserved.
//

#import "UIViewController+MERPresentation.h"
#import "MERSheetPresentationManager.h"
#import "MERGraduallyFadePresentationManager.h"
#import "MERDiffusePresentationManager.h"
#import <objc/runtime.h>

static char MER_PresentationManagerKey;
static char MER_PresentationViewSizeKey;

#define MER_isKindOfClass(obj, className)   mer_isKindOfClass(obj, [className class])

BOOL mer_isKindOfClass(id obj, Class class) {
    Class obj_class = [obj class];
    return [NSStringFromClass(obj_class) isEqualToString:NSStringFromClass(class)];
}

@implementation UIViewController (MERPresentation)

- (void)setMer_PresentationManager:(id<UIViewControllerTransitioningDelegate>)presentationManager {
    objc_setAssociatedObject(self, &MER_PresentationManagerKey, presentationManager, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id<UIViewControllerTransitioningDelegate>)mer_presentationManager {
    id<UIViewControllerTransitioningDelegate> manager = objc_getAssociatedObject(self, &MER_PresentationManagerKey);
    return manager;
}

- (void)setMer_viewSize:(CGSize)viewSize {
    NSValue *value = [NSValue valueWithCGSize:viewSize];
    objc_setAssociatedObject(self, &MER_PresentationViewSizeKey, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGSize)mer_viewSize {
    NSValue *value = objc_getAssociatedObject(self, &MER_PresentationViewSizeKey);
    if (!value) {
        return [UIScreen mainScreen].bounds.size;
    }
    return [value CGSizeValue];
}

#pragma mark - Action Sheet

- (void)presentActionSheetViewController:(UIViewController *)viewControllerToPresent
                                animated:(BOOL)flag
                              completion:(void (^)(void))completion {
    [self presentActionSheetViewController:viewControllerToPresent
                    hideWhenClickBlankArea:YES
                                  animated:flag
                                completion:completion
                              afterDismiss:nil];
}

- (void)presentActionSheetViewController:(UIViewController *)viewControllerToPresent
                                animated:(BOOL)flag
                              completion:(void (^)(void))completion
                            afterDismiss:(PresentationAfterDismiss)afterDismiss {
    
    [self presentActionSheetViewController:viewControllerToPresent
                    hideWhenClickBlankArea:YES
                                  animated:flag
                                completion:completion
                              afterDismiss:afterDismiss];
}

- (void)presentActionSheetViewController:(UIViewController *)viewControllerToPresent
                  hideWhenClickBlankArea:(BOOL)hideWhenClickBlankArea
                                animated:(BOOL)flag
                              completion:(void (^)(void))completion
                            afterDismiss:(PresentationAfterDismiss)afterDismiss {
    id<UIViewControllerTransitioningDelegate> manager = [viewControllerToPresent mer_presentationManager];
    MERSheetPresentationManager *sheetPresentationManager;
    if (manager != nil && MER_isKindOfClass(manager, MERSheetPresentationManager)) {
        sheetPresentationManager = (MERSheetPresentationManager *)manager;
    } else {
        sheetPresentationManager = [[MERSheetPresentationManager alloc] init];
        [viewControllerToPresent setMer_PresentationManager:sheetPresentationManager];
    }
    sheetPresentationManager.effectiveViewSize = viewControllerToPresent.mer_viewSize;
    sheetPresentationManager.dismissBlock = afterDismiss;
    sheetPresentationManager.hideWhenClickBlankArea = hideWhenClickBlankArea;

    viewControllerToPresent.modalPresentationStyle = UIModalPresentationCustom;
    viewControllerToPresent.transitioningDelegate = sheetPresentationManager;
    
    [self presentViewController:viewControllerToPresent animated:flag completion:completion];

}

#pragma mark - 侧边滑入

- (void)presentSliderViewController:(UIViewController *)viewControllerToPresent
                          direction:(MERSlidePresentationDirection)direction
                           animated:(BOOL)flag
                         completion:(void (^)(void))completion {
    id<UIViewControllerTransitioningDelegate> manager = [viewControllerToPresent mer_presentationManager];
    MERSlidePresentationManager *sliderPresentationManager;
    if (manager != nil && MER_isKindOfClass(manager, MERSlidePresentationManager)) {
        sliderPresentationManager = (MERSlidePresentationManager *)manager;
    } else {
        sliderPresentationManager = [[MERSlidePresentationManager alloc] init];
        [viewControllerToPresent setMer_PresentationManager:sliderPresentationManager];
    }

    sliderPresentationManager.viewSize = viewControllerToPresent.mer_viewSize;
    sliderPresentationManager.direction = direction;
    
    viewControllerToPresent.modalPresentationStyle = UIModalPresentationCustom;
    viewControllerToPresent.transitioningDelegate = sliderPresentationManager;
    
    [self presentViewController:viewControllerToPresent animated:flag completion:completion];
}


#pragma mark - 渐入渐出

- (void)presentFadePatternViewController:(UIViewController *)viewControllerToPresent
                                animated:(BOOL)flag
                              completion:(void (^)(void))completion {
    id<UIViewControllerTransitioningDelegate> manager = [viewControllerToPresent mer_presentationManager];
    MERGraduallyFadePresentationManager *graduallyFadePresentationManager;
    if (manager != nil && MER_isKindOfClass(manager, MERGraduallyFadePresentationManager)) {
        graduallyFadePresentationManager = (MERGraduallyFadePresentationManager *)manager;
    } else {
        graduallyFadePresentationManager = [[MERGraduallyFadePresentationManager alloc] init];
        [viewControllerToPresent setMer_PresentationManager:graduallyFadePresentationManager];
    }
    
    viewControllerToPresent.modalPresentationStyle = UIModalPresentationCustom;
    viewControllerToPresent.transitioningDelegate = graduallyFadePresentationManager;
    
    [self presentViewController:viewControllerToPresent animated:flag completion:completion];
}

#pragma mark - 扩散

- (void)presentDiffuseViewController:(UIViewController *)viewControllerToPresent
                          startPoint:(CGPoint)startPoint
                            animated:(BOOL)flag
                          completion:(void (^)(void))completion {
    id<UIViewControllerTransitioningDelegate> manager = [viewControllerToPresent mer_presentationManager];
    MERDiffusePresentationManager *diffusePresentationManager;
    if (manager != nil && MER_isKindOfClass(manager, MERDiffusePresentationManager)) {
        diffusePresentationManager = (MERDiffusePresentationManager *)manager;
        diffusePresentationManager.startingPoint = startPoint;
    } else {
        diffusePresentationManager = [[MERDiffusePresentationManager alloc] initWithStartingPoint:startPoint];
        [viewControllerToPresent setMer_PresentationManager:diffusePresentationManager];
    }
    
    viewControllerToPresent.modalPresentationStyle = UIModalPresentationCustom;
    viewControllerToPresent.transitioningDelegate = diffusePresentationManager;

    [self presentViewController:viewControllerToPresent animated:flag completion:completion];
}

@end
