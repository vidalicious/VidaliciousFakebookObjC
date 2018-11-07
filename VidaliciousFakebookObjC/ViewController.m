//
//  ViewController.m
//  VidaliciousFakebookObjC
//
//  Created by vidalicious on 2018/10/31.
//  Copyright © 2018 vidalicious. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *titles;
@property (strong, nonatomic) NSMutableArray *vcs;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

- (void)initData {
    _titles = @[].mutableCopy;
    _vcs = @[].mutableCopy;
    [self addTitle:@"FoldingCell" vc:@"VFOFoldingCellViewController"];
}

- (void)addTitle:(NSString *)title vc:(NSString *)vc {
    [_titles addObject:title];
    [_vcs addObject:vc];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableView *cell = tableView dequeueReusableCellWithIdentifier:@"fakebookCells";
    if (!cell) {
        cell = 
    }
}

@end
