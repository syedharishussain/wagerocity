//
//  Game.m
//
//  Created by   on 03/07/2015
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "Game.h"
#import "Odd.h"


NSString *const kGameTeamAOdds = @"team_A_Odds";
NSString *const kGameTeamBOdds = @"team_B_Odds";
NSString *const kGameTeamBNickname = @"team_B_nickname";
NSString *const kGameTeamAName = @"team_A_name";
NSString *const kGameSports = @"sports";
NSString *const kGameTeamBFullname = @"team_B_fullname";
NSString *const kGameTeamALogo = @"team_A_logo";
NSString *const kGameTeamBPitcher = @"team_B_pitcher";
NSString *const kGameTeamAPitcher = @"team_A_pitcher";
NSString *const kGameTeamBLogo = @"team_B_logo";
NSString *const kGameTeamBNumber = @"team_B_number";
NSString *const kGameTeamBName = @"team_B_name";
NSString *const kGameTeamANickname = @"team_A_nickname";
NSString *const kGameTeamAFullname = @"team_A_fullname";
NSString *const kGameTeamANumber = @"team_A_number";
NSString *const kGameCstStartTime = @"cst_start_time";


@interface Game ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Game

@synthesize oddA = _oddA;
@synthesize oddB = _oddB;
@synthesize teamBNickname = _teamBNickname;
@synthesize nameA = _nameA;
@synthesize sports = _sports;
@synthesize fullNameB = _fullNameB;
@synthesize logoA = _logoA;
@synthesize teamBPitcher = _teamBPitcher;
@synthesize teamAPitcher = _teamAPitcher;
@synthesize logoB = _logoB;
@synthesize teamBNumber = _teamBNumber;
@synthesize nameB = _nameB;
@synthesize teamANickname = _teamANickname;
@synthesize fullNameA = _fullNameA;
@synthesize teamANumber = _teamANumber;
@synthesize cstStartTime = _cstStartTime;


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
            self.oddA = [Odd modelObjectWithDictionary:[dict objectForKey:kGameTeamAOdds]];
            self.oddB = [Odd modelObjectWithDictionary:[dict objectForKey:kGameTeamBOdds]];
            self.teamBNickname = [self objectOrNilForKey:kGameTeamBNickname fromDictionary:dict];
            self.nameA = [self objectOrNilForKey:kGameTeamAName fromDictionary:dict];
            self.sports = [self objectOrNilForKey:kGameSports fromDictionary:dict];
            self.fullNameB = [self objectOrNilForKey:kGameTeamBFullname fromDictionary:dict];
            self.logoA = [self objectOrNilForKey:kGameTeamALogo fromDictionary:dict];
            self.teamBPitcher = [self objectOrNilForKey:kGameTeamBPitcher fromDictionary:dict];
            self.teamAPitcher = [self objectOrNilForKey:kGameTeamAPitcher fromDictionary:dict];
            self.logoB = [self objectOrNilForKey:kGameTeamBLogo fromDictionary:dict];
            self.teamBNumber = [self objectOrNilForKey:kGameTeamBNumber fromDictionary:dict];
            self.nameB = [self objectOrNilForKey:kGameTeamBName fromDictionary:dict];
            self.teamANickname = [self objectOrNilForKey:kGameTeamANickname fromDictionary:dict];
            self.fullNameA = [self objectOrNilForKey:kGameTeamAFullname fromDictionary:dict];
            self.teamANumber = [self objectOrNilForKey:kGameTeamANumber fromDictionary:dict];
            self.cstStartTime = [self objectOrNilForKey:kGameCstStartTime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.oddA dictionaryRepresentation] forKey:kGameTeamAOdds];
    [mutableDict setValue:[self.oddB dictionaryRepresentation] forKey:kGameTeamBOdds];
    [mutableDict setValue:self.teamBNickname forKey:kGameTeamBNickname];
    [mutableDict setValue:self.nameA forKey:kGameTeamAName];
    NSMutableArray *tempArrayForSports = [NSMutableArray array];
    for (NSObject *subArrayObject in self.sports) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSports addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSports addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSports] forKey:kGameSports];
    [mutableDict setValue:self.fullNameB forKey:kGameTeamBFullname];
    [mutableDict setValue:self.logoA forKey:kGameTeamALogo];
    [mutableDict setValue:self.teamBPitcher forKey:kGameTeamBPitcher];
    [mutableDict setValue:self.teamAPitcher forKey:kGameTeamAPitcher];
    [mutableDict setValue:self.logoB forKey:kGameTeamBLogo];
    [mutableDict setValue:self.teamBNumber forKey:kGameTeamBNumber];
    [mutableDict setValue:self.nameB forKey:kGameTeamBName];
    [mutableDict setValue:self.teamANickname forKey:kGameTeamANickname];
    [mutableDict setValue:self.fullNameA forKey:kGameTeamAFullname];
    [mutableDict setValue:self.teamANumber forKey:kGameTeamANumber];
    [mutableDict setValue:self.cstStartTime forKey:kGameCstStartTime];

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

    self.oddA = [aDecoder decodeObjectForKey:kGameTeamAOdds];
    self.oddB = [aDecoder decodeObjectForKey:kGameTeamBOdds];
    self.teamBNickname = [aDecoder decodeObjectForKey:kGameTeamBNickname];
    self.nameA = [aDecoder decodeObjectForKey:kGameTeamAName];
    self.sports = [aDecoder decodeObjectForKey:kGameSports];
    self.fullNameB = [aDecoder decodeObjectForKey:kGameTeamBFullname];
    self.logoA = [aDecoder decodeObjectForKey:kGameTeamALogo];
    self.teamBPitcher = [aDecoder decodeObjectForKey:kGameTeamBPitcher];
    self.teamAPitcher = [aDecoder decodeObjectForKey:kGameTeamAPitcher];
    self.logoB = [aDecoder decodeObjectForKey:kGameTeamBLogo];
    self.teamBNumber = [aDecoder decodeObjectForKey:kGameTeamBNumber];
    self.nameB = [aDecoder decodeObjectForKey:kGameTeamBName];
    self.teamANickname = [aDecoder decodeObjectForKey:kGameTeamANickname];
    self.fullNameA = [aDecoder decodeObjectForKey:kGameTeamAFullname];
    self.teamANumber = [aDecoder decodeObjectForKey:kGameTeamANumber];
    self.cstStartTime = [aDecoder decodeObjectForKey:kGameCstStartTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_oddA forKey:kGameTeamAOdds];
    [aCoder encodeObject:_oddB forKey:kGameTeamBOdds];
    [aCoder encodeObject:_teamBNickname forKey:kGameTeamBNickname];
    [aCoder encodeObject:_nameA forKey:kGameTeamAName];
    [aCoder encodeObject:_sports forKey:kGameSports];
    [aCoder encodeObject:_fullNameB forKey:kGameTeamBFullname];
    [aCoder encodeObject:_logoA forKey:kGameTeamALogo];
    [aCoder encodeObject:_teamBPitcher forKey:kGameTeamBPitcher];
    [aCoder encodeObject:_teamAPitcher forKey:kGameTeamAPitcher];
    [aCoder encodeObject:_logoB forKey:kGameTeamBLogo];
    [aCoder encodeObject:_teamBNumber forKey:kGameTeamBNumber];
    [aCoder encodeObject:_nameB forKey:kGameTeamBName];
    [aCoder encodeObject:_teamANickname forKey:kGameTeamANickname];
    [aCoder encodeObject:_fullNameA forKey:kGameTeamAFullname];
    [aCoder encodeObject:_teamANumber forKey:kGameTeamANumber];
    [aCoder encodeObject:_cstStartTime forKey:kGameCstStartTime];
}

