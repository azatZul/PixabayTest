//// PBTPhotoDetailPresenter// PixabayTest////  Created by azat on 28/05/16.//  Copyright (c) 2016. All rights reserved.//#import <Foundation/Foundation.h>#import "PBTPhotoDetailModuleInput.h"#import "PBTPhotoDetailInteractorOutput.h"#import "PBTPhotoDetailViewOutput.h"@protocol PBTPhotoDetailInteractorInput;@protocol PBTPhotoDetailRouterInput;@protocol PBTPhotoDetailViewInput;@interface PBTPhotoDetailPresenter : NSObject <PBTPhotoDetailModuleInput, PBTPhotoDetailInteractorOutput, PBTPhotoDetailViewOutput>@property (nonatomic, strong) id<PBTPhotoDetailInteractorInput> interactor;@property (nonatomic, strong) id<PBTPhotoDetailRouterInput> router;@end