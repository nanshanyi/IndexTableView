//
//  IndexTableView.m
//  tableViewIIndex
//
//  Created by 李国怀 on 16/6/4.
//  Copyright © 2016年 李国怀. All rights reserved.
//

#import "IndexTableView.h"
#import "TableViewIndex.h"

@interface IndexTableView ()<tableViewIndexDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)TableViewIndex *tableViewIndex;
@property (nonatomic,strong)UILabel *indexLabel;
@end

@implementation IndexTableView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initSubViewsWith:frame];

    }
    return self;
}
- (void)initSubViewsWith:(CGRect)frame{
    self.tableView = [[UITableView alloc]initWithFrame:self.bounds];
    [self addSubview:_tableView];
    self.tableViewIndex = [[TableViewIndex alloc]initWithFrame:CGRectMake(frame.size.width-30, 100, 30, frame.size.height-200)];
    self.tableViewIndex.backgroundColor = [UIColor clearColor];
    self.tableViewIndex.delegate = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self addSubview:_tableViewIndex];
    _indexLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    _indexLabel.center = self.center;
    _indexLabel.layer.masksToBounds = YES;
    _indexLabel.layer.cornerRadius = 25;
    _indexLabel.backgroundColor = [UIColor lightGrayColor];
    _indexLabel.textAlignment = NSTextAlignmentCenter;
    _indexLabel.textColor = [UIColor blackColor];
    _indexLabel.font = [UIFont systemFontOfSize:25];
    _indexLabel.alpha = 0.0;
    [self addSubview:_indexLabel];
    _indexLabel.hidden = YES;
    
}
- (void)setTableViewIndexTextColor:(UIColor *)tableViewIndexTextColor{
    self.tableViewIndex.textColor = tableViewIndexTextColor;
}
- (void)setTableViewIndexTextFont:(UIFont *)tableViewIndexTextFont{
    self.tableViewIndex.textFont = tableViewIndexTextFont;
}
- (void)setBackgroundColor:(UIColor *)backgroundColor{
    self.tableViewIndex.backgroundColor = backgroundColor;
}
- (void)setDelegate:(id<IndexTableViewDelegate>)delegate{
    _delegate = delegate;
    self.tableView.delegate = delegate;
    self.tableView.dataSource = delegate;
}
- (void)reloadData{
    [self.tableView reloadData];
    self.tableViewIndex.delegate = self;
}

#pragma mark -tableViewIndexDelegate
- (NSArray *)tableViewIndexArray:(TableViewIndex *)tableViewIndex{
   return [self.delegate sectionIndexTitlesForIndexTableView:self.tableView];
}
- (void)tableViewIndex:(TableViewIndex *)tableViewIndex selectSectionIndex:(NSInteger)index sectionTitle:(NSString *)title{
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index] atScrollPosition:UITableViewScrollPositionTop animated:NO];
    [self indexLabelShowWith:title];
}

- (void)tableViewIndexTouchBegan:(TableViewIndex *)tableViewIndex{
    NSLog(@"touchBegan");
}

- (void)tableViewIndexTouchEnd:(TableViewIndex *)tableViewIndex{
    
    [UIView animateWithDuration:0.5 animations:^{
        _indexLabel.alpha = 0.0;
    } completion:^(BOOL finished) {
        _indexLabel.hidden = YES;
    }];
}
- (void)indexLabelShowWith:(NSString*)title{
    _indexLabel.hidden = NO;
    _indexLabel.text = title;
    [UIView animateWithDuration:0.5 animations:^{
        _indexLabel.alpha = 1.0;
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
