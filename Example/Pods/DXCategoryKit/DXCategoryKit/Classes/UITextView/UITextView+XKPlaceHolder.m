//
//  UITextView+XKPlaceHolder.m
//  XiongKe
//
//  Created by shaokailin on 2020/6/19.
//  Copyright © 2020 重庆博千亿网络科技有限公司. All rights reserved.
//

#import "UITextView+XKPlaceHolder.h"
#import <DXConstantsKit/XKColor.h>

@implementation UITextView (XKPlaceHolder)
- (void (^)(NSString * _Nonnull, UIColor * _Nullable))placeHolder {
    return ^(NSString *text,UIColor *color) {
        UILabel *placeholderLbl = [self valueForKey:@"_placeholderLabel"];
        if (!placeholderLbl) {
            placeholderLbl = [[UILabel alloc] init];
            placeholderLbl.numberOfLines = 0;
            placeholderLbl.font = self.font;
            [placeholderLbl sizeToFit];
            placeholderLbl.textColor = KRGBColor(212, 212, 212, 1.0);
            [self addSubview:placeholderLbl];
            [self setValue:placeholderLbl forKeyPath:@"_placeholderLabel"];
        }
        if (color) {
            placeholderLbl.textColor = color;
        }
        placeholderLbl.text = text;;
    };
}
@end
