//
//  Pool.m
//
//  Created by   on 06/07/2015
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "Pool.h"
#import "PoolMembers.h"
#import "Commisioner.h"


NSString *const kPoolIsPaid = @"is_paid";
NSString *const kPoolMotto = @"motto";
NSString *const kPoolFromDate = @"from_date";
NSString *const kPoolSenderId = @"sender_id";
NSString *const kPoolLimitedSize = @"limited_size";
NSString *const kPoolMatchUp = @"match_up";
NSString *const kPoolPickGame = @"pick_game";
NSString *const kPoolPoolMembers = @"pool_members";
NSString *const kPoolDescription = @"description";
NSString *const kPoolReceiverId = @"receiver_id";
NSString *const kPoolPrivacy = @"privacy";
NSString *const kPoolPickgameDateFrom = @"pickgame_date_from";
NSString *const kPoolPoolImage = @"pool_image";
NSString *const kPoolUnits = @"units";
NSString *const kPoolPoolLeague = @"pool_league";
NSString *const kPoolName = @"name";
NSString *const kPoolStatus = @"status";
NSString *const kPoolRegStartDate = @"reg_start_date";
NSString *const kPoolDateTime = @"date_time";
NSString *const kPoolWagerType = @"wager_type";
NSString *const kPoolJoinedMembers = @"joined_members";
NSString *const kPoolGames = @"games";
NSString *const kPoolSize = @"size";
NSString *const kPoolUserId = @"user_id";
NSString *const kPoolCommisioner = @"commisioner";
NSString *const kPoolToDate = @"to_date";
NSString *const kPoolMinPeople = @"min_people";
NSString *const kPoolPoolStatus = @"pool_status";
NSString *const kPoolPoolType = @"pool_type";
NSString *const kPoolPickgameDateTo = @"pickgame_date_to";
NSString *const kPoolPoolId = @"pool_id";
NSString *const kPoolRegEndDate = @"reg_end_date";
NSString *const kPoolAmount = @"amount";


@interface Pool ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Pool

