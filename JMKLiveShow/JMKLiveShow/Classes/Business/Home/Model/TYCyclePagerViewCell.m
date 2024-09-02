//
//  TYCyclePagerViewCellCollectionViewCell.m
//  JMKLiveShow
//
//  Created by llj on 2024/9/1.
//

#import "TYCyclePagerViewCell.h"
@interface TYCyclePagerViewCell ()

@end
@implementation TYCyclePagerViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addLabel];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.backgroundColor = [UIColor clearColor];
        [self addLabel];
    }
    return self;
}


- (void)addLabel {
    self.img =  [[UIImageView alloc ]init];
    self.img.contentMode = UIViewContentModeScaleAspectFit;
//    UILabel *label = [[UILabel alloc]init];
//    label.textAlignment = NSTextAlignmentCenter;
//    label.textColor = [UIColor whiteColor];
//    label.font = [UIFont systemFontOfSize:18];
    [self addSubview:self.img];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.img.frame = self.bounds;
}

@end
