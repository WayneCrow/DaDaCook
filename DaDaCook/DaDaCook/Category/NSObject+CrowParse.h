//
//  NSObject+CrowParse.h
//  DaDaCook
//
//  Created by tarena11 on 16/8/16.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (CrowParse)<YYModel>

+ (id)parse:(id)JSON;

@end