@synthesize isPaid = _isPaid;
@synthesize motto = _motto;
@synthesize fromDate = _fromDate;
@synthesize senderId = _senderId;
@synthesize limitedSize = _limitedSize;
@synthesize matchUp = _matchUp;
@synthesize pickGame = _pickGame;
@synthesize poolMembers = _poolMembers;
@synthesize internalBaseClassDescription = _internalBaseClassDescription;
@synthesize receiverId = _receiverId;
@synthesize privacy = _privacy;
@synthesize pickgameDateFrom = _pickgameDateFrom;
@synthesize poolImage = _poolImage;
@synthesize poolLeague = _poolLeague;
@synthesize name = _name;
@synthesize status = _status;
@synthesize regStartDate = _regStartDate;
@synthesize dateTime = _dateTime;
@synthesize wagerType = _wagerType;
@synthesize joinedMembers = _joinedMembers;
@synthesize games = _games;
@synthesize size = _size;
@synthesize userId = _userId;
@synthesize commisioner = _commisioner;
@synthesize toDate = _toDate;
@synthesize minPeople = _minPeople;
@synthesize poolStatus = _poolStatus;
@synthesize poolType = _poolType;
@synthesize pickgameDateTo = _pickgameDateTo;
@synthesize poolId = _poolId;
@synthesize regEndDate = _regEndDate;
@synthesize amount = _amount;


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
            self.isPaid = [self objectOrNilForKey:kPoolIsPaid fromDictionary:dict];
            self.motto = [self objectOrNilForKey:kPoolMotto fromDictionary:dict];
            self.fromDate = [self objectOrNilForKey:kPoolFromDate fromDictionary:dict];
            self.senderId = [self objectOrNilForKey:kPoolSenderId fromDictionary:dict];
            self.limitedSize = [self objectOrNilForKey:kPoolLimitedSize fromDictionary:dict];
            self.matchUp = [self objectOrNilForKey:kPoolMatchUp fromDictionary:dict];
            self.pickGame = [self objectOrNilForKey:kPoolPickGame fromDictionary:dict];
    NSObject *receivedPoolMembers = [dict objectForKey:kPoolPoolMembers];
    NSMutableArray *parsedPoolMembers = [NSMutableArray array];
    if ([receivedPoolMembers isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedPoolMembers) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedPoolMembers addObject:[PoolMembers modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedPoolMembers isKindOfClass:[NSDictionary class]]) {
       [parsedPoolMembers addObject:[PoolMembers modelObjectWithDictionary:(NSDictionary *)receivedPoolMembers]];
    }

    self.poolMembers = [NSArray arrayWithArray:parsedPoolMembers];
            self.internalBaseClassDescription = [self objectOrNilForKey:kPoolDescription fromDictionary:dict];
            self.receiverId = [self objectOrNilForKey:kPoolReceiverId fromDictionary:dict];
            self.privacy = [self objectOrNilForKey:kPoolPrivacy fromDictionary:dict];
            self.pickgameDateFrom = [self objectOrNilForKey:kPoolPickgameDateFrom fromDictionary:dict];
            self.poolImage = [self objectOrNilForKey:kPoolPoolImage fromDictionary:dict];
            self.poolLeague = [self objectOrNilForKey:kPoolPoolLeague fromDictionary:dict];
            self.name = [self objectOrNilForKey:kPoolName fromDictionary:dict];
            self.status = [self objectOrNilForKey:kPoolStatus fromDictionary:dict];
            self.regStartDate = [self objectOrNilForKey:kPoolRegStartDate fromDictionary:dict];
            self.dateTime = [self objectOrNilForKey:kPoolDateTime fromDictionary:dict];
            self.wagerType = [self objectOrNilForKey:kPoolWagerType fromDictionary:dict];
            self.joinedMembers = [self objectOrNilForKey:kPoolJoinedMembers fromDictionary:dict];
            self.games = [self objectOrNilForKey:kPoolGames fromDictionary:dict];
            self.size = [self objectOrNilForKey:kPoolSize fromDictionary:dict];
            self.userId = [self objectOrNilForKey:kPoolUserId fromDictionary:dict];
    NSObject *receivedCommisioner = [dict objectForKey:kPoolCommisioner];
    NSMutableArray *parsedCommisioner = [NSMutableArray array];
    if ([receivedCommisioner isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCommisioner) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCommisioner addObject:[Commisioner modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCommisioner isKindOfClass:[NSDictionary class]]) {
       [parsedCommisioner addObject:[Commisioner modelObjectWithDictionary:(NSDictionary *)receivedCommisioner]];
    }

    self.commisioner = [NSArray arrayWithArray:parsedCommisioner];
            self.toDate = [self objectOrNilForKey:kPoolToDate fromDictionary:dict];
            self.minPeople = [self objectOrNilForKey:kPoolMinPeople fromDictionary:dict];
            self.poolStatus = [self objectOrNilForKey:kPoolPoolStatus fromDictionary:dict];
            self.poolType = [self objectOrNilForKey:kPoolPoolType fromDictionary:dict];
            self.pickgameDateTo = [self objectOrNilForKey:kPoolPickgameDateTo fromDictionary:dict];
            self.poolId = [self objectOrNilForKey:kPoolPoolId fromDictionary:dict];
            self.regEndDate = [self objectOrNilForKey:kPoolRegEndDate fromDictionary:dict];
            self.amount = [self objectOrNilForKey:kPoolAmount fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.isPaid forKey:kPoolIsPaid];
    [mutableDict setValue:self.motto forKey:kPoolMotto];
    [mutableDict setValue:self.fromDate forKey:kPoolFromDate];
    [mutableDict setValue:self.senderId forKey:kPoolSenderId];
    [mutableDict setValue:self.limitedSize forKey:kPoolLimitedSize];
    [mutableDict setValue:self.matchUp forKey:kPoolMatchUp];
    [mutableDict setValue:self.pickGame forKey:kPoolPickGame];
    NSMutableArray *tempArrayForPoolMembers = [NSMutableArray array];
    for (NSObject *subArrayObject in self.poolMembers) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPoolMembers addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPoolMembers addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPoolMembers] forKey:kPoolPoolMembers];
    [mutableDict setValue:self.internalBaseClassDescription forKey:kPoolDescription];
    [mutableDict setValue:self.receiverId forKey:kPoolReceiverId];
    [mutableDict setValue:self.privacy forKey:kPoolPrivacy];
    [mutableDict setValue:self.pickgameDateFrom forKey:kPoolPickgameDateFrom];
    [mutableDict setValue:self.poolImage forKey:kPoolPoolImage];
    [mutableDict setValue:self.poolLeague forKey:kPoolPoolLeague];
    [mutableDict setValue:self.name forKey:kPoolName];
    [mutableDict setValue:self.status forKey:kPoolStatus];
    [mutableDict setValue:self.regStartDate forKey:kPoolRegStartDate];
    [mutableDict setValue:self.dateTime forKey:kPoolDateTime];
    [mutableDict setValue:self.wagerType forKey:kPoolWagerType];
    [mutableDict setValue:self.joinedMembers forKey:kPoolJoinedMembers];
    [mutableDict setValue:self.games forKey:kPoolGames];
    [mutableDict setValue:self.size forKey:kPoolSize];
    [mutableDict setValue:self.userId forKey:kPoolUserId];
    NSMutableArray *tempArrayForCommisioner = [NSMutableArray array];
    for (NSObject *subArrayObject in self.commisioner) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCommisioner addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCommisioner addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCommisioner] forKey:kPoolCommisioner];
    [mutableDict setValue:self.toDate forKey:kPoolToDate];
    [mutableDict setValue:self.minPeople forKey:kPoolMinPeople];
    [mutableDict setValue:self.poolStatus forKey:kPoolPoolStatus];
    [mutableDict setValue:self.poolType forKey:kPoolPoolType];
    [mutableDict setValue:self.pickgameDateTo forKey:kPoolPickgameDateTo];
    [mutableDict setValue:self.poolId forKey:kPoolPoolId];
    [mutableDict setValue:self.regEndDate forKey:kPoolRegEndDate];
    [mutableDict setValue:self.amount forKey:kPoolAmount];

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

    self.isPaid = [aDecoder decodeObjectForKey:kPoolIsPaid];
    self.motto = [aDecoder decodeObjectForKey:kPoolMotto];
    self.fromDate = [aDecoder decodeObjectForKey:kPoolFromDate];
    self.senderId = [aDecoder decodeObjectForKey:kPoolSenderId];
    self.limitedSize = [aDecoder decodeObjectForKey:kPoolLimitedSize];
    self.matchUp = [aDecoder decodeObjectForKey:kPoolMatchUp];
    self.pickGame = [aDecoder decodeObjectForKey:kPoolPickGame];
    self.poolMembers = [aDecoder decodeObjectForKey:kPoolPoolMembers];
    self.internalBaseClassDescription = [aDecoder decodeObjectForKey:kPoolDescription];
    self.receiverId = [aDecoder decodeObjectForKey:kPoolReceiverId];
    self.privacy = [aDecoder decodeObjectForKey:kPoolPrivacy];
    self.pickgameDateFrom = [aDecoder decodeObjectForKey:kPoolPickgameDateFrom];
    self.poolImage = [aDecoder decodeObjectForKey:kPoolPoolImage];
    self.poolLeague = [aDecoder decodeObjectForKey:kPoolPoolLeague];
    self.name = [aDecoder decodeObjectForKey:kPoolName];
    self.status = [aDecoder decodeObjectForKey:kPoolStatus];
    self.regStartDate = [aDecoder decodeObjectForKey:kPoolRegStartDate];
    self.dateTime = [aDecoder decodeObjectForKey:kPoolDateTime];
    self.wagerType = [aDecoder decodeObjectForKey:kPoolWagerType];
    self.joinedMembers = [aDecoder decodeObjectForKey:kPoolJoinedMembers];
    self.games = [aDecoder decodeObjectForKey:kPoolGames];
    self.size = [aDecoder decodeObjectForKey:kPoolSize];
    self.userId = [aDecoder decodeObjectForKey:kPoolUserId];
    self.commisioner = [aDecoder decodeObjectForKey:kPoolCommisioner];
    self.toDate = [aDecoder decodeObjectForKey:kPoolToDate];
    self.minPeople = [aDecoder decodeObjectForKey:kPoolMinPeople];
    self.poolStatus = [aDecoder decodeObjectForKey:kPoolPoolStatus];
    self.poolType = [aDecoder decodeObjectForKey:kPoolPoolType];
    self.pickgameDateTo = [aDecoder decodeObjectForKey:kPoolPickgameDateTo];
    self.poolId = [aDecoder decodeObjectForKey:kPoolPoolId];
    self.regEndDate = [aDecoder decodeObjectForKey:kPoolRegEndDate];
    self.amount = [aDecoder decodeObjectForKey:kPoolAmount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_isPaid forKey:kPoolIsPaid];
    [aCoder encodeObject:_motto forKey:kPoolMotto];
    [aCoder encodeObject:_fromDate forKey:kPoolFromDate];
    [aCoder encodeObject:_senderId forKey:kPoolSenderId];
    [aCoder encodeObject:_limitedSize forKey:kPoolLimitedSize];
    [aCoder encodeObject:_matchUp forKey:kPoolMatchUp];
    [aCoder encodeObject:_pickGame forKey:kPoolPickGame];
    [aCoder encodeObject:_poolMembers forKey:kPoolPoolMembers];
    [aCoder encodeObject:_internalBaseClassDescription forKey:kPoolDescription];
    [aCoder encodeObject:_receiverId forKey:kPoolReceiverId];
    [aCoder encodeObject:_privacy forKey:kPoolPrivacy];
    [aCoder encodeObject:_pickgameDateFrom forKey:kPoolPickgameDateFrom];
    [aCoder encodeObject:_poolImage forKey:kPoolPoolImage];
    [aCoder encodeObject:_poolLeague forKey:kPoolPoolLeague];
    [aCoder encodeObject:_name forKey:kPoolName];
    [aCoder encodeObject:_status forKey:kPoolStatus];
    [aCoder encodeObject:_regStartDate forKey:kPoolRegStartDate];
    [aCoder encodeObject:_dateTime forKey:kPoolDateTime];
    [aCoder encodeObject:_wagerType forKey:kPoolWagerType];
    [aCoder encodeObject:_joinedMembers forKey:kPoolJoinedMembers];
    [aCoder encodeObject:_games forKey:kPoolGames];
    [aCoder encodeObject:_size forKey:kPoolSize];
    [aCoder encodeObject:_userId forKey:kPoolUserId];
    [aCoder encodeObject:_commisioner forKey:kPoolCommisioner];
    [aCoder encodeObject:_toDate forKey:kPoolToDate];
    [aCoder encodeObject:_minPeople forKey:kPoolMinPeople];
    [aCoder encodeObject:_poolStatus forKey:kPoolPoolStatus];
    [aCoder encodeObject:_poolType forKey:kPoolPoolType];
    [aCoder encodeObject:_pickgameDateTo forKey:kPoolPickgameDateTo];
    [aCoder encodeObject:_poolId forKey:kPoolPoolId];
    [aCoder encodeObject:_regEndDate forKey:kPoolRegEndDate];
    [aCoder encodeObject:_amount forKey:kPoolAmount];
}

