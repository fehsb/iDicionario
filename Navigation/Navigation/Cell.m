//
//  Cell.m
//  Navigation
//
//  Created by Fernando on 3/19/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "Cell.h"

@implementation Cell
//
//-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"seila"];
////    self.textLabel = [[UILabel alloc]init];
//    //[self addSubview:self.textLabel];
//    return self;
//}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(0,0,45,45);
}

@end
