//
//  LOLBoxFriendViewController.m
//  LOL-Box
//
//  Created by ma c on 16/2/23.
//  Copyright © 2016年 HE. All rights reserved.
//

#import "LOLBoxFriendViewController.h"

@interface LOLBoxFriendViewController ()

@end

@implementation LOLBoxFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    label.text = @"好友";
    
    [self.view addSubview:label];
    
    // Do any additional setup after loading the view.
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
