//
//  VFORunLoopDispatcherViewController.m
//  VidaliciousFakebookObjC
//
//  Created by vidalicious on 2019/5/7.
//  Copyright © 2019 vidalicious. All rights reserved.
//

#import "VFORunLoopDispatcherViewController.h"
#import "VFORunLoopDispatcher.h"

@interface VFORunLoopDispatcherViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;

@end

@implementation VFORunLoopDispatcherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:tableView];
    _tableView = tableView;
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

- (void)task_1:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 300, 25)];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor grayColor];
    label.text = [NSString stringWithFormat:@"%zd - Drawing index is top priority", indexPath.row];
    label.font = [UIFont boldSystemFontOfSize:13];
    label.tag = 1;
    [cell.contentView addSubview:label];
}

- (void)task_2:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath  {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(105, 20, 85, 85)];
    imageView.tag = 2;
    UIImage *image = [UIImage imageNamed:@"Resource.bundle/stars.jpg"];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = image;
    [UIView transitionWithView:cell.contentView duration:0.3 options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve animations:^{
        [cell.contentView addSubview:imageView];
    } completion:^(BOOL finished) {
    }];
}

- (void)task_3:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath  {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(200, 20, 85, 85)];
    imageView.tag = 3;
    UIImage *image = [UIImage imageNamed:@"Resource.bundle/stars.jpg"];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = image;
    [UIView transitionWithView:cell.contentView duration:0.3 options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve animations:^{
        [cell.contentView addSubview:imageView];
    } completion:^(BOOL finished) {
    }];
}

- (void)task_4:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath  {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 99, 300, 35)];
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor lightGrayColor];
    label.text = [NSString stringWithFormat:@"Drawing large image is low priority."];
    label.font = [UIFont boldSystemFontOfSize:13];
    label.tag = 4;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 20, 85, 85)];
    imageView.tag = 5;
    UIImage *image = [UIImage imageNamed:@"Resource.bundle/stars.jpg"];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = image;
    [UIView transitionWithView:cell.contentView duration:0.3 options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve animations:^{
        [cell.contentView addSubview:label];
        [cell.contentView addSubview:imageView];
    } completion:^(BOOL finished) {
    }];
}

- (void)task_5:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath {
    for (NSInteger i = 1; i <= 5; i++) {
        [[cell.contentView viewWithTag:i] removeFromSuperview];
    }
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 135;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 400;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VFORunLoopDispatcherCells"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"VFORunLoopDispatcherCells"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.currentIndexPath = indexPath;
    [self task_5:cell indexPath:indexPath];
    [self task_1:cell indexPath:indexPath];
    __weak __typeof__(self) weakSelf = self;
    [VFORunLoopDispatcher.sharedDispatcher addTaskWithKey:indexPath task:^BOOL{
        __strong __typeof__(weakSelf) self = weakSelf;
        if (![cell.currentIndexPath isEqual:indexPath]) {
            return NO;
        }
        [self task_2:cell indexPath:indexPath];
        return YES;
    }];
    [VFORunLoopDispatcher.sharedDispatcher addTaskWithKey:indexPath task:^BOOL{
        __strong __typeof__(weakSelf) self = weakSelf;
        if (![cell.currentIndexPath isEqual:indexPath]) {
            return NO;
        }
        [self task_3:cell indexPath:indexPath];
        return YES;
    }];
    [VFORunLoopDispatcher.sharedDispatcher addTaskWithKey:indexPath task:^BOOL{
        __strong __typeof__(weakSelf) self = weakSelf;
        if (![cell.currentIndexPath isEqual:indexPath]) {
            return NO;
        }
        [self task_4:cell indexPath:indexPath];
        return YES;
    }];
    return cell;
}

@end
