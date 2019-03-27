//
//  YHTBaseView.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/26.
//  Copyright © 2019 Aero. All rights reserved.
//

#import "YHTBaseView.h"

@interface YHTBaseView ()

{
    id _target;
    SEL _action;
    BOOL _selected;
}


@end
@implementation YHTBaseView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
   
//    if ([_target respondsToSelector:_action]) {
//        [_target performSelector:_action withObject:self];
//    }
    
}

-(void)addtarget:(id)target event:(SEL)action{
    _target = target;
    _action = action;
}
- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [self touchesEnded:touches withEvent:event];
    
}
@end
