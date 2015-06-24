//
//  DCPathItemButton.m
//  DCPathButton
//
//  Created by tang dixi on 31/7/14.
//  Copyright (c) 2014 Tangdxi. All rights reserved.
//

#import "DCPathItemButton.h"

@interface DCPathItemButton ()
@property (strong, nonatomic) UIImageView *backgroundImageView;
@end

@implementation DCPathItemButton

-(id)initWithTitle:(NSString*)title image:(UIImage*)image
{
    if (self = [super init]) {
        CGRect itemFrame = CGRectMake(0, 0, image.size.width, image.size.height);
     
        UIFont *titleFont = [UIFont boldSystemFontOfSize:12.0f];
        
        CGRect bounds = [title boundingRectWithSize:CGSizeMake(70, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:titleFont,NSFontAttributeName,nil] context:nil];
        
        itemFrame.size.height += bounds.size.height;
        itemFrame.size.width = bounds.size.width;

        [self setFrame:itemFrame];
        
        [self setTitle:title forState:UIControlStateNormal];
        [self.titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
        [self.titleLabel setFont:titleFont];
        [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [self setTitleColor:[UIColor colorWithWhite:75.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
        [self setTitleEdgeInsets:UIEdgeInsetsMake(45, 0, 0, 0)];
        
        _backgroundImageView = [[UIImageView alloc] initWithImage:image];
        _backgroundImageView.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2-10);
        
        [self addSubview:_backgroundImageView];
        [self addTarget:_delegate action:@selector(itemButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
   
    return self;
}

@end
