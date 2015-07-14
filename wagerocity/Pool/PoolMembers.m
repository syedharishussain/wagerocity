//
//  PoolMembers.m
//
//  Created by   on 06/07/2015
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "PoolMembers.h"


NSString *const kPoolMembersStatus = @"status";
NSString *const kPoolMembersDisplayname = @"displayname";
NSString *const kPoolMembersLost = @"lost";
NSString *const kPoolMembersWin = @"win";
NSString *const kPoolMembersUsername = @"username";
NSString *const kPoolMembersTie = @"tie";
NSString *const kPoolMembersUserId = @"user_id";
NSString *const kPoolMembersDollars = @"dollars";
NSString *const kPoolMembersRank = @"rank";


@interface PoolMembers ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PoolMembers

@synthesize status = _status;
@synthesize displayname = _displayname;
@synthesize lost = _lost;
@synthesize win = _win;
@synthesize username = _username;
@synthesize tie = _tie;
@synthesize userId = _userId;
@synthesize dollars = _dollars;
@synthesize rank = _rank;


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
            self.status = [self objectOrNilForKey:kPoolMembersStatus fromDictionary:dict];
            self.displayname = [self objectOrNilForKey:kPoolMembersDisplayname fromDictionary:dict];
            self.lost = [[self objectOrNilForKey:kPoolMembersLost fromDictionary:dict] doubleValue];
            self.win = [[self objectOrNilForKey:kPoolMembersWin fromDictionary:dict] doubleValue];
            self.username = [self objectOrNilForKey:kPoolMembersUsername fromDictionary:dict];
            self.tie = [[self objectOrNilForKey:kPoolMembersTie fromDictionary:dict] doubleValue];
            self.userId = [self objectOrNilForKey:kPoolMembersUserId fromDictionary:dict];
            self.dollars = [[self objectOrNilForKey:kPoolMembersDollars fromDictionary:dict] doubleValue];
            self.rank = [[self objectOrNilForKey:kPoolMembersRank fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kPoolMembersStatus];
    [mutableDict setValue:self.displayname forKey:kPoolMembersDisplayname];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lost] forKey:kPoolMembersLost];
    [mutableDict setValue:[NSNumber numberWithDouble:self.win] forKey:kPoolMembersWin];
    [mutableDict setValue:self.username forKey:kPoolMembersUsername];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tie] forKey:kPoolMembersTie];
    [mutableDict setValue:self.userId forKey:kPoolMembersUserId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dollars] forKey:kPoolMembersDollars];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rank] forKey:kPoolMembersRank];

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

    self.status = [aDecoder decodeObjectForKey:kPoolMembersStatus];
    self.displayname = [aDecoder decodeObjectForKey:kPoolMembersDisplayname];
    self.lost = [aDecoder decodeDoubleForKey:kPoolMembersLost];
    self.win = [aDecoder decodeDoubleForKey:kPoolMembersWin];
    self.username = [aDecoder decodeObjectForKey:kPoolMembersUsername];
    self.tie = [aDecoder decodeDoubleForKey:kPoolMembersTie];
    self.userId = [aDecoder decodeObjectForKey:kPoolMembersUserId];
    self.dollars = [aDecoder decodeDoubleForKey:kPoolMembersDollars];
    self.rank = [aDecoder decodeDoubleForKey:kPoolMembersRank];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kPoolMembersStatus];
    [aCoder encodeObject:_displayname forKey:kPoolMembersDisplayname];
    [aCoder encodeDouble:_lost forKey:kPoolMembersLost];
    [aCoder encodeDouble:_win forKey:kPoolMembersWin];
    [aCoder encodeObject:_username forKey:kPoolMembersUsername];
    [aCoder encodeDouble:_tie forKey:kPoolMembersTie];
    [aCoder encodeObject:_userId forKey:kPoolMembersUserId];
    [aCoder encodeDouble:_dollars forKey:kPoolMembersDollars];
    [aCoder encodeDouble:_rank forKey:kPoolMembersRank];
}

- (id)copyWithZone:(NSZone *)zone
{
    PoolMembers *copy = [[PoolMembers alloc] init];
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.displayname = [self.displayname copyWithZone:zone];
        copy.lost = self.lost;
        copy.win = self.win;
        copy.username = [self.username copyWithZone:zone];
        copy.tie = self.tie;
        copy.userId = [self.userId copyWithZone:zone];
        copy.dollars = self.dollars;
        copy.rank = self.rank;
    }
    
    return copy;
}


@end
