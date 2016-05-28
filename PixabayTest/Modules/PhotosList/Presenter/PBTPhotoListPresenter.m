//// PBTPhotoListPresenter// PixabayTest////  Created by azat on 27/05/16.//  Copyright (c) 2016. All rights reserved.//#import "PBTPhotoListPresenter.h"#import "PBTPhotoListViewInput.h"#import "PBTPhotoListInteractorInput.h"#import "PBTPhotoListRouterInput.h"@interface PBTPhotoListPresenter ()@property (nonatomic, strong) NSMutableArray *loadedPhotos;@property (nonatomic, assign) NSInteger allPhotosCount;@property (nonatomic, assign) BOOL isLoading;@end@implementation PBTPhotoListPresenter#pragma mark - Interactor Output Methods- (void)photoListPageDidFetched:(NSArray *)photos allPhotosCount:(NSInteger)photosCount{    [self.view hideLoader];    self.allPhotosCount = photosCount;    for (PBTPhoto *photo in photos)    {        if (![self.loadedPhotos containsObject:photo])        {            [self.loadedPhotos addObject:photo];        }    }    [self.view showPhotos:self.loadedPhotos];    self.isLoading = NO;}- (void)photoListPageDidFailedWithError:(NSError *)error{    [self.view hideLoader];    [self.view showErrorWithMessage:error.localizedDescription];    self.isLoading = NO;}#pragma mark - View Output Methods- (void)viewDidFinishLoading{    self.loadedPhotos = [NSMutableArray new];    self.allPhotosCount = NSIntegerMax;    [self.view setTitle:@"Images"];}- (void)didSelectPhoto:(PBTPhoto *)photo{    [self.router navigateToPhotoDetail:photo];}- (void)didScrollToBottom{    if (self.loadedPhotos.count == 0)    {        return;    }    if (!self.isLoading && self.loadedPhotos.count < self.allPhotosCount)    {        self.isLoading = YES;        [self.view showLoader];        [self.interactor fetchPageOfPhotosFrom:self.loadedPhotos.count query:@"red roses"];    }}- (void)searchTextDidChanged:(NSString *)text{    [self.view cleanPhotos];    [self.loadedPhotos removeAllObjects];    if (text.length > 0)    {        [self.view showLoader];        [self.interactor fetchPageOfPhotosFrom:0 query:text];    }}@end