//
//  MERSecondViewController.m
//  MERPresentation_Example
//
//  Created by 马遥 on 2018/4/19.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import "MERSecondViewController.h"

@interface MERSecondViewController ()
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation MERSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor colorWithRed:86/255.0 green:214/255.0 blue:255/255.0 alpha:1];
    [self.view addSubview:_tableView];
    
    UIButton *dismissButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [dismissButton setTitle:@"关闭" forState:UIControlStateNormal];
    [dismissButton addTarget:self action:@selector(dismissButtonDidPressed:) forControlEvents:UIControlEventTouchUpInside];
    [dismissButton sizeToFit];
    dismissButton.center = CGPointMake(50, 50);
    [self.view addSubview:dismissButton];
    
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:_tableView
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeTop
                                                            multiplier:1.0
                                                              constant:0],
                                
                                [NSLayoutConstraint constraintWithItem:_tableView
                                                             attribute:NSLayoutAttributeLeft
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeLeft
                                                            multiplier:1.0
                                                              constant:0],
                                
                                [NSLayoutConstraint constraintWithItem:_tableView
                                                             attribute:NSLayoutAttributeBottom
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeBottom
                                                            multiplier:1.0
                                                              constant:-0],
                                
                                [NSLayoutConstraint constraintWithItem:_tableView
                                                             attribute:NSLayoutAttributeRight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1
                                                              constant:-0],
                                
                                ]];
}

- (void)dismissButtonDidPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
