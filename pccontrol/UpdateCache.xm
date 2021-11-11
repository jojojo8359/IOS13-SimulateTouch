#include "UpdateCache.h"
#include "Common.h"

#define UPDATE_POPUP_WINDOW_VOLUMN_DOWN_OPEN_FROM_CONFIG 1
#define UPDATE_SWITCH_APP_BEFORE_RUN_SCRIPT 2

void updateSwtichAppBeforeRunScript(BOOL value);

extern BOOL openPopUpByDoubleVolumnDown;

void updateCacheFromRawData(UInt8* eventData, NSError **error)
{
    NSArray *data = [[NSString stringWithCString:(char*)eventData encoding:NSUTF8StringEncoding] componentsSeparatedByString:@";;"];

    int type = [data[0] intValue];

    if (type == UPDATE_POPUP_WINDOW_VOLUMN_DOWN_OPEN_FROM_CONFIG)
    {
        NSString *configFilePath = getCommonConfigFilePath();

        NSDictionary *config = [[NSDictionary alloc] initWithContentsOfFile:configFilePath];

        if (config[@"double_click_volume_show_popup"])
        {
            openPopUpByDoubleVolumnDown = [config[@"double_click_volume_show_popup"] boolValue];
        }
    }
    if (type == UPDATE_SWITCH_APP_BEFORE_RUN_SCRIPT)
    {
        NSString *configFilePath = getCommonConfigFilePath();

        NSDictionary *config = [[NSDictionary alloc] initWithContentsOfFile:configFilePath];

        if (config[@"switch_app_before_run_script"])
        {
            updateSwtichAppBeforeRunScript([config[@"switch_app_before_run_script"] boolValue]);
        }
    }
    else
    {
        NSLog(@"com.zjx.springboard: unknown task type for updating cache.");
    }
}