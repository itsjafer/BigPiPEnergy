# BigPipEnergy
Tweak that removes the iOS restriction on PictureInPicture (PiP) size. This was created so that the PiP mode on iPads was more useful for people like myself who like to scroll through reddit while watching a show casually.

It also works on iPhones that have used other tweaks to enable PiP (such as ipadify or ForceInPicture).

Note: I've ONLY tested it on my iPhone X; the plan is to test this on an iPad Pro once the uncover jailbreak is released.

## How it was made

This was only my second tweak so for any other beginners, I will outline the steps I took to reverse engineer the solution:

1. I searched iOS 13 for headers relating to PiP on limenos (https://developer.limneos.net/index.php). 
2. I found a few headers and looked through each of them for methods that mention constraints or restrictions
3. Some methods that stood out to me: `_updateContentViewLayoutConstraintsWithContentViewSize`, `(CGSize)_constrainContentViewSize:(CGSize)arg1`, `(CGSize)maximumContentViewSizeForAspectRatio:(CGSize)arg1`.
4. I hooked onto those methods and logged (NSLog) to see what the arguments were and how they changed to make a guess as to what each method was being used for
5. Repeat step 4 a lot but change the return value of the methods and see what happens.
6. Voila!


Copyright
GNU GENERAL PUBLIC LICENSE (feel free to use the code, just keep it open source)
