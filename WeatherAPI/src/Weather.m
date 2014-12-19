//
//  Weather.m
//  WeatherAPI
//
//  Created by Looping on 12/19/14.
//  Copyright (c) 2014 RidgeCorn. All rights reserved.
//

#import "Weather.h"

@implementation Weather

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        _city = [dict objectForKey:@"city"];
        _cityId = [dict objectForKey:@"cityid"];
        _temp = @([[dict objectForKey:@"temp"] integerValue]);
        _updateTime = [dict objectForKey:@"time"];
    }
    
    return self;
}

@end
