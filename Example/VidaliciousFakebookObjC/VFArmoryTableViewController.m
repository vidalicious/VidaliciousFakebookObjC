//
//  VFArmoryTableViewController.m
//  VidaliciousFakebookObjC_Example
//
//  Created by vidalicious on 2018/8/1.
//  Copyright © 2018 vidalicious. All rights reserved.
//

#import "VFArmoryTableViewController.h"

@interface VFArmoryTableViewController ()

@end

@implementation VFArmoryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTitle:@"AFNetworking" vc:@"VFAFNetworkingViewController"];
    [self addTitle:@"SDWebImage" vc:@""]
//    [self.tableView reloadData];
}



@end
