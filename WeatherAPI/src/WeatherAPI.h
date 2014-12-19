//
//  WeatherAPI.h
//  WeatherAPI
//
//  Created by Looping on 12/19/14.
//  Copyright (c) 2014 RidgeCorn. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Weather;

@interface WeatherAPI : NSObject

+ (instancetype)sharedAPI;

- (void)updateWeatherWithCityId:(NSString *)cityId completedBlock:(void(^)(Weather *weather, NSError *error))completed;

@end
