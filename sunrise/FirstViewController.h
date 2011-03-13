//
//  FirstViewController.h
//  sunrise
//
//  Created by Yamshchikov Sergey on 2/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FirstViewController : UIViewController {

    IBOutlet UILabel *sunRiseTimeLabel;
    IBOutlet UILabel *sunSetTimeLabel;
    UIImageView *riseHourOne;
    UIImageView *riseHourTwo;
    UIImageView *riseMinutesOne;
    UIImageView *riseMinutesTwo;
    UIImageView *timeDots;
    UIImageView *setHourOne;
    UIImageView *setHourTwo;
    UIImageView *setDots;
    UIImageView *setMinutesOne;
    UIImageView *setMinutesTwo;
    UIButton *clickOnGiveMeTime;
}
@property (nonatomic, retain) IBOutlet UIImageView *riseHourOne;
@property (nonatomic, retain) IBOutlet UIImageView *riseHourTwo;
@property (nonatomic, retain) IBOutlet UIImageView *riseMinutesOne;
@property (nonatomic, retain) IBOutlet UIImageView *riseMinutesTwo;
@property (nonatomic, retain) IBOutlet UIImageView *timeDots;
@property (nonatomic, retain) IBOutlet UIImageView *setHourOne;
@property (nonatomic, retain) IBOutlet UIImageView *setHourTwo;
@property (nonatomic, retain) IBOutlet UIImageView *setDots;
@property (nonatomic, retain) IBOutlet UIImageView *setMinutesOne;
@property (nonatomic, retain) IBOutlet UIImageView *setMinutesTwo;
- (IBAction)clickOnGetLoxation:(id)sender;
@property (nonatomic, retain) IBOutlet UIButton *clickOnGiveMeTime;

@end
