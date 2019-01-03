//
//  VFOFoldingCellViewController.m
//  VidaliciousFakebookObjC
//
//  Created by vidalicious on 2018/11/7.
//  Copyright © 2018 vidalicious. All rights reserved.
//

#import "VFOFoldingCellViewController.h"
@import FoldingCell;
#import "VidaliciousFakebookObjC-Swift.h"

@interface VFOFoldingCellViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *cellHeights;
@property (assign, nonatomic) CGFloat openHeight;
@property (assign, nonatomic) CGFloat closeHeight;

@end

@implementation VFOFoldingCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITableView *tableView = UITableView.new;
    _tableView = tableView;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.frame = self.view.bounds;
    [_tableView registerClass:DemoFoldingCell.class forCellReuseIdentifier:@"FoldingCell"];
    [self.view addSubview:_tableView];
    
    _openHeight = 400;
    _closeHeight = 80;
    _cellHeights = @[].mutableCopy;
    for (int i = 0; i < 10; i++) {
        [_cellHeights addObject:@(_closeHeight)];
    }
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [_cellHeights[indexPath.row] floatValue];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DemoFoldingCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (cell.isAnimating) {
        return;
    }
    
    double duration = 0;
    NSNumber *height = [self.cellHeights objectAtIndex:indexPath.row];
    bool cellIsCollapsed = height.floatValue == _closeHeight;
    if (cellIsCollapsed) {
        [self.cellHeights setObject:[NSNumber numberWithFloat:_openHeight] atIndexedSubscript:indexPath.row];
        //[cell selectedAnimation:true animated:true completion: nil];
        [cell unfold:YES animated:YES completion:nil];
        duration = 1;
    } else {
        [self.cellHeights setObject:[NSNumber numberWithFloat:_closeHeight] atIndexedSubscript:indexPath.row];
        //[cell selectedAnimation:false animated:true completion: nil];
        [cell unfold:NO animated:YES completion:nil];
        duration = 0.8;
    }
    
    [UIView animateWithDuration:duration delay:0 options:0 animations:^{
        [tableView beginUpdates];
        [tableView endUpdates];
    } completion:nil];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _cellHeights.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DemoFoldingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FoldingCell"];
    return cell;
}


@end

