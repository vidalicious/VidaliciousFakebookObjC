//
//  VFOForwardingViewController.m
//  VidaliciousFakebookObjC
//
//  Created by vidalicious on 2019/5/8.
//  Copyright © 2019 vidalicious. All rights reserved.
//

#import "VFOForwardingViewController.h"
#import "VFOMessageOrigin.h"

@interface VFOForwardingViewController ()

@end

@implementation VFOForwardingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    CGRect bounds = UIScreen.mainScreen.bounds;
    UIButton *aButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, bounds.size.width - 40, 50)];
    aButton.backgroundColor = UIColor.lightGrayColor;
    [aButton setTitle:@"send message forwarding" forState:UIControlStateNormal];
    [aButton addTarget:self action:@selector(sendMessage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:aButton];
    
    UIButton *bButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 170, bounds.size.width - 40, 50)];
    bButton.backgroundColor = UIColor.lightGrayColor;
    [bButton setTitle:@"crash handle" forState:UIControlStateNormal];
    [bButton addTarget:self action:@selector(crashHandle:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bButton];
}

- (void)sendMessage:(id)sender {
    VFOMessageOrigin *origin = VFOMessageOrigin.new;
    [origin sendMessage:@"aaa"];
}

@end
