//
//  OddInfo.m
//
//  Created by   on 02/07/2015
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "OddInfo.h"


NSString *const kOddInfoId = @"id";
NSString *const kOddInfoMoney = @"money";
NSString *const kOddInfoPoints = @"points";
NSString *const kOddInfoOverMoney = @"over_money";
NSString *const kOddInfoUnderMoney = @"under_money";
NSString *const kOddInfoLineType = @"line_type";
NSString *const kOddInfoTeamNumber = @"team_number";
NSString *const kOddInfoML = @"ML";
NSString *const kOddInfoSportsbookId = @"sportsbook_id";
NSString *const kOddInfoTimeStamp = @"time_stamp";
NSString *const kOddInfoCreated = @"created";
NSString *const kOddInfoEventNumber = @"event_number";


@interface OddInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation OddInfo

@synthesize oddInfoIdentifier = _oddInfoIdentifier;
@synthesize money = _money;
@synthesize points = _points;
@synthesize overMoney = _overMoney;
@synthesize underMoney = _underMoney;
@synthesize lineType = _lineType;
@synthesize teamNumber = _teamNumber;
@synthesize mL = _mL;
@synthesize sportsbookId = _sportsbookId;
@synthesize timeStamp = _timeStamp;
@synthesize created = _created;
@synthesize eventNumber = _eventNumber;


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
            self.oddInfoIdentifier = [self objectOrNilForKey:kOddInfoId fromDictionary:dict];
            self.money = [self objectOrNilForKey:kOddInfoMoney fromDictionary:dict];
            self.points = [self objectOrNilForKey:kOddInfoPoints fromDictionary:dict];
            self.overMoney = [self objectOrNilForKey:kOddInfoOverMoney fromDictionary:dict];
            self.underMoney = [self objectOrNilForKey:kOddInfoUnderMoney fromDictionary:dict];
            self.lineType = [self objectOrNilForKey:kOddInfoLineType fromDictionary:dict];
            self.teamNumber = [self objectOrNilForKey:kOddInfoTeamNumber fromDictionary:dict];
            self.mL = [self objectOrNilForKey:kOddInfoML fromDictionary:dict];
            self.sportsbookId = [self objectOrNilForKey:kOddInfoSportsbookId fromDictionary:dict];
            self.timeStamp = [self objectOrNilForKey:kOddInfoTimeStamp fromDictionary:dict];
            self.created = [self objectOrNilForKey:kOddInfoCreated fromDictionary:dict];
            self.eventNumber = [self objectOrNilForKey:kOddInfoEventNumber fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.oddInfoIdentifier forKey:kOddInfoId];
    [mutableDict setValue:self.money forKey:kOddInfoMoney];
    [mutableDict setValue:self.points forKey:kOddInfoPoints];
    [mutableDict setValue:self.overMoney forKey:kOddInfoOverMoney];
    [mutableDict setValue:self.underMoney forKey:kOddInfoUnderMoney];
    [mutableDict setValue:self.lineType forKey:kOddInfoLineType];
    [mutableDict setValue:self.teamNumber forKey:kOddInfoTeamNumber];
    [mutableDict setValue:self.mL forKey:kOddInfoML];
    [mutableDict setValue:self.sportsbookId forKey:kOddInfoSportsbookId];
    [mutableDict setValue:self.timeStamp forKey:kOddInfoTimeStamp];
    [mutableDict setValue:self.created forKey:kOddInfoCreated];
    [mutableDict setValue:self.eventNumber forKey:kOddInfoEventNumber];

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

    self.oddInfoIdentifier = [aDecoder decodeObjectForKey:kOddInfoId];
    self.money = [aDecoder decodeObjectForKey:kOddInfoMoney];
    self.points = [aDecoder decodeObjectForKey:kOddInfoPoints];
    self.overMoney = [aDecoder decodeObjectForKey:kOddInfoOverMoney];
    self.underMoney = [aDecoder decodeObjectForKey:kOddInfoUnderMoney];
    self.lineType = [aDecoder decodeObjectForKey:kOddInfoLineType];
    self.teamNumber = [aDecoder decodeObjectForKey:kOddInfoTeamNumber];
    self.mL = [aDecoder decodeObjectForKey:kOddInfoML];
    self.sportsbookId = [aDecoder decodeObjectForKey:kOddInfoSportsbookId];
    self.timeStamp = [aDecoder decodeObjectForKey:kOddInfoTimeStamp];
    self.created = [aDecoder decodeObjectForKey:kOddInfoCreated];
    self.eventNumber = [aDecoder decodeObjectForKey:kOddInfoEventNumber];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_oddInfoIdentifier forKey:kOddInfoId];
    [aCoder encodeObject:_money forKey:kOddInfoMoney];
    [aCoder encodeObject:_points forKey:kOddInfoPoints];
    [aCoder encodeObject:_overMoney forKey:kOddInfoOverMoney];
    [aCoder encodeObject:_underMoney forKey:kOddInfoUnderMoney];
    [aCoder encodeObject:_lineType forKey:kOddInfoLineType];
    [aCoder encodeObject:_teamNumber forKey:kOddInfoTeamNumber];
    [aCoder encodeObject:_mL forKey:kOddInfoML];
    [aCoder encodeObject:_sportsbookId forKey:kOddInfoSportsbookId];
    [aCoder encodeObject:_timeStamp forKey:kOddInfoTimeStamp];
    [aCoder encodeObject:_created forKey:kOddInfoCreated];
    [aCoder encodeObject:_eventNumber forKey:kOddInfoEventNumber];
}

- (id)copyWithZone:(NSZone *)zone
{
    OddInfo *copy = [[OddInfo alloc] init];
    
    if (copy) {

        copy.oddInfoIdentifier = [self.oddInfoIdentifier copyWithZone:zone];
        copy.money = [self.money copyWithZone:zone];
        copy.points = [self.points copyWithZone:zone];
        copy.overMoney = [self.overMoney copyWithZone:zone];
        copy.underMoney = [self.underMoney copyWithZone:zone];
        copy.lineType = [self.lineType copyWithZone:zone];
        copy.teamNumber = [self.teamNumber copyWithZone:zone];
        copy.mL = [self.mL copyWithZone:zone];
        copy.sportsbookId = [self.sportsbookId copyWithZone:zone];
        copy.timeStamp = [self.timeStamp copyWithZone:zone];
        copy.created = [self.created copyWithZone:zone];
        copy.eventNumber = [self.eventNumber copyWithZone:zone];
    }
    
    return copy;
}


@end
