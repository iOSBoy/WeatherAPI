//
//  WeatherAPI.m
//  WeatherAPI
//
//  Created by Looping on 12/19/14.
//  Copyright (c) 2014 RidgeCorn. All rights reserved.
//

#import "WeatherAPI.h"
#import "Weather.h"
#import <AFNetworking.h>

@interface WeatherAPI ()

@property (nonatomic, strong) AFHTTPRequestOperationManager *requestManager;

@end

@implementation WeatherAPI

+ (instancetype)sharedAPI {
    static WeatherAPI *SharedAPI;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SharedAPI = [[WeatherAPI alloc] init];
        SharedAPI.requestManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://www.weather.com.cn/"]];
        SharedAPI.requestManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    });
    
    return SharedAPI;
}

- (void)updateWeatherWithCityId:(NSString *)cityId completedBlock:(void (^)(Weather *, NSError *))completed {
    [_requestManager GET:[NSString stringWithFormat:@"data/sk/%@.html", cityId] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        completed([[Weather alloc] initWithDictionary:[responseObject objectForKey:@"weatherinfo"]], nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (completed) {
            completed(nil, error);
        }
    }];
}

@end
