//
//  FDChatMessageCell.m
//  chatDemo
//
//  Created by xieyan on 2016/12/9.
//  Copyright © 2016年 Fruitday. All rights reserved.
//

#import "FDChatMessageCell.h"
#import "FDChatMessage.h"
#import "FDChatMessageFrame.h"

@interface FDChatMessageCell ()
/**
 *  时间
 */
@property (nonatomic, weak)UILabel *timeLbl;

/**
 *  头像
 */
@property (nonatomic, weak)UIImageView *iconImg;

/**
 *  正文
 */
@property (nonatomic, weak)UIButton *textBtn;

@end
@implementation FDChatMessageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //1.时间
        UILabel *timeLbl = [[UILabel alloc]init];
        timeLbl.textAlignment = NSTextAlignmentCenter;
        timeLbl.font = [UIFont systemFontOfSize:12.0f];
        timeLbl.textColor = [UIColor colorWithRed:191/255.0 green:191/255.0 blue:191/255.0 alpha:1.0];
        [self.contentView addSubview:timeLbl];
        self.timeLbl = timeLbl;
        
        //2.头像
        UIImageView *iconImg = [[UIImageView alloc]init];
        iconImg.layer.cornerRadius = 20.f;
        iconImg.layer.masksToBounds = YES;
        [self.contentView addSubview:iconImg];
        self.iconImg = iconImg;
        
        //3.正文
        UIButton *btn = [[UIButton alloc]init];
        btn.adjustsImageWhenHighlighted = NO; //取消高亮图片变化效果
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        btn.titleLabel.numberOfLines = 0;//自动换行
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.contentView addSubview:btn];
        self.textBtn = btn;
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setMessageFrame:(FDChatMessageFrame *)messageFrame
{
    _messageFrame = messageFrame;
    
    //数据模型
    FDChatMessage *msg = messageFrame.message;
    
    //1.时间
    self.timeLbl.text = msg.time;
    self.timeLbl.frame = messageFrame.timeF;
    
    //2.头像
    if (msg.type == FDChatMessageGatsby) {
        self.iconImg.image = [UIImage imageNamed:@"Gatsby"];
        self.textBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    }else{
        self.iconImg.image = [UIImage imageNamed:@"Jobs"];
        self.textBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    self.iconImg.frame = messageFrame.iconF;
    
    //3.正文
    [self.textBtn setTitle:msg.text forState:UIControlStateNormal];
    self.textBtn.frame = messageFrame.textF;

    if (msg.type == FDChatMessageGatsby) {
        [self.textBtn setBackgroundImage:[UIImage imageNamed:@"chat_left_bg"] forState:UIControlStateNormal];
    }else{
        [self.textBtn setBackgroundImage:[UIImage imageNamed:@"chat_right_bg"] forState:UIControlStateNormal];
    }
}

@end
