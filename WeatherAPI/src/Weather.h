//
//  Weather.h
//  WeatherAPI
//
//  Created by Looping on 12/19/14.
//  Copyright (c) 2014 RidgeCorn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weather : NSObject

@property (nonatomic) NSString *city;
@property (nonatomic) NSString *cityId;
@property (nonatomic) NSNumber *temp;
@property (nonatomic) NSString *updateTime;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
