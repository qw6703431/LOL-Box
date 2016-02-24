//
//  LOLBoxBaseViewController.m
//  LOL-Box
//
//  Created by ma c on 16/2/23.
//  Copyright © 2016年 HE. All rights reserved.
//

#import "LOLBoxBaseViewController.h"

@interface LOLBoxBaseViewController ()

@end

@implementation LOLBoxBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)AddBackItemBtn{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithNormalIcon:@"" highlightedIcon:@"" target:self action:@selector(backView)];
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)backView{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)GETHttpRequest:(NSString *)url
                   dic:(NSDictionary *)dic
          successBalck:(HttpSuccessBlock)RequestSuccess
            errorBlock:(HttpErrorBlock)RequestError{
    WS(weakSelf);
    // 显示等待动画
    [JPRefreshView showJPRefreshFromView:self.view];
    [ZJPBaseHttpTool getWithPath:url params:dic success:^(id JSON) {
        if (RequestSuccess) {
            RequestSuccess(JSON);
        }
        // 移除等待动画
        [JPRefreshView removeJPRefreshFromView:weakSelf.view];
    } failure:^(NSError *error) {
        if (RequestError) {
            RequestError(error);
        }
        [JPRefreshView removeJPRefreshFromView:weakSelf.view];
    }];
}

- (void)POSTHttpRequest:(NSString *)url
                    dic:(NSDictionary *)dic
           successBalck:(HttpSuccessBlock)RequestSuccess
             errorBlock:(HttpErrorBlock)RequestError
{
    WS(weakSelf);
    [JPRefreshView showJPRefreshFromView:self.view];
    [ZJPBaseHttpTool postWithPath:url params:dic success:^(id JSON) {
        if (RequestSuccess) {
            RequestSuccess(JSON);
        }
        [JPRefreshView removeJPRefreshFromView:weakSelf.view];
    } failure:^(NSError *error) {
        if (RequestError) {
            RequestError(error);
        }
        [JPRefreshView removeJPRefreshFromView:weakSelf.view];
    }];
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
