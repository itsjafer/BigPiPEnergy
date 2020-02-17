#import <Cephei/HBPreferences.h>

BOOL enabled;
BOOL positionEnabled;

%hook SBPIPContentViewLayoutSettings

+(CGSize)maximumContentViewSizeForAspectRatio:(CGSize)arg1 {
	return enabled ? arg1 : %orig;
}

%end

%hook SBPIPContainerViewController

-(void)_updateContentViewLayoutConstraintsWithFrame:(CGRect)arg1 {
	if (!enabled) {
		%orig;
	}
}

-(CGSize)_constrainContentViewSize:(CGSize)arg1 {
	return enabled ? arg1 : %orig;
}

- (void)setContentViewPadding:(struct UIEdgeInsets)arg1 animationDuration:(double)arg2 animationOptions:(unsigned long long)arg3 {
	if (!enabled) {
		%orig;
	}
}

- (void)_handlePanRotationPinchGestureEndedState {
	if (!positionEnabled) {
		%orig;
	}
 }

- (void)_actuallyHandlePanRotationPinchGestureEndedState {
	if (!positionEnabled) {
		%orig;
	}
 }

%end

%ctor {
	HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:@"com.itsjafer.bigpipenergy"];
	[prefs registerBool:&enabled default:YES forKey:@"enabled"];
	[prefs registerBool:&positionEnabled default:NO forKey:@"positionEnabled"];
	%init;
}