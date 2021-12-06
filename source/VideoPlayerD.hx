package;

import flixel.text.FlxText;
// import flixel.FlxState;
import flixel.FlxG;
// import flixel.FlxSubState;
import flixel.FlxBasic;

import extension.webview.WebView;

using StringTools;

class VideoPlayerD extends FlxBasic
{
	public static var androidPath:String = 'file:///android_asset/';

	// public var nextState:FlxState;

    public var finishCallback:Void->Void = null;

	var text:FlxText;

	public function new(source:String)
	{
		super();

		text = new FlxText(0, 0, 0, "Video Exited! Tap to Continue", 48);
		text.screenCenter();
		text.alpha = 0;
		add(text);

		// nextState = toTrans;

		//FlxG.autoPause = false;

		// WebView.onClose=onClose;
		WebView.onURLChanging=onURLChanging;

		WebView.open(androidPath + source + '.html', false, null, ['http://exitme(.*)']);
	}

	public override function update(dt:Float) {
		for (touch in FlxG.touches.list)
			if (touch.justReleased)
				finishCallback();

		super.update(dt);	
	}

	// function onClose(){// not working
	// 	text.alpha = 0;
	// 	//FlxG.autoPause = true;
	// 	trace('close!');
	// 	// trace(nextState);
	// 	// FlxG.switchState(nextState);
	// }

	function onURLChanging(url:String) {
		text.alpha = 1;
		if (url == 'http://exitme/') finishCallback(); // drity hack lol
		trace("WebView is about to open: "+url);
	}
}