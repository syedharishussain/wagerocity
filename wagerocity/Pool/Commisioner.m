//
//  Commisioner.m
//
//  Created by   on 06/07/2015
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "Commisioner.h"


NSString *const kCommisionerEmail = @"email";
NSString *const kCommisionerUsername = @"username";
NSString *const kCommisionerUserId = @"user_id";
NSString *const kCommisionerCreationDate = @"creation_date";
NSString *const kCommisionerDisplayname = @"displayname";


@interface Commisioner ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Commisioner

@synthesize email = _email;
@synthesize username = _username;
@synthesize userId = _userId;
@synthesize creationDate = _creationDate;
@synthesize displayname = _displayname;


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
            self.email = [self objectOrNilForKey:kCommisionerEmail fromDictionary:dict];
            self.username = [self objectOrNilForKey:kCommisionerUsername fromDictionary:dict];
            self.userId = [self objectOrNilForKey:kCommisionerUserId fromDictionary:dict];
            self.creationDate = [self objectOrNilForKey:kCommisionerCreationDate fromDictionary:dict];
            self.displayname = [self objectOrNilForKey:kCommisionerDisplayname fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.email forKey:kCommisionerEmail];
    [mutableDict setValue:self.username forKey:kCommisionerUsername];
    [mutableDict setValue:self.userId forKey:kCommisionerUserId];
    [mutableDict setValue:self.creationDate forKey:kCommisionerCreationDate];
    [mutableDict setValue:self.displayname forKey:kCommisionerDisplayname];

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

    self.email = [aDecoder decodeObjectForKey:kCommisionerEmail];
    self.username = [aDecoder decodeObjectForKey:kCommisionerUsername];
    self.userId = [aDecoder decodeObjectForKey:kCommisionerUserId];
    self.creationDate = [aDecoder decodeObjectForKey:kCommisionerCreationDate];
    self.displayname = [aDecoder decodeObjectForKey:kCommisionerDisplayname];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_email forKey:kCommisionerEmail];
    [aCoder encodeObject:_username forKey:kCommisionerUsername];
    [aCoder encodeObject:_userId forKey:kCommisionerUserId];
    [aCoder encodeObject:_creationDate forKey:kCommisionerCreationDate];
    [aCoder encodeObject:_displayname forKey:kCommisionerDisplayname];
}

- (id)copyWithZone:(NSZone *)zone
{
    Commisioner *copy = [[Commisioner alloc] init];
    
    if (copy) {

        copy.email = [self.email copyWithZone:zone];
        copy.username = [self.username copyWithZone:zone];
        copy.userId = [self.userId copyWithZone:zone];
        copy.creationDate = [self.creationDate copyWithZone:zone];
        copy.displayname = [self.displayname copyWithZone:zone];
    }
    
    return copy;
}


@end
