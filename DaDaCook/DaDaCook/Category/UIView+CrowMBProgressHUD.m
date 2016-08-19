//
//  UIView+CrowMBProgressHUD.m
//  DaDaCook
//
//  Created by tarena11 on 16/8/16.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "UIView+CrowMBProgressHUD.h"

@implementation UIView (CrowMBProgressHUD)

- (void)showHUD {
    [self hideHUD];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    [hud hideAnimated:YES afterDelay:2];
}

- (void)hideHUD {
    [MBProgressHUD hideHUDForView:self animated:YES];
}

- (void)showWarning:(NSString *)message {
    [self hideHUD];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode           = MBProgressHUDModeText;
    hud.label.text     = message;
    [hud hideAnimated:YES afterDelay:2];
}

@end
