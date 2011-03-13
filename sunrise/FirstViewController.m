//
//  FirstViewController.m
//  sunrise
//
//  Created by Yamshchikov Sergey on 2/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "sunriset.h"



@implementation FirstViewController
@synthesize clickOnGiveMeTime;
@synthesize riseHourOne;
@synthesize riseHourTwo;
@synthesize riseMinutesOne;
@synthesize riseMinutesTwo;
@synthesize timeDots;
@synthesize setHourOne;
@synthesize setHourTwo;
@synthesize setDots;
@synthesize setMinutesOne;
@synthesize setMinutesTwo;
CLLocationManager *locationManager;
NSString *str;
CLLocationDegrees *latitude;
CLLocationDegrees *longtitude;


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload
{
    [sunRiseTimeLabel release];
    [sunSetTimeLabel release];
    [self setRiseHourOne:nil];
    [self setRiseHourTwo:nil];
    [self setRiseMinutesOne:nil];
    [self setRiseMinutesTwo:nil];
    [self setTimeDots:nil];
    [self setSetHourOne:nil];
    [self setSetHourTwo:nil];
    [self setSetDots:nil];
    [self setSetMinutesOne:nil];
    [self setSetMinutesTwo:nil];
    [self setClickOnGiveMeTime:nil];
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc
{
    [super dealloc];
}

- (IBAction)clickOnGetLoxation:(id)sender { 
    // Create the location manager if this object does not
    // already have one.
    if (nil == locationManager)
        locationManager = [[CLLocationManager alloc] init];
    
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    
    // Set a movement threshold for new events.
    locationManager.distanceFilter = 500;
    
    [locationManager startUpdatingLocation];    
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    // If it's a relatively recent event, turn off updates to save power
    NSDate* eventDate = newLocation.timestamp;
    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
//    if (abs(howRecent) < 15.0)
//    {
    double latitude = newLocation.coordinate.latitude;
    double longtitude = newLocation.coordinate.longitude;
    
    NSDate *today = [NSDate date];
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *weekdayComponents =
    [gregorian components:(NSDayCalendarUnit | NSWeekdayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSTimeZoneCalendarUnit) fromDate:today];
    
    NSInteger day = [weekdayComponents day];
    NSInteger weekday = [weekdayComponents weekday];
    
    NSLog(@"latitude %+.6f, longitude %+.6f\n",
              newLocation.coordinate.latitude,
              newLocation.coordinate.longitude);
    
    
    //Start sunrise time equation
    
    int month = [weekdayComponents month];
    int year = [weekdayComponents year];
    int dayi = [weekdayComponents day];
    int hour = [weekdayComponents hour];
    int minutes = [weekdayComponents minute];
    int seconds = [weekdayComponents second];
    int timezoneOffset = [[weekdayComponents timeZone] secondsFromGMT]/3600;
    
    double sunrise;
    double sunset;
    
    sun_rise_set(year, month, dayi, longtitude, latitude, &sunrise, &sunset);
    
    sunrise = sunrise + timezoneOffset;
    sunset = sunset + timezoneOffset;
    
    int sunRiseHour = sunrise;
    int sunRiseMinutesd = (sunrise - sunRiseHour)*60;

    int sunSetHour = sunset;
    int sunSetMinutesd = (sunset - sunSetHour)*60;
    
//    NSString *sunRiseMinutesText;
//    NSString *sunSetMinutesText;
//    
//    if (sunRiseMinutesd<10){
//        sunRiseMinutesText = [NSString stringWithFormat:@"0%d", sunRiseMinutesd];
//    }
//    else {
//        sunRiseMinutesText = [NSString stringWithFormat:@"%d", sunRiseMinutesd];
//    }
//    
//    if (sunSetMinutesd<10){
//        sunSetMinutesText = [NSString stringWithFormat:@"0%d", sunSetMinutesd];
//    }
//    else {
//        sunSetMinutesText = [NSString stringWithFormat:@"%d", sunSetMinutesd];
//    }
//    
//    NSString *sunriseText = [NSString stringWithFormat:@"Sun Rise Time is %d:%@", sunRiseHour, sunRiseMinutesText];
//    NSString *sunsetText = [NSString stringWithFormat:@"Sun Set Time is %d:%@", sunSetHour, sunSetMinutesText];
    
//    [sunRiseTimeLabel setText:sunriseText];
//    [sunSetTimeLabel setText:sunsetText];
    int a = 0;
    UIImage *zeroImage = [UIImage imageNamed:@"zero.png"];
    UIImage *oneImage = [UIImage imageNamed:@"one.png"];
    UIImage *twoImage = [UIImage imageNamed:@"two.png"];
    UIImage *threeImage = [UIImage imageNamed:@"three.png"];
    UIImage *fourImage = [UIImage imageNamed:@"four.png"];
    UIImage *fiveImage = [UIImage imageNamed:@"five.png"];
    UIImage *sixImage = [UIImage imageNamed:@"six.png"];
    UIImage *sevenImage = [UIImage imageNamed:@"seven.png"];
    UIImage *eightImage = [UIImage imageNamed:@"eight.png"];
    UIImage *nineImage = [UIImage imageNamed:@"nine.png"];
    UIImage *dotsImage = [UIImage imageNamed:@"dots.png"];

    NSArray *images = [NSArray arrayWithObjects:zeroImage, oneImage, twoImage, threeImage, fourImage, fiveImage, sixImage, sevenImage, eightImage, nineImage, nil];
    
    
    int hourOne = sunRiseHour/10;
    int hourTwo = sunRiseHour - hourOne*10;
    int minutesOne = sunRiseMinutesd/10;
    int minutesTwo = sunRiseMinutesd - minutesOne*10;
    
    [riseHourOne setImage:[images objectAtIndex:hourOne]];
    [riseHourTwo setImage:[images objectAtIndex:hourTwo]];
    [riseMinutesOne setImage:[images objectAtIndex:minutesOne]];
    [riseMinutesTwo setImage:[images objectAtIndex:minutesTwo]];
    [timeDots setImage:dotsImage]; 
    
    hourOne = sunSetHour/10;
    hourTwo = sunSetHour - hourOne*10;
    minutesOne = sunSetMinutesd/10;
    minutesTwo = sunSetMinutesd - minutesOne*10;
    
    [setHourOne setImage:[images objectAtIndex:hourOne]];
    [setHourTwo setImage:[images objectAtIndex:hourTwo]];
    [setMinutesOne setImage:[images objectAtIndex:minutesOne]];
    [setMinutesTwo setImage:[images objectAtIndex:minutesTwo]];
    [setDots setImage:dotsImage];
    
//    [locationManager release];
    
//    }
    // else skip the event and process the next one.
}
@end
