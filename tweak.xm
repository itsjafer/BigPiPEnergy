%hook SBPIPContentViewLayoutSettings

+(CGSize)maximumContentViewSizeForAspectRatio:(CGSize)arg1 {
	return arg1;
}

%end

%hook SBPIPContainerViewController
-(void)_updateContentViewLayoutConstraintsWithFrame:(CGRect)arg1 {
	return;
}

-(CGSize)_constrainContentViewSize:(CGSize)arg1 {
	return arg1;
}
%end

%ctor {
	%init;
}