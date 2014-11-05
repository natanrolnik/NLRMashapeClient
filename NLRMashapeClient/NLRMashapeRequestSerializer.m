//
//  NLRMashapeRequestSerializer.m
//  NLRMashapeClient
//
//  Created by Natan Rolnik on 01/11/14.
//  Copyright (c) 2014 natanrolnik. All rights reserved.
//

#import "NLRMashapeRequestSerializer.h"

@interface NLRMashapeRequestSerializer ()

@property (nonatomic, strong) NSString *mashapeKey;

@end

@implementation NLRMashapeRequestSerializer

- (instancetype)initWithMashapeAppKey:(NSString *)mashapeKey
{
    self = [super init];
    
    [self setValue:mashapeKey forHTTPHeaderField:@"X-Mashape-Key"];
    
    return self;
}

@end
