//
//  MyTableView.h
//  VSPNOA
//
//  Created by 万万万小胖 on 2016/11/8.
//  Copyright © 2016年 VSPN. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    panToLeft,
    panToRight,
} PanDirection;

typedef enum : NSUInteger {
    hasApproved = 1, // 未审批
    notApproved = 2, // 已审批
    projFinished = 3, // 进行中的项目
    projUnfinished = 4 // 已完结的项目
} TableViewDataType;

@protocol MyTableViewPanDelegate <NSObject>

- (void)pandirection:(PanDirection)direction;

@end

@interface MyTableView : UITableView<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIViewController *selfVC;

//当前页数
@property(nonatomic, assign)int page;

@property(nonatomic, assign)TableViewDataType dataType;

@property(nonatomic, strong)NSMutableArray *dataArray;

//初始触摸点
@property(nonatomic, assign)CGPoint startPoint;

@property (nonatomic, weak) id<MyTableViewPanDelegate> panDelegate;

@property (nonatomic, assign) int urlStart;


@end
