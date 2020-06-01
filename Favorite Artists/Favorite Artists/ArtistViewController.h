//
//  ArtistViewController.h
//  Favorite Artists
//
//  Created by Christy Hicks on 5/31/20.
//  Copyright © 2020 Knight Night. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArtistsController.h"


NS_ASSUME_NONNULL_BEGIN

@interface ArtistViewController : UIViewController

@property (nonatomic, assign) ArtistsController *artistsController;
@property (nonatomic, assign) Artist *artist;

@end

NS_ASSUME_NONNULL_END
