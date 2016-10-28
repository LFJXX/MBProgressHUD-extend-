//
//  ViewController.m
//  MBProgressHUD(扩展)
//
//  Created by FFFF on 2016/10/28.
//  Copyright © 2016年 FFFF. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD+FT.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)  NSMutableArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatUI];
}

- (void)creatUI{

    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    switch (indexPath.row) {
        case 0:
        {
            
            [MBProgressHUD showHUB];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUD];
            });
        }
            break;
        case 1:
        {
            [MBProgressHUD showMessage:@"加载中..."];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUD];
            });
        }
            break;
        case 2:
        {
            [MBProgressHUD showIconHUD];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUD];
            });
        }
            break;
        case 3:
        {
            [MBProgressHUD showSuccess:@"请求成功"];
        }
            break;
        case 4:
        {
            [MBProgressHUD showError:@"请求失败"];
        }
            break;
        case 5:
        {
            [MBProgressHUD showHUDWithToShowStr:@"在其他地方登陆"];
        }
            break;
        case 6:
        {
        }
            break;
      
            
        default:
            break;
    }
}


- (NSMutableArray *)dataSource{

    if (_dataSource == nil) {
        _dataSource = [NSMutableArray arrayWithCapacity:0];
        _dataSource = [NSMutableArray arrayWithObjects:@"圈圈",@"加载中(文字)",@"加载中(gif)",@"成功(图片+文字)",@"失败(图片+文字)",@"文字提示", nil];
    }
    return _dataSource;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
