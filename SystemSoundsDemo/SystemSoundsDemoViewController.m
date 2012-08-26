//
//  SystemSoundsDemoViewController.m
//  SystemSoundsDemo
//
//  Created by Daniel García on 26/08/12.
//  Copyright (c) 2012 Daniel García. All rights reserved.
//

#import "SystemSoundsDemoViewController.h"
#include <AudioToolbox/AudioToolbox.h>

@interface SystemSoundsDemoViewController ()
@property (retain,nonatomic) NSArray *systemSounds;
@end

@implementation SystemSoundsDemoViewController
@synthesize systemSounds=_systemSounds;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        [self loadSystemSounds];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.title=@"System Sounds Demo";
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.systemSounds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    // Configure the cell...
    NSDictionary *systemSoundItem=[self.systemSounds objectAtIndex:indexPath.row];
    cell.textLabel.text=[systemSoundItem valueForKey:@"category"];
    cell.detailTextLabel.text=[NSString stringWithFormat:@"SoundID: %@ (%@)",[systemSoundItem valueForKey:@"soundId"],[[systemSoundItem valueForKey:@"iphoneFileName"]stringByReplacingOccurrencesOfString:@".caf" withString:@""]];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    NSDictionary *systemSoundItem=[self.systemSounds objectAtIndex:indexPath.row];
    NSInteger systemSoundId=[[systemSoundItem valueForKey:@"soundId"]intValue];
    AudioServicesPlaySystemSound (systemSoundId);
    
    // Example : AudioServicesPlaySystemSound (1000); 
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)loadSystemSounds{
    // The following information was extracted from http://iphonedevwiki.net/index.php/AudioServices
    // Copied, parsed and transformed into NSDictionary init sentences.
    
    NSMutableArray *systemSoundsArray=[NSMutableArray array];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                        @"1000",  @"new-mail.caf",  @"new-mail.caf",  @"MailReceived", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1001",  @"mail-sent.caf",  @"mail-sent.caf",  @"MailSent", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1002",  @"Voicemail.caf",  @"Voicemail.caf",  @"VoicemailReceived", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1003",  @"ReceivedMessage.caf",  @"ReceivedMessage.caf",  @"SMSReceived", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1004",  @"SentMessage.caf",  @"SentMessage.caf",  @"SMSSent", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1005",  @"alarm.caf",  @"sq_alarm.caf",  @"CalendarAlert", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1006",  @"low_power.caf",  @"low_power.caf",  @"LowPower", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1007",  @"sms-received1.caf",  @"sms-received1.caf",  @"SMSReceived_Alert", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1008",  @"sms-received2.caf",  @"sms-received2.caf",  @"SMSReceived_Alert", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1009",  @"sms-received3.caf",  @"sms-received3.caf",  @"SMSReceived_Alert", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1010",  @"sms-received4.caf",  @"sms-received4.caf",  @"SMSReceived_Alert", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1011",  @"-",  @"-",  @"SMSReceived_Vibrate", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1012",  @"sms-received1.caf",  @"sms-received1.caf",  @"SMSReceived_Alert", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1013",  @"sms-received5.caf",  @"sms-received5.caf",  @"SMSReceived_Alert", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1014",  @"sms-received6.caf",  @"sms-received6.caf",  @"SMSReceived_Alert", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1015",  @"Voicemail.caf",  @"Voicemail.caf",  @"Voicemail", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1016",  @"tweet_sent.caf",  @"tweet_sent.caf",  @"SMSSent", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1020",  @"Anticipate.caf",  @"Anticipate.caf",  @"SMSReceived_Alert", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1021",  @"Bloom.caf",  @"Bloom.caf",  @"SMSReceived_Alert", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1022",  @"Calypso.caf",  @"Calypso.caf",  @"SMSReceived_Alert", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1023",  @"Choo_Choo.caf",  @"Choo_Choo.caf",  @"SMSReceived_Alert", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1024",  @"Descent.caf",  @"Descent.caf",  @"SMSReceived_Alert", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1025",  @"Fanfare.caf",  @"Fanfare.caf",  @"SMSReceived_Alert", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1026",  @"Ladder.caf",  @"Ladder.caf",  @"SMSReceived_Alert", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1027",  @"Minuet.caf",  @"Minuet.caf",  @"SMSReceived_Alert", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1028",  @"News_Flash.caf",  @"News_Flash.caf",  @"SMSReceived_Alert", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1029",  @"Noir.caf",  @"Noir.caf",  @"SMSReceived_Alert", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1030",  @"Sherwood_Forest.caf",  @"Sherwood_Forest.caf",  @"SMSReceived_Alert", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1031",  @"Spell.caf",  @"Spell.caf",  @"SMSReceived_Alert", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1032",  @"Suspense.caf",  @"Suspense.caf",  @"SMSReceived_Alert", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1033",  @"Telegraph.caf",  @"Telegraph.caf",  @"SMSReceived_Alert", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1034",  @"Tiptoes.caf",  @"Tiptoes.caf",  @"SMSReceived_Alert", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1035",  @"Typewriters.caf",  @"Typewriters.caf",  @"SMSReceived_Alert", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1036",  @"Update.caf",  @"Update.caf",  @"SMSReceived_Alert", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1050",  @"ussd.caf",  @"ussd.caf",  @"USSDAlert", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1051",  @"SIMToolkitCallDropped.caf",  @"SIMToolkitCallDropped.caf",  @"SIMToolkitTone", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1052",  @"SIMToolkitGeneralBeep.caf",  @"SIMToolkitGeneralBeep.caf",  @"SIMToolkitTone", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1053",  @"SIMToolkitNegativeACK.caf",  @"SIMToolkitNegativeACK.caf",  @"SIMToolkitTone", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1054",  @"SIMToolkitPositiveACK.caf",  @"SIMToolkitPositiveACK.caf",  @"SIMToolkitTone", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1055",  @"SIMToolkitSMS.caf",  @"SIMToolkitSMS.caf",  @"SIMToolkitTone", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1057",  @"Tink.caf",  @"Tink.caf",  @"PINKeyPressed", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1070",  @"ct-busy.caf",  @"ct-busy.caf",  @"AudioToneBusy", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1071",  @"ct-congestion.caf",  @"ct-congestion.caf",  @"AudioToneCongestion", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1072",  @"ct-path-ack.caf",  @"ct-path-ack.caf",  @"AudioTonePathAcknowledge", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1073",  @"ct-error.caf",  @"ct-error.caf",  @"AudioToneError", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1074",  @"ct-call-waiting.caf",  @"ct-call-waiting.caf",  @"AudioToneCallWaiting", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1075",  @"ct-keytone2.caf",  @"ct-keytone2.caf",  @"AudioToneKey2", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1100",  @"lock.caf",  @"sq_lock.caf",  @"ScreenLocked", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1101",  @"unlock.caf",  @"sq_lock.caf",  @"ScreenUnlocked", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1102",  @"-",  @"-",  @"FailedUnlock", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1103",  @"Tink.caf",  @"sq_tock.caf",  @"KeyPressed", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1104",  @"Tock.caf",  @"sq_tock.caf",  @"KeyPressed", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1105",  @"Tock.caf",  @"sq_tock.caf",  @"KeyPressed", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1106",  @"beep-beep.caf",  @"sq_beep-beep.caf",  @"ConnectedToPower", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1107",  @"RingerChanged.caf",  @"RingerChanged.caf",  @"RingerSwitchIndication", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1108",  @"photoShutter.caf",  @"photoShutter.caf",  @"CameraShutter", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1109",  @"shake.caf",  @"shake.caf",  @"ShakeToShuffle", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1110",  @"jbl_begin.caf",  @"jbl_begin.caf",  @"JBL_Begin", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1111",  @"jbl_confirm.caf",  @"jbl_confirm.caf",  @"JBL_Confirm", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1112",  @"jbl_cancel.caf",  @"jbl_cancel.caf",  @"JBL_Cancel", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1113",  @"begin_record.caf",  @"begin_record.caf",  @"BeginRecording", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1114",  @"end_record.caf",  @"end_record.caf",  @"EndRecording", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1115",  @"jbl_ambiguous.caf",  @"jbl_ambiguous.caf",  @"JBL_Ambiguous", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1116",  @"jbl_no_match.caf",  @"jbl_no_match.caf",  @"JBL_NoMatch", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1117",  @"begin_video_record.caf",  @"begin_video_record.caf",  @"BeginVideoRecording", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1118",  @"end_video_record.caf",  @"end_video_record.caf",  @"EndVideoRecording", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1150",  @"vc~invitation-accepted.caf",  @"vc~invitation-accepted.caf",  @"VCInvitationAccepted", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1151",  @"vc~ringing.caf",  @"vc~ringing.caf",  @"VCRinging", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1152",  @"vc~ended.caf",  @"vc~ended.caf",  @"VCEnded", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1153",  @"ct-call-waiting.caf",  @"ct-call-waiting.caf",  @"VCCallWaiting", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1154",  @"vc~ringing.caf",  @"vc~ringing.caf",  @"VCCallUpgrade", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1200",  @"dtmf-0.caf",  @"dtmf-0.caf",  @"TouchTone", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1201",  @"dtmf-1.caf",  @"dtmf-1.caf",  @"TouchTone", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1202",  @"dtmf-2.caf",  @"dtmf-2.caf",  @"TouchTone", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1203",  @"dtmf-3.caf",  @"dtmf-3.caf",  @"TouchTone", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1204",  @"dtmf-4.caf",  @"dtmf-4.caf",  @"TouchTone", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1205",  @"dtmf-5.caf",  @"dtmf-5.caf",  @"TouchTone", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1206",  @"dtmf-6.caf",  @"dtmf-6.caf",  @"TouchTone", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1207",  @"dtmf-7.caf",  @"dtmf-7.caf",  @"TouchTone", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1208",  @"dtmf-8.caf",  @"dtmf-8.caf",  @"TouchTone", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1209",  @"dtmf-9.caf",  @"dtmf-9.caf",  @"TouchTone", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1210",  @"dtmf-star.caf",  @"dtmf-star.caf",  @"TouchTone", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1211",  @"dtmf-pound.caf",  @"dtmf-pound.caf",  @"TouchTone", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1254",  @"long_low_short_high.caf",  @"long_low_short_high.caf",  @"Headset_StartCall", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1255",  @"short_double_high.caf",  @"short_double_high.caf",  @"Headset_Redial", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1256",  @"short_low_high.caf",  @"short_low_high.caf",  @"Headset_AnswerCall", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1257",  @"short_double_low.caf",  @"short_double_low.caf",  @"Headset_EndCall", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1258",  @"short_double_low.caf",  @"short_double_low.caf",  @"Headset_CallWaitingActions", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1259",  @"middle_9_short_double_low.caf",  @"middle_9_short_double_low.caf",  @"Headset_TransitionEnd", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1300",  @"Voicemail.caf",  @"Voicemail.caf",  @"SystemSoundPreview", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1301",  @"ReceivedMessage.caf",  @"ReceivedMessage.caf",  @"SystemSoundPreview", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1302",  @"new-mail.caf",  @"new-mail.caf",  @"SystemSoundPreview", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1303",  @"mail-sent.caf",  @"mail-sent.caf",  @"SystemSoundPreview", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1304",  @"alarm.caf",  @"sq_alarm.caf",  @"SystemSoundPreview", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1305",  @"lock.caf",  @"sq_lock.caf",  @"SystemSoundPreview", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1306",  @"Tock.caf",  @"sq_tock.caf",  @"KeyPressClickPreview", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1307",  @"sms-received1.caf",  @"sms-received1.caf",  @"SMSReceived_Selection", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1308",  @"sms-received2.caf",  @"sms-received2.caf",  @"SMSReceived_Selection", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1309",  @"sms-received3.caf",  @"sms-received3.caf",  @"SMSReceived_Selection", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1310",  @"sms-received4.caf",  @"sms-received4.caf",  @"SMSReceived_Selection", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1311",  @"-",  @"-",  @"SMSReceived_Vibrate", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1312",  @"sms-received1.caf",  @"sms-received1.caf",  @"SMSReceived_Selection", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1313",  @"sms-received5.caf",  @"sms-received5.caf",  @"SMSReceived_Selection", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1314",  @"sms-received6.caf",  @"sms-received6.caf",  @"SMSReceived_Selection", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1315",  @"Voicemail.caf",  @"Voicemail.caf",  @"SystemSoundPreview", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1320",  @"Anticipate.caf",  @"Anticipate.caf",  @"SMSReceived_Selection", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1321",  @"Bloom.caf",  @"Bloom.caf",  @"SMSReceived_Selection", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1322",  @"Calypso.caf",  @"Calypso.caf",  @"SMSReceived_Selection", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1323",  @"Choo_Choo.caf",  @"Choo_Choo.caf",  @"SMSReceived_Selection", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1324",  @"Descent.caf",  @"Descent.caf",  @"SMSReceived_Selection", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1325",  @"Fanfare.caf",  @"Fanfare.caf",  @"SMSReceived_Selection", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1326",  @"Ladder.caf",  @"Ladder.caf",  @"SMSReceived_Selection", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1327",  @"Minuet.caf",  @"Minuet.caf",  @"SMSReceived_Selection", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1328",  @"News_Flash.caf",  @"News_Flash.caf",  @"SMSReceived_Selection", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1329",  @"Noir.caf",  @"Noir.caf",  @"SMSReceived_Selection", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1330",  @"Sherwood_Forest.caf",  @"Sherwood_Forest.caf",  @"SMSReceived_Selection", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1331",  @"Spell.caf",  @"Spell.caf",  @"SMSReceived_Selection", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1332",  @"Suspense.caf",  @"Suspense.caf",  @"SMSReceived_Selection", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1333",  @"Telegraph.caf",  @"Telegraph.caf",  @"SMSReceived_Selection", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1334",  @"Tiptoes.caf",  @"Tiptoes.caf",  @"SMSReceived_Selection", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1335",  @"Typewriters.caf",  @"Typewriters.caf",  @"SMSReceived_Selection", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1336",  @"Update.caf",  @"Update.caf",  @"SMSReceived_Selection", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1350",  @"-",  @"-",  @"RingerVibeChanged", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"1351",  @"-",  @"-",  @"SilentVibeChanged", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    [systemSoundsArray addObject:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:                                                                       @"4095",  @"-",  @"-",  @"Vibrate", nil] forKeys:[NSArray arrayWithObjects:@"soundId", @"iphoneFileName", @"ipodFileName", @"category",nil]]];
    self.systemSounds=[systemSoundsArray sortedArrayUsingComparator:^NSComparisonResult(NSDictionary *obj1, NSDictionary *obj2) {
        return [[obj1 valueForKey:@"category"] compare:[obj2 valueForKey:@"category"] options:NSCaseInsensitiveSearch];
    }];
}
- (void)dealloc{
    [_systemSounds release];
    [super dealloc];
}
@end
