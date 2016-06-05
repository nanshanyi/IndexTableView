//
//  IndexView.h
//  tableViewIIndex
//
//  Created by 李国怀 on 16/6/4.
//  Copyright © 2016年 李国怀. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol tableViewIndexDelegate;

@interface TableViewIndex : UIView
@property (nonatomic) UIColor *textColor;
@property (nonatomic) UIFont  *textFont;
@property (nonatomic) UIColor *backgroundColor;
@property (nonatomic,weak)id<tableViewIndexDelegate> delegate;
@end
@protocol tableViewIndexDelegate <NSObject>

- (void)tableViewIndex:(TableViewIndex *)tableViewIndex selectSectionIndex:(NSInteger)index sectionTitle:(NSString *)title;

- (void)tableViewIndexTouchBegan:(TableViewIndex *)tableViewIndex;

- (void)tableViewIndexTouchEnd:(TableViewIndex *)tableViewIndex;

- (NSArray *)tableViewIndexArray:(TableViewIndex *)tableViewIndex;



@end
