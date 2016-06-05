//
//  ViewController.m
//  tableViewIIndex
//
//  Created by 李国怀 on 16/6/4.
//  Copyright © 2016年 李国怀. All rights reserved.
//

#import "ViewController.h"
#import "IndexTableView.h"

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<IndexTableViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)IndexTableView *indexTableView;
@property (nonatomic,strong)NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSubViews];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)reloadmyData{
    self.dataArray = @[@[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J"],@[@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J"],@[@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J"],@[@"D",@"E",@"F",@"G",@"H",@"I",@"J"],@[@"E",@"F",@"G",@"H",@"I",@"J"],@[@"F",@"G",@"H",@"I",@"J"],@[@"G",@"H",@"I",@"J"],@[@"H",@"I",@"J"],@[@"I",@"J",@"I",@"J",@"I",@"J",@"I",@"J",@"I",@"J",@"I",@"J"],@[@"J",@"k",@"J",@"k",@"J",@"k",@"J",@"k",@"J",@"k",@"J",@"k"]];
    [self.indexTableView reloadData];
}
- (void)initSubViews{

    self.indexTableView = [[IndexTableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.indexTableView.delegate = self;
    self.indexTableView.tableViewIndexTextFont = [UIFont systemFontOfSize:14];
    self.indexTableView.tableViewIndexTextColor = [UIColor grayColor];
    [self.view addSubview:_indexTableView];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 64, 100, 50)];
    [button setTitle:@"reloadData" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(reloadmyData) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:button];

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_dataArray[section] count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
        
    }
    cell.textLabel.text = self.dataArray[indexPath.section][indexPath.row];
    return cell;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];
    view.backgroundColor = [UIColor lightGrayColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, 0, kScreenWidth-30, 44)];
    label.text = self.dataArray[0][section];
//    label.backgroundColor = [UIColor purpleColor];
    [view addSubview:label];
    return view;
}
- (NSArray *)sectionIndexTitlesForIndexTableView:(UITableView *)tableView{
    return self.dataArray[0];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
