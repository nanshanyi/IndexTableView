//
//  IndexTableView.h
//  tableViewIIndex
//
//  Created by 李国怀 on 16/6/4.
//  Copyright © 2016年 李国怀. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IndexTableViewDelegate;

@interface IndexTableView : UIView
/**
 *  设置索引文字颜色
 */
@property (nonatomic,strong)UIColor *tableViewIndexTextColor;
/**
 *  设置索引文字字号
 */
@property (nonatomic,strong)UIFont *tableViewIndexTextFont;
/**
 *  设置索引背景颜色
 */
@property (nonatomic,strong)UIColor *tableViewIndexBackgroundColor;
@property (nonatomic,strong)id<IndexTableViewDelegate> delegate;

- (void)reloadData;

@end
@protocol IndexTableViewDelegate <UITableViewDataSource,UITableViewDelegate>
/**
 *   实现代理返回索引的内容数组
 *
 *  @param tableView 使用的 tableView
 *
 *  @return 返回索引的内容数组
 */
- (NSArray *)sectionIndexTitlesForIndexTableView:(UITableView *)tableView;

@end
