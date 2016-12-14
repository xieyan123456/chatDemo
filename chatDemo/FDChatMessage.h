//
//  FDChatMessage.h
//  chatDemo
//
//  Created by xieyan on 2016/12/9.
//  Copyright © 2016年 Fruitday. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FDChatMessage : NSObject

typedef NS_ENUM(NSInteger,FDChatMessageType) {
    FDChatMessageGatsby = 0,  //gatsby 发的消息
    FDChatMessageTypeJobs   //jobs 发的消息
};

///** 客服或客户id */
//@property (nonatomic, copy) NSString *sid;
///** 客服或客户id */
//@property (nonatomic, copy) NSString *did;
///** 消息类型 */
//@property (nonatomic, copy) NSString *type;
///** 消息内容 */
//@property (nonatomic, copy) NSString *msg;
///** 消息接受/发送时间 */
//@property (nonatomic, copy) NSString *time;
///** 对话id */
//@property (nonatomic, copy) NSString *chatId;
///** 是否阅读 */
//@property (nonatomic, copy) NSString *isread;
///** 是否发送 */
//@property (nonatomic, copy) NSString *issend;
///** 是否发送 */
//@property (nonatomic, copy) NSString *markid;

/**
 *  正文
 */
@property (nonatomic, copy)NSString *text;

/**
 *  时间
 */
@property (nonatomic, copy)NSString *time;

/**
 *  消息类型
 */
@property (nonatomic, assign) FDChatMessageType type ;

/**
 *  是否隐藏事件
 */
@property (nonatomic, assign)BOOL hideTime;

+ (instancetype)messageWithDict:(NSDictionary *)dict;

- (instancetype)initWithDict:(NSDictionary *)dict;
@end
