//
//  TeamAOdds.m
//
//  Created by   on 03/07/2015
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "Odd.h"


NSString *const kTeamAOddsOver = @"over";
NSString *const kTeamAOddsUnder = @"under";
NSString *const kTeamAOddsId = @"id";
NSString *const kTeamAOddsPoint = @"point";
NSString *const kTeamAOddsTotalId = @"total_id";
NSString *const kTeamAOddsPointId = @"point_id";
NSString *const kTeamAOddsTotalMid = @"total_mid";
NSString *const kTeamAOddsPointMid = @"point_mid";
NSString *const kTeamAOddsMoneyId = @"money_id";
NSString *const kTeamAOddsMoney = @"money";


@interface Odd ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Odd

@synthesize over = _over;
@synthesize under = _under;
@synthesize teamAOddsIdentifier = _teamAOddsIdentifier;
@synthesize point = _point;
@synthesize totalId = _totalId;
@synthesize pointId = _pointId;
@synthesize totalMid = _totalMid;
@synthesize pointMid = _pointMid;
@synthesize moneyId = _moneyId;
@synthesize money = _money;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.over = [self objectOrNilForKey:kTeamAOddsOver fromDictionary:dict];
            self.under = [self objectOrNilForKey:kTeamAOddsUnder fromDictionary:dict];
            self.teamAOddsIdentifier = [self objectOrNilForKey:kTeamAOddsId fromDictionary:dict];
            self.point = [self objectOrNilForKey:kTeamAOddsPoint fromDictionary:dict];
            self.totalId = [self objectOrNilForKey:kTeamAOddsTotalId fromDictionary:dict];
            self.pointId = [self objectOrNilForKey:kTeamAOddsPointId fromDictionary:dict];
            self.totalMid = [self objectOrNilForKey:kTeamAOddsTotalMid fromDictionary:dict];
            self.pointMid = [self objectOrNilForKey:kTeamAOddsPointMid fromDictionary:dict];
            self.moneyId = [self objectOrNilForKey:kTeamAOddsMoneyId fromDictionary:dict];
            self.money = [self objectOrNilForKey:kTeamAOddsMoney fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.over forKey:kTeamAOddsOver];
    [mutableDict setValue:self.under forKey:kTeamAOddsUnder];
    [mutableDict setValue:self.teamAOddsIdentifier forKey:kTeamAOddsId];
    [mutableDict setValue:self.point forKey:kTeamAOddsPoint];
    [mutableDict setValue:self.totalId forKey:kTeamAOddsTotalId];
    [mutableDict setValue:self.pointId forKey:kTeamAOddsPointId];
    [mutableDict setValue:self.totalMid forKey:kTeamAOddsTotalMid];
    [mutableDict setValue:self.pointMid forKey:kTeamAOddsPointMid];
    [mutableDict setValue:self.moneyId forKey:kTeamAOddsMoneyId];
    [mutableDict setValue:self.money forKey:kTeamAOddsMoney];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.over = [aDecoder decodeObjectForKey:kTeamAOddsOver];
    self.under = [aDecoder decodeObjectForKey:kTeamAOddsUnder];
    self.teamAOddsIdentifier = [aDecoder decodeObjectForKey:kTeamAOddsId];
    self.point = [aDecoder decodeObjectForKey:kTeamAOddsPoint];
    self.totalId = [aDecoder decodeObjectForKey:kTeamAOddsTotalId];
    self.pointId = [aDecoder decodeObjectForKey:kTeamAOddsPointId];
    self.totalMid = [aDecoder decodeObjectForKey:kTeamAOddsTotalMid];
    self.pointMid = [aDecoder decodeObjectForKey:kTeamAOddsPointMid];
    self.moneyId = [aDecoder decodeObjectForKey:kTeamAOddsMoneyId];
    self.money = [aDecoder decodeObjectForKey:kTeamAOddsMoney];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_over forKey:kTeamAOddsOver];
    [aCoder encodeObject:_under forKey:kTeamAOddsUnder];
    [aCoder encodeObject:_teamAOddsIdentifier forKey:kTeamAOddsId];
    [aCoder encodeObject:_point forKey:kTeamAOddsPoint];
    [aCoder encodeObject:_totalId forKey:kTeamAOddsTotalId];
    [aCoder encodeObject:_pointId forKey:kTeamAOddsPointId];
    [aCoder encodeObject:_totalMid forKey:kTeamAOddsTotalMid];
    [aCoder encodeObject:_pointMid forKey:kTeamAOddsPointMid];
    [aCoder encodeObject:_moneyId forKey:kTeamAOddsMoneyId];
    [aCoder encodeObject:_money forKey:kTeamAOddsMoney];
}

- (id)copyWithZone:(NSZone *)zone
{
    Odd *copy = [[Odd alloc] init];
    
    if (copy) {

        copy.over = [self.over copyWithZone:zone];
        copy.under = [self.under copyWithZone:zone];
        copy.teamAOddsIdentifier = [self.teamAOddsIdentifier copyWithZone:zone];
        copy.point = [self.point copyWithZone:zone];
        copy.totalId = [self.totalId copyWithZone:zone];
        copy.pointId = [self.pointId copyWithZone:zone];
        copy.totalMid = [self.totalMid copyWithZone:zone];
        copy.pointMid = [self.pointMid copyWithZone:zone];
        copy.moneyId = [self.moneyId copyWithZone:zone];
        copy.money = [self.money copyWithZone:zone];
    }
    
    return copy;
}


@end
