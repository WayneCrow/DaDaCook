//
//  CrowHomePageHeaderModel.h
//  DaDaCook
//
//  Created by tarena11 on 16/8/16.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CrowHomePageHeaderDataModel,CrowHomePageHeaderDataListModel;

@interface CrowHomePageHeaderModel : NSObject

@property (nonatomic, copy  ) NSString  *msg;
@property (nonatomic, strong) CrowHomePageHeaderDataModel *data;
@property (nonatomic, assign) NSInteger code;

@end


@interface CrowHomePageHeaderDataModel : NSObject

@property (nonatomic, strong) NSArray<CrowHomePageHeaderDataListModel *> *list;

@end


@interface CrowHomePageHeaderDataListModel : NSObject

// focus_id -> focusId
@property (nonatomic, assign) NSInteger focusId;
// jump_url -> jumpURL
@property (nonatomic, copy  ) NSString  *jumpURL;
// image_url -> imageURL
@property (nonatomic, copy  ) NSString  *imageURL;
// description -> des
@property (nonatomic, copy  ) NSString  *des;
@property (nonatomic, assign) NSInteger position;
@property (nonatomic, assign) NSInteger action;

@end
