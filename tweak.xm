static BOOL enabled = YES;

static BOOL tweakEnabled() {
    NSDictionary *settings = [NSMutableDictionary dictionaryWithContentsOfFile:
        @"/var/mobile/Library/Preferences/com.itsjafer.bigpipenergy.plist"];

    // we're defaulting to true but this might need to be changed if users
    // find it annoying
    return settings[@"enabled"] ? [settings[@"enabled"] boolValue] : YES; 
}

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
	enabled = tweakEnabled();
	%init;
}