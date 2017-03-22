//
//  ViewController.m
//  LearningMSUI
//
//  Created by 吴林丰 on 2017/3/21.
//  Copyright © 2017年 吴林丰. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "UUCell.h"
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self ;

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *disPlayView;

@end

@implementation ViewController

- (UITableView *)disPlayView{
    if (_disPlayView == nil) {
        _disPlayView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _disPlayView.showsHorizontalScrollIndicator = false;
        _disPlayView.showsVerticalScrollIndicator = true;
        _disPlayView.delegate = self;
        _disPlayView.dataSource = self;
      _disPlayView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.000];
    }
    return _disPlayView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.000];
    [self exampleTwo];
//    [self exampleCalculator];
//    [self newExample];
//    [self exampleSC];
}

- (void)exampleTwo{
        WS(weakSelf)
        UIView *uv = [[UIView alloc] init];
        uv.backgroundColor = [UIColor redColor];
        [self.view addSubview:uv];
        [uv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(weakSelf.view);
            make.size.mas_equalTo(CGSizeMake(300, 300));
        }];
    
        UIView *uv1 = [[UIView alloc] init];
        uv1.backgroundColor = [UIColor yellowColor];
        [uv addSubview:uv1];
        [uv1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(uv).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
    //        make.top.equalTo(uv).with.offset(10);
    //        make.left.equalTo(uv).with.offset(10);
    //        make.bottom.equalTo(uv).with.offset(-10);
    //        make.right.equalTo(uv).with.offset(-10);
    //         make.top.mas_offset(10);
    //         make.left.mas_offset(10);
    //         make.bottom.mas_offset(-10);
    //         make.right.mas_offset(-10);
        }];
    
        int pading = 10;
        UIView *uv2 = [[UIView alloc] init];
        uv2.backgroundColor = [UIColor blueColor];
        UIView *uv3 = [[UIView alloc] init];
        uv3.backgroundColor = [UIColor blackColor];
        [uv1 addSubview:uv2];
        [uv1 addSubview:uv3];
    
        [uv2 mas_makeConstraints:^(MASConstraintMaker *make) {
    
            make.centerY.mas_equalTo(uv1.mas_centerY);
            make.left.mas_equalTo(uv1.mas_left).offset(pading);
            make.right.mas_equalTo(uv3.mas_left).offset(-pading);
            make.height.mas_equalTo(150);
            make.width.mas_equalTo(uv3);
        }];
    
        [uv3 mas_makeConstraints:^(MASConstraintMaker *make) {
    
            make.centerY.mas_equalTo(uv1.mas_centerY);
            make.left.mas_equalTo(uv2.mas_right).offset(pading);
            make.right.mas_equalTo(uv1.mas_right).offset(-pading);
            make.height.mas_equalTo(150);
            make.width.mas_equalTo(uv2);
        }];
}

- (void)exampleSC{
    //在UIScrollView顺序排列一些view并自动计算contentSize
    WS(weakSelf)
    UIView *uv = [[UIView alloc] init];
    uv.backgroundColor = [UIColor redColor];
    [self.view addSubview:uv];
    [uv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = [UIColor whiteColor];
    [uv addSubview:scrollView];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(uv).with.insets(UIEdgeInsetsMake(5, 5, 5, 5));
    }];
    
    UIView *containerView = [UIView new];
    containerView.backgroundColor = [UIColor blueColor];
    [scrollView addSubview:containerView];
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.equalTo(scrollView);
    }];
    UIView *lastView = nil;
    for (int i = 0 ; i <= 10 ; i++) {
        UIView *subView = [UIView new];
        [containerView addSubview:subView];
        subView.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
                                             saturation:( arc4random() % 128 / 256.0 ) + 0.5
                                             brightness:( arc4random() % 128 / 256.0 ) + 0.5
                                                  alpha:1];
        [subView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(containerView);
            make.height.mas_equalTo(20*i);
            if (lastView != nil) {
                make.top.equalTo(lastView.mas_bottom);
            }else{
                make.top.equalTo(containerView.mas_top);
            }
        }];
        
        lastView = subView;
    }
    
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.mas_bottom);
    }];
    
}

