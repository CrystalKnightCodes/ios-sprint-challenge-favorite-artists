//
//  Artist+JSONSerialization.h
//  Favorite Artists
//
//  Created by Christy Hicks on 5/31/20.
//  Copyright © 2020 Knight Night. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Artist.h"

NS_ASSUME_NONNULL_BEGIN

@interface Artist (NSJSONSerialization)

- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
