//
//  AHPhotoController.m
//  PhotoBombers
//
//  Created by Hickman on 5/5/16.
//  Copyright © 2016 Hickman. All rights reserved.
//

#import "AHPhotoController.h"
#import <SAMCache/SAMCache.h>


@implementation AHPhotoController

+ (void)imageForPhoto:(NSDictionary *)photo size:(NSString *)size completion:(void(^)(UIImage *image))completion
{
    
    if (photo == nil || size == nil || completion ==nil)
    {
        return;
    }
    
    NSString *key = [[NSString alloc] initWithFormat:@"%@-%@", photo[@"id"], size];
    UIImage *image = [[SAMCache sharedCache] imageForKey:key];
    if (image) {
        completion(image);
        return;
    }
    
    NSURL *url = [[NSURL alloc] initWithString:photo[@"images"][size][@"url"]];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error)
                                      {
                                          NSData *data = [[NSData alloc] initWithContentsOfURL:location];
                                          UIImage *image = [[UIImage alloc] initWithData:data];
                                          [[SAMCache sharedCache] setImage:image forKey:key];
                                          
                                          dispatch_async(dispatch_get_main_queue(), ^{
                                              completion(image);
                                          });
                                      }];
    [task resume];

}


@end