- (id)copyWithZone:(NSZone *)zone
{
    Pool *copy = [[Pool alloc] init];
    
    if (copy) {

        copy.isPaid = [self.isPaid copyWithZone:zone];
        copy.motto = [self.motto copyWithZone:zone];
        copy.fromDate = [self.fromDate copyWithZone:zone];
        copy.senderId = [self.senderId copyWithZone:zone];
        copy.limitedSize = [self.limitedSize copyWithZone:zone];
        copy.matchUp = [self.matchUp copyWithZone:zone];
        copy.pickGame = [self.pickGame copyWithZone:zone];
        copy.poolMembers = [self.poolMembers copyWithZone:zone];
        copy.internalBaseClassDescription = [self.internalBaseClassDescription copyWithZone:zone];
        copy.receiverId = [self.receiverId copyWithZone:zone];
        copy.privacy = [self.privacy copyWithZone:zone];
        copy.pickgameDateFrom = [self.pickgameDateFrom copyWithZone:zone];
        copy.poolImage = [self.poolImage copyWithZone:zone];
        copy.poolLeague = [self.poolLeague copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
        copy.regStartDate = [self.regStartDate copyWithZone:zone];
        copy.dateTime = [self.dateTime copyWithZone:zone];
        copy.wagerType = [self.wagerType copyWithZone:zone];
        copy.joinedMembers = [self.joinedMembers copyWithZone:zone];
        copy.games = [self.games copyWithZone:zone];
        copy.size = [self.size copyWithZone:zone];
        copy.userId = [self.userId copyWithZone:zone];
        copy.commisioner = [self.commisioner copyWithZone:zone];
        copy.toDate = [self.toDate copyWithZone:zone];
        copy.minPeople = [self.minPeople copyWithZone:zone];
        copy.poolStatus = [self.poolStatus copyWithZone:zone];
        copy.poolType = [self.poolType copyWithZone:zone];
        copy.pickgameDateTo = [self.pickgameDateTo copyWithZone:zone];
        copy.poolId = [self.poolId copyWithZone:zone];
        copy.regEndDate = [self.regEndDate copyWithZone:zone];
        copy.amount = [self.amount copyWithZone:zone];
    }
    
    return copy;
}


@end
