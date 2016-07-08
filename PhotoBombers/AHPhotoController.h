//
//  AHPhotoController.h
//  PhotoBombers
//
//  Created by Hickman on 5/5/16.
//  Copyright © 2016 Hickman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AHPhotoController : NSObject

+ (void)imageForPhoto:(NSDictionary *)photo size:(NSString *)size completion:(void(^)(UIImage *image))completion;

@end
