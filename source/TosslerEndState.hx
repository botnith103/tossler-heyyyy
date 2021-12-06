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

class TosslerEndState extends MusicBeatState
{
	private var videoCurrentlyPlaying:VideoPlayerD;

	override function create()
	{
		super.create();

		function videoIntro(name:String):Void {
			var bg = new FlxSprite(-FlxG.width, -FlxG.height).makeGraphic(FlxG.width * 3, FlxG.height * 3, FlxColor.BLACK);
			bg.scrollFactor.set();
			add(bg);
			videoCurrentlyPlaying = new VideoPlayerD(name);
			(videoCurrentlyPlaying).finishCallback = function() {
				remove(bg);
				FlxG.sound.playMusic(Paths.music('menu_variation_0'));
				MusicBeatState.switchState(new StoryMenuState());
			}
			FlxG.sound.playMusic(Paths.music('menu_variation_0'));
			MusicBeatState.switchState(new StoryMenuState());
		}

		if (ClientPrefs.subtitles)
		{
			videoIntro('subtitles/Week 1 Cutscene 4 GAME');
		}
		else if (!ClientPrefs.subtitles)
		{
			videoIntro('Week 1 Cutscene 4 GAME');
		}
	}

	override function update(elapsed:Float)
	{		
		// //stole this from taeyai (taeyai is so cool)
		// if(isVideoCurrentlyPlaying)
		// {
		// 	if (FlxG.keys.justPressed.ENTER || FlxG.keys.justPressed.SPACE || FlxG.keys.justPressed.ESCAPE)
		// 	{
		// 		videoCurrentlyPlaying.skipVideo();
		// 		isVideoCurrentlyPlaying = false;
		// 	}
		// }

		super.update(elapsed);
	}
}
