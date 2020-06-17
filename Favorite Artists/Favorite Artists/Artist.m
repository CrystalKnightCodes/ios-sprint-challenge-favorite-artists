//
//  Artist.m
//  Favorite Artists
//
//  Created by Christy Hicks on 5/31/20.
//  Copyright © 2020 Knight Night. All rights reserved.
//

#import "Artist.h"

@implementation Artist

- (instancetype)initWithArtist:(NSString *)artist
                    yearFormed:(int)yearFormed
                     biography:(NSString *)biography {
    self = [super init];
    
    if (self) {
        _artist = [artist copy];
        _yearFormed = yearFormed;
        _biography = [biography copy];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *artist = dictionary[@"strArtist"];
    NSNumber *NSyearFormed = dictionary[@"intFormedYear"];
    NSString *biography = dictionary[@"strBiographyEN"];
    
    if ([NSyearFormed isKindOfClass:[NSNull class]]) return nil;
    
    int yearFormed = NSyearFormed.intValue;
    
    return [self initWithArtist:artist yearFormed:yearFormed biography:biography];
}

@end
