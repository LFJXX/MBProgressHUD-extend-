//
//  MBProgressHUD+FT.m
//  HudDemo
//
//  Created by FFFF on 16/7/6.
//  Copyright © 2016年 Matej Bukovinski. All rights reserved.
//

#import "MBProgressHUD+FT.h"
#import "AppDelegate.h"
#import "UIImage+GIF.h"
#define LCScreenHeight [[UIScreen mainScreen] bounds].size.height
@implementation MBProgressHUD (FT)

+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
    if (view == nil) view = [self getWindow];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    hud.label.text = text;
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    // 1.5秒之后再消失
    [hud hideAnimated:YES afterDelay:1.5];
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    
    
}



+ (void)showIconWithView:(UIView *)view
{
    if (view == nil) view = [self getWindow];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    hud.label.text = @"";
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 设置图片
    UIImage  *image=[UIImage sd_animatedGIFNamed:@"414176"];
    UIImageView  *gifview=[[UIImageView alloc]initWithFrame:CGRectMake(0,0,image.size.width/2, image.size.height/2)];
    
    gifview.image=image;
    hud.customView=gifview;
    hud.backgroundView.color = [UIColor colorWithWhite:0.f alpha:.2f];
    hud.margin = 0;
   
    
}



#pragma mark 显示错误信息
+ (void)showError:(NSString *)error toView:(UIView *)view{
    [self show:error icon:@"error" view:view];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    [self show:success icon:@"success" view:view];
}

#pragma mark 显示一些信息
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [self getWindow];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = message;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
    hud.backgroundView.color = [UIColor colorWithWhite:0.f alpha:.2f];;

    return hud;
}

//+ (void)
+ (void)showSuccess:(NSString *)success
{
    [self showSuccess:success toView:nil];
    
}

+ (void)showError:(NSString *)error
{
    [self showError:error toView:nil];
}

+ (MBProgressHUD *)showMessage:(NSString *)message
{
    return [self showMessage:message toView:nil];
}

+ (void)hideHUDForView:(UIView *)view
{
    if (view == nil) view = [self getWindow];
    [self hideHUDForView:view animated:YES];
}

+ (void)showIconHUD{
    
    [self showIconWithView:nil];
}

+ (void)hideHUD
{
    [self hideHUDForView:nil];
}

+ (void)showHUB{

    [self showMessage:nil toView:nil];
}

// 取window的方法
+ (UIWindow *)getWindow
{
    return  ((AppDelegate*)[UIApplication sharedApplication].delegate).window;
}

+ (void)showHUDWithToShowStr:(NSString *)showStr HUDMode:(MBProgressHUDMode)mode autoHide:(BOOL)autoHide afterDelay:(NSTimeInterval)afterDelay userInteractionEnabled:(BOOL)yesOrNo
{
    
    MBProgressHUD *hud =[self showMessage:showStr toView:nil];
    hud.userInteractionEnabled = !yesOrNo;//加上这个属性才能在HUD还没隐藏的时候点击到别的view
    
    hud.mode = mode;

    
    if (autoHide)
    {
        [hud hideAnimated:yesOrNo afterDelay:afterDelay];
    }
    
}

+ (void)showHUDWithToShowStr:(NSString *)showStr{
    
    MBProgressHUD *hud =[self showMessage:showStr toView:nil];
    hud.userInteractionEnabled = YES;//加上这个属性才能在HUD还没隐藏的时候点击到别的view
    
    hud.mode = MBProgressHUDModeText;
    
    [hud hideAnimated:YES  afterDelay:2];
    
}



@end
