#import <Cephei/HBPreferences.h>

static BOOL enabled;

%hook SBPIPContentViewLayoutSettings

+(CGSize)maximumContentViewSizeForAspectRatio:(CGSize)arg1 {
	return arg1;
}

%end

%hook SBPIPContainerViewController

-(void)_updateContentViewLayoutConstraintsWithFrame:(CGRect)arg1 {
	if (!enabled) {
		%orig;
	}
	return;
}

-(CGSize)_constrainContentViewSize:(CGSize)arg1 {
	if (!enabled) {
		return %orig;
	}
	return arg1;
}

%end

%ctor {
	HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:@"com.itsjafer.bigpipenergy"];
	[prefs registerBool:&enabled default:YES forKey:@"enabled"];
	%init;
}