//模拟计算器的布局
- (void)exampleCalculator{
    //声明显示文字的区域
    UIView *backDisplayView = [UIView new];
    backDisplayView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:backDisplayView];
    
    //声明键盘按钮区域
    UIView *keyBoardView = [UIView new];
    keyBoardView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:keyBoardView];
    
    //设置显示区域backDisplayView的Frame
    WS(weakSelf)
    [backDisplayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top);
        make.left.and.right.equalTo(weakSelf.view);
        make.height.equalTo(keyBoardView).multipliedBy(0.3f);
    }];
    
    [keyBoardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backDisplayView.mas_bottom);
        make.bottom.equalTo(weakSelf.view.mas_bottom);
        make.right.and.left.equalTo(weakSelf.view);
    }];
    
    UILabel *displayNum = [UILabel new];
    [backDisplayView addSubview:displayNum];
    displayNum.text = @"0";
    displayNum.font = [UIFont fontWithName:@"HeiTi SC" size:70];
    displayNum.textColor = [UIColor whiteColor];
    displayNum.textAlignment = NSTextAlignmentCenter;
    
    [displayNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(backDisplayView).with.offset(-10);
        make.bottom.equalTo(backDisplayView).with.offset(-10);
    }];
    
    //定义键盘键名称，？号代表合并的单元格
    NSArray *keys = @[@"AC",@"+/-",@"%",@"÷"
                      ,@"7",@"8",@"9",@"x"
                      ,@"4",@"5",@"6",@"-"
                      ,@"1",@"2",@"3",@"+"
                      ,@"0",@"?",@".",@"="];
    int indexOfkeys = 0;
    for (NSString *key in keys) {
        indexOfkeys ++;
        int rowNum = indexOfkeys % 4 ==0 ? indexOfkeys/4 : indexOfkeys/4+1;
        int colNum = indexOfkeys % 4 ==0 ? 4:indexOfkeys%4;
        NSLog(@"%d 行 %d 列",rowNum,colNum);
        
        UIButton *keyView = [UIButton buttonWithType:UIButtonTypeCustom];
        [keyBoardView addSubview:keyView];
        [keyView setTitle:key forState:UIControlStateNormal];
        [keyView setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        keyView.layer.borderWidth = 0.5;
        keyView.layer.backgroundColor = [UIColor blueColor].CGColor;
        [keyView.titleLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:30]];
    
        //键约束
        [keyView mas_makeConstraints:^(MASConstraintMaker *make) {
           //处理 0 合并单元格
            if ([key isEqualToString:@"0"] || [key isEqualToString:@"?"]) {
                if ([key isEqualToString:@"0"]) {
//                    [keyView mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.height.equalTo(keyBoardView.mas_height).with.multipliedBy(.2f);
                        make.width.equalTo(keyBoardView.mas_width).with.multipliedBy(.5f);
                        make.left.equalTo(keyBoardView.mas_left);
                        make.baseline.equalTo(keyBoardView.mas_baseline).with.multipliedBy(0.9f);
//                    }];
                }else{
                    [keyView removeFromSuperview];
                }
            }else{
                
                make.width.equalTo(keyBoardView.mas_width).with.multipliedBy(0.25f);
                make.height.equalTo(keyBoardView.mas_height).with.multipliedBy(0.2f);
                switch (rowNum) {
                    case 1:
                        make.baseline.equalTo(keyBoardView.mas_baseline).with.multipliedBy(0.1f);
                        break;
                    case 2:
                        make.baseline.equalTo(keyBoardView.mas_baseline).with.multipliedBy(0.3f);
                        break;
                    case 3:
                        make.baseline.equalTo(keyBoardView.mas_baseline).with.multipliedBy(0.5f);
                        break;
                    case 4:
                        make.baseline.equalTo(keyBoardView.mas_baseline).with.multipliedBy(0.7f);
                        break;
                    case 5:
                        make.baseline.equalTo(keyBoardView.mas_baseline).with.multipliedBy(0.9f);
                        break;
                        
                    default:
                        break;
                }
                
                switch (colNum) {
                    case 1:
                        make.left.equalTo(keyBoardView.mas_left);
                        break;
                    case 2:
                        make.right.equalTo(keyBoardView.mas_centerX);
                        break;
                    case 3:
                        make.left.equalTo(keyBoardView.mas_centerX);
                        break;
                    case 4:
                        
                        make.right.equalTo(keyBoardView.mas_right);
                        break;
                    default:
                        break;
                }
            
            
            }
        }];
    
    }
    
    
    
    
}


#pragma mark ----
- (void) newExample{
    WS(weakSelf)
    UIView *headView = [UIView new];
    headView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:headView];
    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.and.left.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.view);
        make.height.mas_equalTo(@64);
    }];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.backgroundColor = [UIColor redColor];
    [headView addSubview:backBtn];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headView).with.offset(10);
        make.bottom.equalTo(headView).with.offset(-10);
        make.size.mas_equalTo(CGSizeMake(15, 20));
    }];
    
    UILabel *label = [UILabel new];
    [self.view addSubview:label];
    label.text = @"返回";
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = [UIColor whiteColor];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(backBtn.mas_right).with.offset(5);
        make.bottom.equalTo(headView).with.offset(-10);
        make.size.mas_equalTo(CGSizeMake(100, 20));
    }];
    
    UILabel *label2 = [UILabel new];
    [self.view addSubview:label2];
    label2.text = @"详情";
    label2.textAlignment = NSTextAlignmentRight;
    label2.textColor = [UIColor whiteColor];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.view.mas_right).with.offset(-10);
        make.bottom.equalTo(headView).with.offset(-10);
        make.size.mas_equalTo(CGSizeMake(100, 20));
    }];
    
    UIImageView *showImageView = [UIImageView new];
    showImageView.image = [UIImage imageNamed:@"abcd"];
    showImageView.layer.cornerRadius = 5;
    showImageView.clipsToBounds = true;
    [self.view addSubview:showImageView];
    [showImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).with.offset(10);
        make.top.equalTo(headView.mas_bottom).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    
    UILabel *labelzz = [UILabel new];
    labelzz.backgroundColor = [UIColor purpleColor];
    labelzz.textAlignment = NSTextAlignmentLeft;
    labelzz.textColor = [UIColor whiteColor];
    labelzz.text = @"I'm  back ✨";
    [self.view addSubview:labelzz];
    [labelzz mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(showImageView.mas_centerY);
        make.left.equalTo(showImageView.mas_right).with.offset(20);
        make.right.equalTo(weakSelf.view).with.offset(-3);
        make.height.mas_equalTo(@50);
    }];
    
    
    
    [self.view addSubview:self.disPlayView];
    [self.disPlayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.and.bottom.equalTo(weakSelf.view);
        make.top.equalTo(showImageView.mas_bottom).with.offset(10);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentity = @"MyCell";
    UUCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentity];
    if (cell == nil) {
        cell = [[UUCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentity];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    
//    cell.textLabel.text = [NSString stringWithFormat:@"这是第%ld行",indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
