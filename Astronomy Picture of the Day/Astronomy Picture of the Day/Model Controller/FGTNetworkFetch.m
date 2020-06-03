//
//  FGTNetworkFetch.m
//  Astronomy Picture of the Day
//
//  Created by FGT MAC on 6/3/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

#import "FGTNetworkFetch.h"
#import "FGTPhoto.h"

@implementation FGTNetworkFetch

- (void)fetchPhotos:(NSString *)month completion:(void(^)(FGTPhoto *photo, NSError *error))completion{
    
    
    //1.Built URL
    NSString *baseURL = @"https://api.nasa.gov/planetary/apod";
    NSString *keyString = @"jrVEkWbxdUnM3zWk4ekDYlmvsyqQYOjEP4KCgsQn";
    NSURLComponents *components = [NSURLComponents componentsWithString:baseURL];
    
    //Query items
    NSURLQueryItem *key = [NSURLQueryItem queryItemWithName:@"api_key" value:keyString];
    components.queryItems = @[key];
    
    NSURL *url = components.URL;
    
    NSLog(@"URL: %@", url);
    
    //2.Create Data Session
    [[NSURLSession.sharedSession dataTaskWithURL: url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if(error){
            NSLog(@"Error: %@", error);
            completion(nil,error);
            return;
        }
        
        if(!data){
            NSLog(@"No data return");
            return;
        }
        
        
        NSLog(@"Fetching completed");
        
        //3.Handle data
        NSError *parsingError;
        NSDictionary *photoJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parsingError];
        
        if(parsingError){
            NSLog(@"Parsing error: %@", parsingError);
            completion(nil,parsingError);
            return;
        }
        
        FGTPhoto *photo = [[FGTPhoto alloc] initWithDictionary:photoJSON];
        
        NSLog(@"json: %@", photoJSON);
        
        completion(photo,nil);
        
    }]resume];
    
}

@end
