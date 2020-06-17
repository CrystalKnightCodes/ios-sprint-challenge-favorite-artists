//
//  ArtistViewController.m
//  Favorite Artists
//
//  Created by Christy Hicks on 5/31/20.
//  Copyright © 2020 Knight Night. All rights reserved.
//

#import "ArtistViewController.h"
#import "Artist.h"
#import "ArtistsController.h"
#import "Artist+JSONSerialization.h"


@interface ArtistViewController ()<UISearchBarDelegate>

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UILabel *artistLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearFormed;
@property (strong, nonatomic) IBOutlet UITextView *biographyTextView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@property (nonatomic) Artist *artistSearch;
@property (nonatomic) BOOL isArtist;

@end

@implementation ArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchBar.delegate = self;
    
    if (self.artist == nil) {
        self.isArtist = NO;
        [self hideViews];
    } else {
        self.isArtist = YES;
        [self updateViews];
    }
}

- (void)hideViews {
    self.artistLabel.hidden = YES;
    self.yearFormed.hidden = YES;
    self.biographyTextView.hidden = YES;
}

- (void)updateViews {
    
    if (self.isArtist == YES) {
        self.searchBar.hidden = YES;
        self.title = self.artist.artist;
        
        self.artistLabel.hidden = YES;
        self.yearFormed.hidden = NO;
        self.biographyTextView.hidden = NO;
        
        self.artistLabel.text = self.artist.artist;
        
        if (self.artist.yearFormed == 0) {
            self.yearFormed.text = @"Unknown";
        } else {
            self.yearFormed.text = [NSString stringWithFormat:@"Started in %d", self.artist.yearFormed];
        }
        
        self.biographyTextView.text = self.artist.biography;
        
    } else {
        
        self.artistLabel.hidden = NO;
        self.yearFormed.hidden = NO;
        self.biographyTextView.hidden = NO;
        
        self.artistLabel.text = self.artistSearch.artist;
        
        if (self.artistSearch.yearFormed == 0) {
            self.yearFormed.text = @"Unknown";
        } else {
            self.yearFormed.text = [NSString stringWithFormat:@"Started in %d", self.artistSearch.yearFormed];
        }
        self.biographyTextView.text = self.artistSearch.biography;
    }
}

    - (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
        [self.artistsController fetchArtistWithName:searchBar.text completion:^(Artist * _Nullable artist, NSError * _Nullable error) {
            if (error) {
                NSLog(@"Error fetching artist!");
                return;
            }
            
            NSLog(@"Fetched artist: %@", artist);
            self.artistSearch = artist;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self updateViews];
            });
        }];
    }

    - (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
        
        if (self.artistSearch == nil) {
            return;
        }
        
        NSData *data = [NSJSONSerialization dataWithJSONObject:[self.artistSearch toDictionary] options:0 error:nil];
        NSURL *directory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
        
        NSURL *url = [[directory URLByAppendingPathComponent:self.artistSearch.artist] URLByAppendingPathExtension:@"json"];
        
        NSLog(@"Directory: %@", directory);
        NSLog(@"URL: %@", url);
        
        [data writeToURL:url atomically:YES];
        
        [self.navigationController popToRootViewControllerAnimated:true];
    }

@end
