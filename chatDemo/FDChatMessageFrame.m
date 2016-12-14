//
//  FDChatMessageFrame.m
//  chatDemo
//
//  Created by xieyan on 2016/12/9.
//  Copyright © 2016年 Fruitday. All rights reserved.
//

#import "FDChatMessageFrame.h"
#import "FDChatMessage.h"

#define FDTextPadding 20
@implementation FDChatMessageFrame

- (void)setMessage:(FDChatMessage *)message
{
    _message = message;
    
    //设备屏幕的宽
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    //边距
    CGFloat padding = 10;
    //时间
    if (message.hideTime == NO) {
        CGFloat timeX = 0;
        CGFloat timeY = padding/2;
        CGFloat timeW = screenW;
        CGFloat timeH = 20;
        _timeF = CGRectMake(timeX, timeY, timeW, timeH);
    }
    
    //头像
    CGFloat iconX;
    CGFloat iconY = CGRectGetMaxY(_timeF) + padding;
    CGFloat iconW = 40;
    CGFloat iconH = 40;
    if (message.type == FDChatMessageGatsby) {//Gatsby发的  头像在右边
        iconX = screenW - iconW - padding;
    }else{//Jobs发的  头像在左边
        iconX = padding;
    }
    
    _iconF = CGRectMake(iconX, iconY, iconW, iconH);
    
    //正文
    CGSize textSize = [message.text boundingRectWithSize:CGSizeMake(screenW - 2 * iconW - 1.5 * padding, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    
    //最终正文的size
    CGSize lastBtnSize = CGSizeMake(textSize.width + FDTextPadding , textSize.height + FDTextPadding );
    
    CGFloat textX ;
    CGFloat textY = iconY;
    
    if (message.type == FDChatMessageGatsby) {
        textX = iconX - padding/2 - lastBtnSize.width;
    }else{
        textX = CGRectGetMaxX(_iconF) + padding/2;
    }
    
    _textF = (CGRect){{textX,textY},lastBtnSize};
    
    //cell的高度
    CGFloat iconMaxY = CGRectGetMaxY(_iconF);
    CGFloat textMaxY = CGRectGetMaxY(_textF);
    _cellHeight = MAX(iconMaxY, textMaxY) +  padding;
}
@end
