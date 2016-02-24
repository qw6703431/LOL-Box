//
//  LOLBoxTabBarViewController.m
//  LOL-Box
//
//  Created by ma c on 16/2/23.
//  Copyright © 2016年 HE. All rights reserved.
//

#import "LOLBoxTabBarViewController.h"
#import "Masonry.h"
#define BASCTAG 10

@interface LOLBoxTabBarViewController ()

@end

@implementation LOLBoxTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化子控制器
    [self createChildVCS];
    // 隐藏标签栏
    [self.tabBar setHidden:YES];
    // 创建自己的自定义标签栏
    [self createTabBar];
    
    // Do any additional setup after loading the view.
}

- (void)createTabBar {
    
    UIImageView* backView = [[UIImageView alloc] initWithFrame:CGRectMake(0, VIEW_HEIGHT-49, VIEW_WIDTH, 49)];
    backView.backgroundColor = RGB(236, 236, 236);
    
    UILabel* lineLabel = [[UILabel alloc] init];
    lineLabel.backgroundColor = [UIColor lightGrayColor];
    
    [lineLabel setFrame:CGRectMake(0, 0, VIEW_WIDTH, 1)];
    
    [backView addSubview:lineLabel];
    
    // 开启响应事件的开关
    [backView setUserInteractionEnabled:YES];
    
    [self.view addSubview:backView];
    
    // 确定按钮宽度
    CGFloat btnWidth = 55;
    // 确定按钮的间隙
    CGFloat space = (VIEW_WIDTH-20-btnWidth*4)/3;
    // 按钮下面label的标题
    NSArray* labelName = @[@"资讯",@"好友",@"发现",@"我"];
    
    for (NSInteger i=0; i<4; i++) {
        UIButton* btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        btn.tag = BASCTAG+i;
        
        [btn setFrame:CGRectMake(10+(space+btnWidth)*i, -20, btnWidth, btnWidth)];
        
        [btn addTarget:self action:@selector(pressAction:) forControlEvents:(UIControlEventTouchUpInside)];
        
        [backView addSubview:btn];
        
        NSString* normalName = [NSString stringWithFormat:@"theme_spring_tab_normal_%d",i];
        NSString* selectedName = [NSString stringWithFormat:@"theme_spring_tab_selected_%d",i];
        // 设置按钮的外观
        [btn setBackgroundImage:[UIImage imageNamed:normalName] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:selectedName] forState:UIControlStateSelected];
        
        UILabel* label = [[UILabel alloc] init];
        label.tag = BASCTAG+100+i;
        
        [label setFrame:CGRectMake(10+(space+btnWidth)*i, 35, btnWidth, 14)];
        
        label.text = labelName[i];
        label.font = [UIFont systemFontOfSize:11.0];
        label.textColor = [UIColor lightGrayColor];
        label.textAlignment = NSTextAlignmentCenter;
        
        [backView addSubview:label];
        
        if (i == 0) {
            btn.selected = YES;
            label.textColor = [UIColor redColor];
        }
        
    }
    
    // 设置标签栏控制器默认显示第一个视图
    self.selectedIndex = 0;
    
    
}

- (void)pressAction:(UIButton*)sender {
    
    NSUInteger selectIndex = sender.tag - BASCTAG;
    // 修改当前标签栏控制器显示的视图
    self.selectedIndex = selectIndex;
    // 创建一个数组 用来保存当前按钮父视图中的所有视图
    NSArray* subViews = [sender.superview subviews];
    // 开启当前视图的选中状态
    sender.selected = YES;
    // 找到所有按钮，把除了当前按钮的所有按钮选中状态取消
    for (UIView* subView in subViews) {
        if ([subView isKindOfClass:[UIButton class]] && subView!=sender) {
            ((UIButton*)subView).selected = NO;
        }
    }
    
    
    for (NSUInteger i=0; i<4; i++) {
        if (selectIndex == i) {
            UILabel* label = [self.view viewWithTag:selectIndex+BASCTAG+100];
            label.textColor = [UIColor redColor];
        } else {
            UILabel* label = [self.view viewWithTag:i+BASCTAG+100];
            label.textColor = [UIColor lightGrayColor];
        }
    }
    
}

- (void)createChildVCS {
    
    NSMutableArray* childVCS = [[NSMutableArray alloc] init];
    
    NSArray* classNames = @[@"LOLBoxInformation",@"LOLBoxFriend",@"LOLBoxDiscovery",@"LOLBoxMe"];
    
    for (NSInteger i=0; i<classNames.count; i++) {
        NSString* className = [classNames[i] stringByAppendingString:@"ViewController"];
        
        Class vcClass = NSClassFromString(className);
        UIViewController* vc = [[vcClass alloc] init];
        
        [childVCS addObject:vc];
    }
    
    self.viewControllers = childVCS;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
