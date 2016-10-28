//
//  MBProgressHUD+FT.h
//  HudDemo
//
//  Created by FFFF on 16/7/6.
//  Copyright © 2016年 Matej Bukovinski. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (FT)
/** 加载中(小菊花)*/
+ (void)showHUB;


+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;

/** 加载中,指定view*/
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;

/** 成功提示框(图片)*/
+ (void)showSuccess:(NSString *)success;

/** 失败提示框(图片)*/
+ (void)showError:(NSString *)error;

/** 加载中,文字*/
+ (MBProgressHUD *)showMessage:(NSString *)message;

/** 隐藏 */
+ (void)hideHUDForView:(UIView *)view;

/** 隐藏*/
+ (void)hideHUD;

/** 提示框 是否能点击,是否自动隐藏*/
+ (void)showHUDWithToShowStr:(NSString *)showStr HUDMode:(MBProgressHUDMode)mode autoHide:(BOOL)autoHide afterDelay:(NSTimeInterval)afterDelay userInteractionEnabled:(BOOL)yesOrNo;

/** 提示框,文字*/
+ (void)showHUDWithToShowStr:(NSString *)showStr;

/** 加载中(gif) */
+ (void)showIconHUD;
@end
