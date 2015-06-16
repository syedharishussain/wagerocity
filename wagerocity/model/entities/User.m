//
//  User.m
//
//  Created by   on 11/06/2015
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "User.h"


NSString *const kUserState = @"state";
NSString *const kUserScore = @"score";
NSString *const kUserOverallrank = @"overallrank";
NSString *const kUserZip = @"zip";
NSString *const kUserCredits = @"credits";
NSString *const kUserUserId = @"user_id";
NSString *const kUserFacebookUid = @"facebook_uid";
NSString *const kUserBirthdate = @"birthdate";
NSString *const kUserCreationDate = @"creation_date";
NSString *const kUserAddress = @"address";
NSString *const kUserLanguage = @"language";
NSString *const kUserUsername = @"username";
NSString *const kUserCity = @"city";
NSString *const kUserTimezone = @"timezone";
NSString *const kUserCountry = @"country";
NSString *const kUserCurrentrecord = @"currentrecord";
NSString *const kUserEmail = @"email";


@interface User ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation User

@synthesize state = _state;
@synthesize score = _score;
@synthesize overallrank = _overallrank;
@synthesize zip = _zip;
@synthesize credits = _credits;
@synthesize userId = _userId;
@synthesize facebookUid = _facebookUid;
@synthesize birthdate = _birthdate;
@synthesize creationDate = _creationDate;
@synthesize address = _address;
@synthesize language = _language;
@synthesize username = _username;
@synthesize city = _city;
@synthesize timezone = _timezone;
@synthesize country = _country;
@synthesize currentrecord = _currentrecord;
@synthesize email = _email;


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
            self.state = [self objectOrNilForKey:kUserState fromDictionary:dict];
            self.score = [[self objectOrNilForKey:kUserScore fromDictionary:dict] doubleValue];
            self.overallrank = [self objectOrNilForKey:kUserOverallrank fromDictionary:dict];
            self.zip = [self objectOrNilForKey:kUserZip fromDictionary:dict];
            self.credits = [[self objectOrNilForKey:kUserCredits fromDictionary:dict] doubleValue];
            self.userId = [self objectOrNilForKey:kUserUserId fromDictionary:dict];
            self.facebookUid = [self objectOrNilForKey:kUserFacebookUid fromDictionary:dict];
            self.birthdate = [self objectOrNilForKey:kUserBirthdate fromDictionary:dict];
            self.creationDate = [self objectOrNilForKey:kUserCreationDate fromDictionary:dict];
            self.address = [self objectOrNilForKey:kUserAddress fromDictionary:dict];
            self.language = [self objectOrNilForKey:kUserLanguage fromDictionary:dict];
            self.username = [self objectOrNilForKey:kUserUsername fromDictionary:dict];
            self.city = [self objectOrNilForKey:kUserCity fromDictionary:dict];
            self.timezone = [self objectOrNilForKey:kUserTimezone fromDictionary:dict];
            self.country = [self objectOrNilForKey:kUserCountry fromDictionary:dict];
            self.currentrecord = [self objectOrNilForKey:kUserCurrentrecord fromDictionary:dict];
            self.email = [self objectOrNilForKey:kUserEmail fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.state forKey:kUserState];
    [mutableDict setValue:[NSNumber numberWithDouble:self.score] forKey:kUserScore];
    [mutableDict setValue:self.overallrank forKey:kUserOverallrank];
    [mutableDict setValue:self.zip forKey:kUserZip];
    [mutableDict setValue:[NSNumber numberWithDouble:self.credits] forKey:kUserCredits];
    [mutableDict setValue:self.userId forKey:kUserUserId];
    [mutableDict setValue:self.facebookUid forKey:kUserFacebookUid];
    [mutableDict setValue:self.birthdate forKey:kUserBirthdate];
    [mutableDict setValue:self.creationDate forKey:kUserCreationDate];
    [mutableDict setValue:self.address forKey:kUserAddress];
    [mutableDict setValue:self.language forKey:kUserLanguage];
    [mutableDict setValue:self.username forKey:kUserUsername];
    [mutableDict setValue:self.city forKey:kUserCity];
    [mutableDict setValue:self.timezone forKey:kUserTimezone];
    [mutableDict setValue:self.country forKey:kUserCountry];
    [mutableDict setValue:self.currentrecord forKey:kUserCurrentrecord];
    [mutableDict setValue:self.email forKey:kUserEmail];

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

    self.state = [aDecoder decodeObjectForKey:kUserState];
    self.score = [aDecoder decodeDoubleForKey:kUserScore];
    self.overallrank = [aDecoder decodeObjectForKey:kUserOverallrank];
    self.zip = [aDecoder decodeObjectForKey:kUserZip];
    self.credits = [aDecoder decodeDoubleForKey:kUserCredits];
    self.userId = [aDecoder decodeObjectForKey:kUserUserId];
    self.facebookUid = [aDecoder decodeObjectForKey:kUserFacebookUid];
    self.birthdate = [aDecoder decodeObjectForKey:kUserBirthdate];
    self.creationDate = [aDecoder decodeObjectForKey:kUserCreationDate];
    self.address = [aDecoder decodeObjectForKey:kUserAddress];
    self.language = [aDecoder decodeObjectForKey:kUserLanguage];
    self.username = [aDecoder decodeObjectForKey:kUserUsername];
    self.city = [aDecoder decodeObjectForKey:kUserCity];
    self.timezone = [aDecoder decodeObjectForKey:kUserTimezone];
    self.country = [aDecoder decodeObjectForKey:kUserCountry];
    self.currentrecord = [aDecoder decodeObjectForKey:kUserCurrentrecord];
    self.email = [aDecoder decodeObjectForKey:kUserEmail];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_state forKey:kUserState];
    [aCoder encodeDouble:_score forKey:kUserScore];
    [aCoder encodeObject:_overallrank forKey:kUserOverallrank];
    [aCoder encodeObject:_zip forKey:kUserZip];
    [aCoder encodeDouble:_credits forKey:kUserCredits];
    [aCoder encodeObject:_userId forKey:kUserUserId];
    [aCoder encodeObject:_facebookUid forKey:kUserFacebookUid];
    [aCoder encodeObject:_birthdate forKey:kUserBirthdate];
    [aCoder encodeObject:_creationDate forKey:kUserCreationDate];
    [aCoder encodeObject:_address forKey:kUserAddress];
    [aCoder encodeObject:_language forKey:kUserLanguage];
    [aCoder encodeObject:_username forKey:kUserUsername];
    [aCoder encodeObject:_city forKey:kUserCity];
    [aCoder encodeObject:_timezone forKey:kUserTimezone];
    [aCoder encodeObject:_country forKey:kUserCountry];
    [aCoder encodeObject:_currentrecord forKey:kUserCurrentrecord];
    [aCoder encodeObject:_email forKey:kUserEmail];
}

- (id)copyWithZone:(NSZone *)zone
{
    User *copy = [[User alloc] init];
    
    if (copy) {

        copy.state = [self.state copyWithZone:zone];
        copy.score = self.score;
        copy.overallrank = [self.overallrank copyWithZone:zone];
        copy.zip = [self.zip copyWithZone:zone];
        copy.credits = self.credits;
        copy.userId = [self.userId copyWithZone:zone];
        copy.facebookUid = [self.facebookUid copyWithZone:zone];
        copy.birthdate = [self.birthdate copyWithZone:zone];
        copy.creationDate = [self.creationDate copyWithZone:zone];
        copy.address = [self.address copyWithZone:zone];
        copy.language = [self.language copyWithZone:zone];
        copy.username = [self.username copyWithZone:zone];
        copy.city = [self.city copyWithZone:zone];
        copy.timezone = [self.timezone copyWithZone:zone];
        copy.country = [self.country copyWithZone:zone];
        copy.currentrecord = [self.currentrecord copyWithZone:zone];
        copy.email = [self.email copyWithZone:zone];
    }
    
    return copy;
}


@end
