//
//  ImageLightbox.h
//
//  Created by Justin McNally on 2/11/13.
//  Copyright (c) 2013 Kohactive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageLightbox : UIViewController {
  UIView *blocker;
  UIImageView *image;
  UIButton *closeButton;
  Boolean displayed;
  UITapGestureRecognizer *tapRecognize;
}

-(void) showImage:(NSString *) imageUrl;
-(void) hideImage;

@end
