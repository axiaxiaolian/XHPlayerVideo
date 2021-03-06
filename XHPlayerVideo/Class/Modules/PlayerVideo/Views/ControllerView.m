
//  ControllerView.m
//  XHPlayerVideo
//
//  Created by C on 16/8/27.
//  Copyright © 2016年 C. All rights reserved.
//

#import "ControllerView.h"
#import <Masonry.h>
#import "Macro.h"


@implementation ControllerView{
    
}
- (instancetype)init{
    self = [super init];
    if (self) {
        [self loadSubviews];
    }
    return self;
}
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    //画圆角
    NSBezierPath* bezierPath = [NSBezierPath bezierPathWithRoundedRect:NSInsetRect(self.bounds,0,0) xRadius:5 yRadius:5];
    [CColor(255, 255, 255, 0.7) setFill];
    [bezierPath fill];
}


-(void)loadSubviews{
    
    self.turnDownRateBtn = ({
        NSButton* btn = [[NSButton alloc] init];
        [btn setTitle:@"减速"];
        [self addSubview:btn];
        btn;
    });
    
    self.currentRateLabel = ({
        NSTextField* tf = [[NSTextField alloc] init];
        [tf setBezeled:NO];
        [tf setDrawsBackground:NO];
        [tf setEditable:NO];
        [tf setSelectable:NO];
        tf.alignment = NSCenterTextAlignment;
        tf.stringValue = @"×1.0";
        [self addSubview:tf];
        tf;
    });
    
    self.turnOnRateBtn = ({
        NSButton* btn = [[NSButton alloc] init];
        [btn setTitle:@"加速"];
        [self addSubview:btn];
        btn;
    });
    
    NSView* view1 = [[NSView alloc] init];//填充view
    [self addSubview:view1];
    
    
    
    
    self.lastVideoBtn = ({
        NSButton* btn = [[NSButton alloc] init];
        [btn setTitle:@"上一个"];
        [self addSubview:btn];
        btn;
    });
    self.playSwitchBtn = ({
        NSButton* btn = [[NSButton alloc] init];
        [btn setTitle:@"播放"];
        [self addSubview:btn];
        btn;
    });
    self.nextVideoBtn = ({
        NSButton* btn = [[NSButton alloc] init];
        [btn setTitle:@"下一个"];
        [self addSubview:btn];
        btn;
    });
    
    NSView* view2 = [[NSView alloc] init];//填充view
    [self addSubview:view2];
    
    self.soundSwitchBtn = ({
        NSButton* btn = [[NSButton alloc] init];
        [btn setTitle:@"🔊"];
        [self addSubview:btn];
        btn;
    });
    self.volumeSlider = ({
        NSSlider* slider = [[NSSlider alloc] init];
        slider.maxValue = 100;
        slider.intValue = 100;
        slider.continuous = YES;//是否一直接收消息
        [self addSubview:slider];
        slider;
    });
    
    
    self.videoSlider = ({
        NSSlider* slider = [[NSSlider alloc] init];
        slider.continuous = YES;//是否一直接收消息
        [self addSubview:slider];
        slider;
    });
    self.videoCurrentTimeLabel = ({
        NSTextField* tf = [[NSTextField alloc] init];
        [tf setBezeled:NO];
        [tf setDrawsBackground:NO];
        [tf setEditable:NO];
        [tf setSelectable:NO];
        tf.stringValue = @"00:00:00";
        [self addSubview:tf];
        tf;
    });

    self.videoTotalTimeLabel = ({
        NSTextField* tf = [[NSTextField alloc] init];
        [tf setBezeled:NO];
        [tf setDrawsBackground:NO];
        [tf setEditable:NO];
        [tf setSelectable:NO];
        tf.stringValue = @"/00:00:00";
        [self addSubview:tf];
        tf;
    });

    //layout
    [self.turnDownRateBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self).offset(10);
        make.size.mas_equalTo(NSMakeSize(30, 25));
    }];
    
    [self.currentRateLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.turnDownRateBtn.mas_right).offset(10);
        make.top.equalTo(self).offset(15);
        make.size.mas_equalTo(NSMakeSize(30, 15));
    }];
    
    [self.turnOnRateBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.currentRateLabel.mas_right).offset(10);
        make.top.equalTo(self).offset(10);
        make.size.mas_equalTo(NSMakeSize(30, 25));
    }];
    
    
    
    
    [view1 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.turnOnRateBtn.mas_right);
        make.right.equalTo(self.lastVideoBtn.mas_left).offset(-10);
    }];
    
    
    
    
    
    [self.lastVideoBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(5);
        make.right.equalTo(self.playSwitchBtn.mas_left).offset(-10);
        make.size.mas_equalTo(NSMakeSize(50, 35));
    }];
    
    [self.playSwitchBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(5);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(NSMakeSize(35, 35));
    }];
    
    [self.nextVideoBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(5);
        make.left.equalTo(self.playSwitchBtn.mas_right).offset(10);
        make.size.mas_equalTo(NSMakeSize(50, 35));
    }];
    
    
    
    
    [view2 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nextVideoBtn.mas_right);
        make.right.equalTo(self.soundSwitchBtn.mas_left).offset(-10);
    }];
    
    
    
    
    
    [self.soundSwitchBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(5);
        make.right.equalTo(self.volumeSlider.mas_left).offset(-10);
        make.size.mas_equalTo(NSMakeSize(35, 35));
    }];
    
    [self.volumeSlider mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
        make.size.mas_equalTo(NSMakeSize(80, 25));
    }];
    
    
    
    
    
    [self.videoSlider mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self.videoCurrentTimeLabel.mas_left).offset(-10);
        make.bottom.equalTo(self).offset(-5);
        make.height.mas_equalTo(20);
    }];
    [self.videoCurrentTimeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.videoTotalTimeLabel.mas_left).offset(-0);
        make.bottom.equalTo(self).offset(-5);
        make.size.mas_equalTo(NSMakeSize(55, 20));
    }];
    [self.videoTotalTimeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-10);
        make.bottom.equalTo(self).offset(-5);
        make.size.mas_equalTo(NSMakeSize(60, 20));
    }];
}
@end
