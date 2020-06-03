//
//  FGTNetworkFetch.h
//  Astronomy Picture of the Day
//
//  Created by FGT MAC on 6/3/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FGTPhoto;

NS_ASSUME_NONNULL_BEGIN

@interface FGTNetworkFetch : NSObject

- (void)fetchPhotos:(NSString *)month completion:(void(^)(FGTPhoto *photos, NSError *error))completion;
    

@end

NS_ASSUME_NONNULL_END
