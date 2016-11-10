//
//  ApprovalTableViewCell.h
//  VSPNOA
//
//  Created by 万万万小胖 on 2016/11/8.
//  Copyright © 2016年 VSPN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ApprovalTableViewCell : UITableViewCell

// 审批的title
@property (weak, nonatomic) IBOutlet UILabel *approvalTitle;

// 审批的信息（简称>部门>人名）
@property (weak, nonatomic) IBOutlet UILabel *approvalnfo;

// 审批的备注/原因
@property (weak, nonatomic) IBOutlet UILabel *approvalRemark;

// 审批的编号(单据号，凭证编号等)
@property (weak, nonatomic) IBOutlet UILabel *approvalCode;

// 审批的创建/提交时间
@property (weak, nonatomic) IBOutlet UILabel *createTime;

// 申请的金额（借款、报销等）或是时间段（加班、请假等）
@property (weak, nonatomic) IBOutlet UILabel *approvalThings;

// 加急的图标
@property (weak, nonatomic) IBOutlet UIImageView *urgentImg;

// 审批人、审批状态


@end
