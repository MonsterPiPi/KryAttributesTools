//
//  ViewController.m
//  KryAttributesTools
//
//  Created by 廖靖宇 on 2017/11/17.
//  Copyright © 2017年 liaojingyu. All rights reserved.
//

#import "ViewController.h"
#import "ShowViewController.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableview;
@property (nonatomic, strong) NSMutableArray * array;
@end

@implementation ViewController

-(NSMutableArray *)array{
    if (_array == nil) {
        _array = [[NSMutableArray alloc]initWithObjects:@"整体设置",@"部分设置",@"段落设置",@"超链接",nil];
    }
    return _array;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.backgroundColor = [UIColor whiteColor];
    _tableview.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:_tableview];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *TableSampleIdentifier = @"TableSampleIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableSampleIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:TableSampleIdentifier];
    }
    cell.textLabel.text = self.array[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ShowViewController * vc = [[ShowViewController alloc]init];
    vc.index = indexPath.row;
    [self.navigationController pushViewController:vc animated:YES];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
