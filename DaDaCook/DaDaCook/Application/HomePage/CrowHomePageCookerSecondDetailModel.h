//
//  CrowHomePageCookerSecondDetailModel.h
//  DaDaCook
//
//  Created by tarena11 on 16/8/23.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CrowHomePageCookerSecondDetailDataModel,CrowHomePageCookerSecondDetailDataMsgModel,CrowHomePageCookerSecondDetailDataCommentModel;

@interface CrowHomePageCookerSecondDetailModel : NSObject

@property (nonatomic, copy  ) NSString  *msg;
@property (nonatomic, strong) CrowHomePageCookerSecondDetailDataModel *data;
@property (nonatomic, assign) NSInteger code;

@end


@interface CrowHomePageCookerSecondDetailDataModel : NSObject

// auth_msg_list -> msg
@property (nonatomic, strong) NSArray<CrowHomePageCookerSecondDetailDataMsgModel *> *msg;
// comment_tag -> comment
@property (nonatomic, strong) NSArray<CrowHomePageCookerSecondDetailDataCommentModel *> *comment;
@property (nonatomic, assign) NSInteger comment_num;

@end

@interface CrowHomePageCookerSecondDetailDataMsgModel : NSObject

@property (nonatomic, assign) NSInteger status;
@property (nonatomic, copy  ) NSString  *title;
@property (nonatomic, copy  ) NSString  *icon;
// description -> des
@property (nonatomic, copy  ) NSString  *des;
@property (nonatomic, copy  ) NSString  *inner_description;
@property (nonatomic, assign) NSInteger type;

@end


@interface CrowHomePageCookerSecondDetailDataCommentModel : NSObject

@property (nonatomic, assign) NSInteger tag_count_content;
@property (nonatomic, copy  ) NSString  *tag_name;
@property (nonatomic, assign) NSInteger tag_count_all;
@property (nonatomic, assign) NSInteger tag_type;
@property (nonatomic, assign) NSInteger tag_id;

@end

