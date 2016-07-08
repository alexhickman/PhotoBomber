//
//  AHDismissDetailTransition.m
//  PhotoBombers
//
//  Created by Hickman on 5/5/16.
//  Copyright © 2016 Hickman. All rights reserved.
//

#import "AHDismissDetailTransition.h"

@implementation AHDismissDetailTransition

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *detail = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [UIView animateWithDuration:0.3 animations:^{
        detail.view.alpha = 0.0;
    } completion:^(BOOL finished) {
        [detail.view removeFromSuperview];
        [transitionContext completeTransition:YES];
    }];
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3;
}

@end
