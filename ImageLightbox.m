//
//  ImageLightbox.m
//
//  Created by Justin McNally on 2/11/13.
//  Copyright (c) 2013 Kohactive. All rights reserved.
//

#import "ImageLightbox.h"

@implementation ImageLightbox


-(id) init {
  self = [super init];
  if (self) {
    displayed = NO;
    UIImage *closeImage = [UIImage imageNamed:@"close-modal"];
    closeButton = [[UIButton alloc] init];
    [closeButton setImage:closeImage forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(hideImage) forControlEvents:UIControlEventTouchUpInside];
    
  }
  return self;
}


-(void) showImage:(NSString *) imageUrl {

 if (displayed) {
   return;
 }

 blocker = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
 [blocker setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:.4]];
 
 tapRecognize = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideImage)];
 
 UIImage *eImage = [[UIImage alloc] initWithContentsOfFile:imageUrl]
 
 
 image = [[UIImageView alloc] initWithImage:eImage];
 
 
 [image setFrame:CGRectMake((SCREEN_WIDTH - image.frame.size.width) / 2, (SCREEN_HEIGHT - image.frame.size.height) / 2,  image.frame.size.width, image.frame.size.height)];
 
 
 
 
 
 [blocker addSubview:image];
 
 [closeButton setFrame:CGRectMake(image.frame.origin.x + image.frame.size.width - 20, image.frame.origin.y - 20, 40,40)];
 
 [blocker addSubview:closeButton];
 
 [tapRecognize setNumberOfTapsRequired:1];
 [tapRecognize setNumberOfTouchesRequired:1];
 
 [blocker addGestureRecognizer:tapRecognize];
 
 [[self topView] addSubview:blocker];
 
 [blocker setAlpha:0];
 
 [UIView animateWithDuration:0.4f animations:^{
   [blocker setAlpha:1];
 }
 completion:^(BOOL finished) {
      displayed = YES;
 }
 ];
 
 
}

-(void) hideImage {
  if (!displayed) {
    return;
  }
  
  [UIView animateWithDuration:0.4f animations:^{
    [blocker setAlpha:0];
  } completion:^(BOOL finished) {
    [blocker removeFromSuperview];
    displayed = NO;
  }];
  
}

-(UIView *) topView {
  UIView *rootView = [[[[UIApplication sharedApplication] keyWindow] subviews] objectAtIndex:0];
  return rootView;
}



@end
