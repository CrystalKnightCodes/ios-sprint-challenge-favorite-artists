//
//  ArtistsController.h
//  Favorite Artists
//
//  Created by Christy Hicks on 5/31/20.
//  Copyright © 2020 Knight Night. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Artist;

typedef void (^ArtistFetchCompletionHandler)(Artist* _Nullable artist, NSError *_Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface ArtistsController : NSObject

- (void) fetchArtistWithName:(NSString *)name completion:(ArtistFetchCompletionHandler)completion;

- (NSArray *)fetchSavedArtists;

@end

NS_ASSUME_NONNULL_END
