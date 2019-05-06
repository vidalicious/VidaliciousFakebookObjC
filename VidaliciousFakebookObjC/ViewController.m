//
//  ViewController.m
//  VidaliciousFakebookObjC
//
//  Created by vidalicious on 2018/10/31.
//  Copyright © 2018 vidalicious. All rights reserved.
//

#import "ViewController.h"
#import <FirebaseFunctions/FirebaseFunctions.h>

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *titles;
@property (strong, nonatomic) NSMutableArray *vcs;
@property (nonatomic, strong) FIRFunctions *functions;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self initData];
    self.functions = [FIRFunctions functions];
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
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *vcName = _vcs[indexPath.row];
    Class class = NSClassFromString(vcName);
    if (class) {
        UIViewController *ctrl = class.new;
        ctrl.title = _titles[indexPath.row];
        [self.navigationController pushViewController:ctrl animated:YES];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fakebookCells"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"fakebookCells"];
    }
    cell.textLabel.text = _titles[indexPath.row];
    return cell;
}

@end