- (id)copyWithZone:(NSZone *)zone
{
    Game *copy = [[Game alloc] init];
    
    if (copy) {

        copy.oddA = [self.oddA copyWithZone:zone];
        copy.oddB = [self.oddB copyWithZone:zone];
        copy.teamBNickname = [self.teamBNickname copyWithZone:zone];
        copy.nameA = [self.nameA copyWithZone:zone];
        copy.sports = [self.sports copyWithZone:zone];
        copy.fullNameB = [self.fullNameB copyWithZone:zone];
        copy.logoA = [self.logoA copyWithZone:zone];
        copy.teamBPitcher = [self.teamBPitcher copyWithZone:zone];
        copy.teamAPitcher = [self.teamAPitcher copyWithZone:zone];
        copy.logoB = [self.logoB copyWithZone:zone];
        copy.teamBNumber = [self.teamBNumber copyWithZone:zone];
        copy.nameB = [self.nameB copyWithZone:zone];
        copy.teamANickname = [self.teamANickname copyWithZone:zone];
        copy.fullNameA = [self.fullNameA copyWithZone:zone];
        copy.teamANumber = [self.teamANumber copyWithZone:zone];
        copy.cstStartTime = [self.cstStartTime copyWithZone:zone];
    }
    
    return copy;
}


@end
