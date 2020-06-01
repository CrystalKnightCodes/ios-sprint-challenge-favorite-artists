//
//  ArtistsTableViewController.m
//  Favorite Artists
//
//  Created by Christy Hicks on 5/31/20.
//  Copyright © 2020 Knight Night. All rights reserved.
//

#import "ArtistsTableViewController.h"
#import "Artist.h"
#import "ArtistsController.h"
#import "ArtistViewController.h"

@interface ArtistsTableViewController ()

@property (nonatomic) ArtistsController *artistsController;
@property (nonatomic) NSMutableArray *savedArtist;

@end

@implementation ArtistsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *tempArtists = [self.artistsController fetchSavedArtists];
    self.savedArtist = [[NSMutableArray alloc] initWithArray:tempArtists];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSArray *tempArtist = [self.artistsController fetchSavedArtists];
    self.savedArtist = [[NSMutableArray alloc] initWithArray:tempArtist];
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.savedArtist.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"artistCell" forIndexPath:indexPath];
    
    Artist *artist = self.savedArtist[indexPath.row];
    
    if (artist.yearFormed == 0) {
        cell.detailTextLabel.text = @"Unknown";
        cell.textLabel.text = artist.artist;
    } else {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Started in %d", artist.yearFormed];
        cell.textLabel.text = artist.artist;
    }
    
    return cell;
}


// Might implement deleting later
/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}
*/

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"addArtistsSegue"]) {
            ArtistViewController *controller = (ArtistViewController *)segue.destinationViewController;
            controller.artistsController = self.artistsController;
            
        }
        
        if ([segue.identifier isEqualToString:@"viewArtistSegue"]) {
            ArtistViewController *controller = (ArtistViewController *)segue.destinationViewController;
            NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
            controller.artist = self.savedArtist[selectedIndexPath.row];
        }
    }

    - (ArtistsController *)artistsController {
        if (!_artistsController) {
            _artistsController = [[ArtistsController alloc] init];
        }
        
        return _artistsController;
    }
@end
