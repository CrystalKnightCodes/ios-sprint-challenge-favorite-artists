//
//  Artist.h
//  Favorite Artists
//
//  Created by Christy Hicks on 5/31/20.
//  Copyright © 2020 Knight Night. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Artist : NSObject

@property (nonatomic, readonly, copy) NSString *artist;
@property (nonatomic, readonly) int yearFormed;
@property (nonatomic, readonly, copy) NSString *biography;

- (instancetype)initWithArtist:(NSString *)artist
                    yearFormed:(int)yearFormed
                     biography:(NSString *)biography;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
