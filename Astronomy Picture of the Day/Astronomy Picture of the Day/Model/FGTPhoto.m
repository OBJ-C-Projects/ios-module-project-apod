//
//  FGTPhoto.m
//  Astronomy Picture of the Day
//
//  Created by FGT MAC on 6/3/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

#import "FGTPhoto.h"

@implementation FGTPhoto

- (instancetype)initWithDictionary: (NSDictionary *) dictionary{
    
    self = [super init];
    
    if(!self){return nil;}
    
    _date = dictionary[@"date"];
    _explanation = dictionary[@"explanation"];
    _title = dictionary[@"title"];
    _mediaType = dictionary[@"media_type"];
    
    //Convert String to URL
    NSString *URLString = dictionary[@"url"];
    _url = [NSURL URLWithString:URLString];
    
    return self;
}


@end
