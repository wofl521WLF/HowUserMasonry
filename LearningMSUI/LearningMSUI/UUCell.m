//
//  UUCell.m
//  LearningMSUI
//
//  Created by 吴林丰 on 2017/3/22.
//  Copyright © 2017年 吴林丰. All rights reserved.
//

#import "UUCell.h"
#import "Masonry.h"
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self ;
@implementation UUCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
    }
    return  self;
}

- (void) createUI{
   self.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.000];
    UILabel *labeltt = [UILabel new];
    labeltt.textColor = [UIColor blackColor];
    labeltt.text = @"你到底爱不爱我";
    [self.contentView addSubview:labeltt];
    WS(weakSelf)
    [labeltt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.equalTo(weakSelf.contentView).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(200, 20));
    }];
    UIView *newView = [UIView new];
    [self.contentView addSubview:newView];
    newView.clipsToBounds = true;
    newView.layer.cornerRadius = 5;
    newView.layer.borderWidth = 0.5;
    newView.backgroundColor = [UIColor whiteColor];
    newView.layer.borderColor = [UIColor blueColor].CGColor;
    [newView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.contentView).with.offset(10);
        make.top.equalTo(labeltt.mas_bottom).with.offset(10);
        make.right.equalTo(weakSelf.contentView.mas_right).with.offset(-10);
        make.bottom.equalTo(weakSelf.contentView.mas_bottom).with.offset(-10);
    }];
    
    UITextField *ttfield = [UITextField new];
    ttfield.text = @"这是一首简单的小情歌";
    ttfield.textColor = [UIColor redColor];
    [ttfield setEnabled:false];
    ttfield.textAlignment = NSTextAlignmentCenter;
    [newView addSubview:ttfield];
    
    [ttfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(newView).with.insets(UIEdgeInsetsMake(30, 30, 30, 30));
    }];
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
