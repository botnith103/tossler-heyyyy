package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import flixel.addons.transition.FlxTransitionableState;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import openfl.utils.Assets as OpenFlAssets;

#if sys
import sys.FileSystem;
#end


class PrologueState extends MusicBeatState
{
    private var videoCurrentlyPlaying:VideoPlayerD;
	// private var isVideoCurrentlyPlaying:Bool;

	override function create()                                                        
	{
		super.create();

        videoIntro('Week 1 Prologue GAME');

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);
	}

	override function update(elapsed:Float)
	{
        //     //stole this from aikoyori :p
		// if(isVideoCurrentlyPlaying)
        // {
        //     if (FlxG.keys.justPressed.ENTER || FlxG.keys.justPressed.SPACE || FlxG.keys.justPressed.ESCAPE)
        //     {
        //         videoCurrentlyPlaying.skipVideo();
        //         isVideoCurrentlyPlaying = false;
        //     }
        // }
        super.update(elapsed);
	}

	public function videoIntro(name:String):Void {
		var bg = new FlxSprite(-FlxG.width, -FlxG.height).makeGraphic(FlxG.width * 3, FlxG.height * 3, FlxColor.BLACK);
		bg.scrollFactor.set();
		add(bg);
		videoCurrentlyPlaying = new VideoPlayerD(name);

		(videoCurrentlyPlaying).finishCallback = function() {
			remove(bg);
			MusicBeatState.switchState(new TitleState());
			TitleState.lol = false; 
		}
	}
}
