//
//  FGTPhoto.h
//  Astronomy Picture of the Day
//
//  Created by FGT MAC on 6/3/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FGTPhoto : NSObject

@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *explanation;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *mediaType;
@property (nonatomic) NSURL *url;


- (instancetype)initWithDictionary: (NSDictionary *) dictionary;

//- (instancetype)initWithDate:(NSString *) date
//explanation: (NSString *) explanation
//      title: (NSString *) title
//  mediaType: (NSString *) mediaType
//        url: (NSURL *) url

@end

NS_ASSUME_NONNULL_END
