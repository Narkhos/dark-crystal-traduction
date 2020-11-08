--$Name: Dark Crystal Adventure$
--$Version: 0.03$
--$Author: Lucky Ook$
--$Info: This is the port of the old game\n Dark Crystal Adventure$

require "fmt"
require "snd"
require "cutscene"
--require "dbg"

std.cut_text = '^'..fmt.nb('<')..'CLICK TO CONTINUE>'
fmt.quotes = false
instead.notitle = true

obj {
	{
	tracks = {
		"mus/overture.ogg",
		"mus/dttheme.ogg",
		"mus/fight.ogg",
		"mus/theme.ogg"};
	};
	nam = 'плеер';
	life = function(s)
		if not snd.music_playing() then
			local n = s.tracks[rnd(#s.tracks)]
			snd.music(n, 1);
		end
	end;
}:lifeon();

cutscene {
	nam = 'main',
	disp = 'Intro',
	pic = "images/title.png",
	decor =  function()
		pn ([[DARK CRYSTAL ADVENTURE
			^A SIMPLE TEXT ADVENTURE.
			^CLICK "START" OR [TAP] TO BEGIN.]]);
	end,
	way = { path {pic = 'images/loading.jpg', '#START', 'START', 'key1'} };
}

cutscene {
	nam = 'key1',
	disp = '1',
	pic = "images/DC_1.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[JEN IS IN A BEAUTIFUL MOUNTAIN VALLEY;
			THE MYSTICS HAVE A SPECIAL NAME FOR IT,
			"THE VALLEY OF THE STONES". A MYSTIC APPROACHES
			JEN AND SAYS, "URSU, WISEST OF OUR RACE, IS DYING;
			HE HAS SENT FOR YOU. COME QUICKLY!"
			THEN THE MYSTIC WALKS AWAY.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[WHAT DO YOU WANT TO DO?
			^"LOOK" OR "FOLLOW"]]);
	end,
	way = { path {'#LOOK', 'LOOK', 'key1b'}:disable(),
			path {'#FOLLOW', 'FOLLOW', 'key2'}:disable(),
	};
}

cutscene {
	nam = 'key1b',
	disp = '1b',
	pic = "images/DC_1.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[JEN IS SURROUNDED BY VAST MOUNTAINS CALLED
			THE VALLEY OF STONES. THIS HAS BEEN HOME TO
			JEN SINCE HE WAS BORN. JEN'S PARENTS DIED WHEN
			HE WAS BORN AND THE MYSTICS HAVE BEEN RAISING
			HIM EVER SINCE.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[WHAT DO YOU WANT TO DO?
			^GO "BACK" OR "FOLLOW"]]);
	end,
	way = { path {'#1bBACK', 'BACK', 'key1'}:disable(),
			path {'#1bFOLLOW', 'FOLLOW', 'key2'}:disable(),
	};
}

cutscene {
	nam = 'key2',
	disp = '2A',
	pic = "images/DC_2.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[ JEN IS IN A LARGE, CANDLE-LIT CAVERN.
			URSU, WISEST OF THE MYSTICS, LIES HERE DYING.
			URSU SIGHS AND SAYS, 'AT THE TIME OF THE LAST
			CONJUNCTION, OR COMING TOGETHER, OF OUR WORLD'S
			THREE SUNS, THE EVIL SKEKSIS GAINED CONTROL
			OF THE GREAT CRYSTAL THAT RULES OUR DESTINY.]]);
		pn '[cut]';
		p '[cls]';
		pn ([[THE CRYSTAL CRACKED AND DARKENED.
		AND DARK IT WILL REMAIN UNTIL A PIECE THAT BROKE
		OFF THE CRYSTAL SHARD IS RESTORED. THERE IS A PROPHECY
		THAT THE SHARD CAN ONLY BE REPLACED BY GELFLING HAND,
		AND ONLY AT THE TIME OF THE NEXT GREAT CONJUNCTION.]]);
		pn '[cut]';
		p '[cls]';
		pn ([[IF THIS PROPHECY IS NOT FULFILLED, THE SKEKSIS
			WILL GROW EVEN MORE POWERFUL, AND THEIR REIGN WILL
			LAST FOREVER. JEN, TO YOU HAS FALLEN THE TASK OF
			HEALING THE CRYSTAL. AND IT IS TIME
			FOR YOUR QUEST TO BEGIN,]]);
		pn '[cut]';
		p '[cls]';
		pn ([[FOR VERY SOON THE THREE SUNS WILL ONCE AGAIN BE JOINED
			IN A GREAT CONJUNCTION. YOU MUST FIND AUGHRA, KEEPER
			OF SECRETS AND WATCHER OF THE HEAVENS. SHE MAY HAVE THE
			SHARD YOU SEEK. GELFLING, I LEAVE YOU WITH THIS
			FINAL PUZZLE: "WHAT DO THE SUN BROTHERS QUARREL ABOUT?"]]);
		pn '[cut]';
		p '[cls]';
		pn ([[FIND THE ANSWER TO THIS MYSTERY AND PRESENT IT TO AUGHRA.
			ONLY THEN CAN YOU GAIN ENTRANCE TO HER OBSERVATORY.
			AND NOW GELFLING, OUR ROADS MUST CURVE APART.]]);
		pn '[cut]';
		p '[cls]';
		pn ([[WE MAY MEET IN ANOTHER LIFE, BUT NOT AGAIN IN THIS ONE.
			WITH THESE WORDS, URSU DIES, AND HIS LIFELESS BODY VANISHES
			FROM THE SLEEP FRAME.]])
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[WHAT DO YOU WANT TO DO?
			^"LOOK" OR "LEAVE"]]);
	end,
	way = { path {'#2ALOOK', 'LOOK', 'key2b'}:disable(),
			path {'#2ALEAVE', 'LEAVE','key3'}:disable(),
	};
}

cutscene {
	nam = 'key2b',
	disp = '2B',
	pic = "images/DC_2.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[JEN LOOKS INTO A BOWL THAT IS ON THE FLOOR.
			HE SEES THE IMAGE OF A CRYSTAL SHARD.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[WHAT DO YOU WANT TO DO?
			^GO "BACK" OR "LEAVE"]]);
	end,
	way = { path {'#2BLOOK', 'BACK', 'key2'}:disable(),
			path {'#2BLEAVE', 'LEAVE','key3'}:disable(),
	};
}

cutscene {
	nam = 'key3',
	disp = '3A',
	pic = "images/DC_3.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[JEN FALLS HEAD FIRST DOWN A STEEP SLOPE.
			JEN IS TRAVERSING A WILDERNESS OF TANGLED VINES,
			CHATTERING BLOSSOMS, AND WARY CREATURES.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[WHAT WOULD YOU LIKE TO DO?
			^"LOOK", "REST", OR "WALK"]]);
	end,
	way = { path {'#3ALOOK', 'LOOK', 'key3b'}:disable(),
			path {'#3AREST', 'REST','key3c'}:disable(),
			path {'#3AWALK', 'WALK','key4'}:disable(),
	};
}

cutscene {
	nam = 'key3b',
	disp = '3B',
	pic = "images/DC_3.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[JEN IS TRAVERSING A WILDERNESS OF TANGLED VINES,
			CHATTERING BLOSSOMS, AND WARY CREATURES.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[WHAT DO YOU WANT TO DO?
			^GO "BACK", OR "WALK", OR "REST"]]);
	end,
	way = { path {'#3BBACK', 'BACK', 'key3'}:disable(),
			path {'#3BREST', 'REST','key3c'}:disable(),
			path {'#3BWALK', 'WALK','key4'}:disable(),
	};
}

cutscene {
	nam = 'key3c',
	disp = '3C',
	pic = "images/DC_Eclipse.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[A GARTHIM, WARRIOR OF THE SKEKSIS, JUMPS OUT FROM BEHIND
			THE TREE LINE AND GRABS YOU. IT BRINGS YOU BACK TO THE
			SKEKSIS CASTLE AND YOU WATCH AS THE GREAT CONJUNTION
			PASSES OVERHEAD. THE WORLD NOW BATHES IN DARKNESS
			UNDER THE RULE OF THE SKEKSIS.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[YOU LOSE.
			^CLICK "START" OR [TAP] TO BEGIN AGAIN.]]);
	end,
	way = { path {'#3CSTART', 'START', 'main'}:disable(),
	};
}

cutscene {
	nam = 'key4',
	disp = '4',
	pic = "images/DC_4.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[JEN IS IN AN EERIE SWAMPLAND. VINES HAVE COME DOWN FROM
			THE TREES AND WRAPPED THEMSELVES AROUND JEN. THE VINES
			WILL NOT LET GO OF HIM.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[WHAT DOES JEN DO?
			^"YELL" OR "STRUGGLE"]]);
	end,
	way = { path {'#4YELL', 'YELL', 'key4b'}:disable(),
			path {'#4STRUGGLE', 'STRUGGLE', 'key4c'}:disable(),
	};
}

cutscene {
	nam = 'key4b',
	disp = '4B',
	pic = "images/DC_4.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[NOBODY IS AROUND TO HEAR HIS CRY FOR HELP.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[WHAT DOES JEN DO?
			^"YELL" OR "STRUGGLE"]]);
	end,
	way = { path {'#4BYELL', 'YELL', 'key4b'}:disable(),
			path {'#4BSTRUGGLE', 'STRUGGLE', 'key4c'}:disable(),
	};
}

cutscene {
	nam = 'key4c',
	disp = '4C',
	pic = "images/DC_4.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[AS THE VINES TIGHTEN, A HAND APPEARS IN FRONT OF HIM.
			JEN FIND HIMSELF RETURNING THE GAZE OF A SINGLE EYEBALL,
			THRUST UP AMONG THE TENDRILS BY A WITHERED HAND.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[WHAT DOES JEN DO?
			^"TALK" OR "STRUGGLE"]]);
	end,
	way = { path {'#4CTALK', 'TALK', 'key4d'}:disable(),
			path {'#4CSTRUGGLE', 'STRUGGLE', 'key4e'}:disable(),
	};
}

cutscene {
	nam = 'key4d',
	disp = '4D',
	pic = "images/DC_4.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[A CREATURE RESPONDS, BUT JEN CANNOT UNDERSTAND THE DIALECT.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[WHAT DOES JEN DO?
			^"BACK" OR "STRUGGLE"]]);
	end,
	way = { path {'#4DBACK', 'BACK', 'key4c'}:disable(),
			path {'#4CSTRUGGLE', 'STRUGGLE', 'key4e'}:disable(),
	};
}

cutscene {
	nam = 'key4e',
	disp = '4E',
	pic = "images/DC_4.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[THE CREATURE REVEALS THEMSELF AND COMES OUT FROM BEHIND
			A BUSH. AUGHRA SAYS, "GELFLING, YOU KNOW ANSWER TO RIDDLE? HUH?"]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[HOW DOES JEN ANSWER?
			^"YES" OR "NO"]]);
	end,
	way = { path {'#4EYES', 'YES', 'key4el'}:disable(),
			path {'#4ENO', 'NO', 'key4f'}:disable(),
	};
}

cutscene {
	nam = 'key4f',
	disp = '4F',
	pic = "images/DC_Eclipse.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[AUGHRA COMMANDS THE VINES TO NEVER LET GO. JEN IS TRAPPED
			AND THE GREAT CONJUNCTION PASSES OVERHEAD. THE WORLD NOW
			BATHES IN DARKNESS UNDER THE RULE OF THE SKEKSIS.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[YOU LOSE.
			^CLICK "START" OR [TAP] TO BEGIN AGAIN.]]);
	end,
	way = { path {'#3CSTART', 'START', 'main'}:disable(),
	};
}

cutscene {
	nam = 'key4el',
	disp = '4EL',
	pic = "images/DC_4.png",
	decor = function()
--		p '[code ways():disable()]';
		pn ([[AUGHRA ASKS "WHAT DO SUN BROTHERS QUARREL OVER?
			TELL ME ANSWER THEN, GELFLING." AUGHRA SNAPS IMPATIENTLY,
			TO WHICH JEN RESPONDS "THE SUN BROTHERS QUARREL ABOUT MOON
			DAUGHTERS." "VERY GOOD!" CACKLES AUGHRA.
			SHE ORDERS THE VINES TO LET GO OF JEN.]]);
		pn '[cut]';
		p '[cls]';
		pn([[BEFORE JEN CAN EVEN CATCH HIS BREATH, AUGHRA GOES NORTH
			TO HER OBSERVATORY. JEN, SENSING THAT SOMETHING IMPORTANT
			IS ABOUT TO HAPPEN, FOLLOWS CLOSE BEHIND.]]);
		pn '[cut]';
		p '[cls]';
		p '[code walk("key5")]';
	end,
}

cutscene {
	nam = 'key5',
	disp = '5',
	pic = "images/DC_5a.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[JEN IS IN THE OBSERVATORY OF AUGHRA, WATCHER
			OF THE HEAVENS AND KEEPER OF SECRETS. AUGHRA TURNS
			TO JEN AND SAYS, "WHAT YOU WANT?"]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[WHAT DOES JEN DO?
			^"LOOK" OR "ASK"]]);
	end,
	way = { path {'#5LOOK', 'LOOK', 'key5b'}:disable(),
			path {'#5ASK', 'ASK', 'key5c'}:disable(),
	};
}

cutscene {
	nam = 'key5b',
	disp = '5B',
	pic = "images/DC_5a.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[JEN IS IN A GRAND OBSERVATORY WHICH CONTAINS AUGHRA`S
			MYSTICAL ORRERY THAT SHE USES TO PREDICT THE MOTION OF
			THE HEAVENS.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[WHAT DOES JEN DO?
			^"LOOK" OR "ASK"]]);
	end,
	way = { path {'#5BLOOK', 'LOOK', 'key5b'}:disable(),
			path {'#5BASK', 'ASK', 'key5c'}:disable(),
	};
}

cutscene {
	nam = 'key5c',
	disp = '5C',
	pic = "images/DC_5b.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[JEN ASKS AUGHRA ABOUT THE CRYSTAL SHARD. AUGHRA CACKLES,
			"THAT ALL? WHY NOT SAY SO?" SHE SETS A BLUE SHARD ON THE
			TABLE. "THIS IS THE SHARD THAT BELONGS TO THE CRYSTAL,
			ONLY A GELFLING CAN RESTORE THE SHARD TO THE CRYSTAL
			AND RESTORE BALANCE.]]);
		pn '[cut]';
		p '[cls]';
		pn([[BE CAREFUL YOUNG GELFLING, THE SKEKSIS ARE TERRIBLE
			CREATURES AND WILL DO EVERYTHING THEY CAN TO STOP
			YOU FROM RESTORING THE CRYSTAL. YOUR JOURNEY CONTINUES
			YOUNG ONE, DEPART FROM HERE AND RETURN ORDER
			TO THESE LANDS.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[WHAT DOES JEN DO?
			^"TALK" OR "LEAVE"]]);
	end,
	way = { path {'#5CTALK', 'TALK', 'key5d'}:disable(),
			path {'#5CLEAVE', 'LEAVE', 'key6'}:disable(),
	};
}

cutscene {
	nam = 'key5d',
	disp = '5D',
	pic = "images/DC_5b.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[AUGHRA REMINDS YOU THAT THE CRYSTAL MUST BE FIXED
			BEFORE THE CONJUNCTION.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[WHAT DOES JEN DO?
			^"LEAVE" OR GO "BACK"]]);
	end,
	way = { path {'#5DLEAVE', 'LEAVE', 'key6'}:disable(),
			path {'#5DBACK', 'BACK', 'key5c'}:disable(),
	};
}

cutscene {
	nam = 'key6',
	disp = '6',
	pic = "images/DC_6.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[JEN FINDS HIMSELF MIRED UP TO HIS KNEES IN AN EERIE BOG.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[WHAT DOES JEN DO?
			^"WALK"]]);
	end,
	way = { path {'#6WALK', 'WALK', 'key7'}:disable(),
	};
}

cutscene {
	nam = 'key7',
	disp = '7',
	pic = "images/DC_7.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[SINKING TO HIS WAIST, JEN HAS BECOME HOPELESSLY ENSARED
			IN A BOGGY SECTION OF A GREAT SWAMP. WITH EACH PASSING
			MOMENT, HE SLIPS FURTHER INTO THE GREAT SWAMP WHEN HE SEES
			SOMEONE MOVING BEHIND A BUSH.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[WHAT DOES JEN DO?
			^"STRUGGLE" OR "SHOUT"]]);
	end,
	way = { path {'#7STRUGGLE', 'STRUGGLE', 'key7b'}:disable(),
			path {'#7SHOUT', 'SHOUT', 'key7c'}:disable(),
	};
}

cutscene {
	nam = 'key7b',
	disp = '7B',
	pic = "images/DC_Eclipse.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[JEN BEGINS TO SINK FASTER AND BECOMES STUCK WITH ONLY
			HIS HEAD ABOVE THE MUCK. THE GREAT CONJUNCTION PASSES
			OVERHEAD. THE WORLD NOW BATHES IN DARKNESS UNDER THE
			RULE OF THE SKEKSIS.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[YOU LOSE.
			^CLICK "START" OR [TAP] TO BEGIN AGAIN.]]);
	end,
	way = { path {'#7BSTART', 'START', 'main'}:disable(),
	};
}

cutscene {
	nam = 'key7c',
	disp = '7C',
	pic = "images/DC_7.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[JEN CRIES "HELP!" THE GIRL GRABS A LONG BRANCH AND HELPS
			JEN OUT OF THE BOG. THE GIRL SMILES AND SAYS, "I AM KIRA,
			AND THIS IS FIZZGIG. I THOUGHT I WAS THE ONLY LIVING
			GELFLING. BUT THEN I GUESS YOU MUST HAVE THOUGHT
			THE SAME THING!"]]);
		pn '[cut]';
		p '[cls]';
		pn([[JEN AND KIRA HAVE ENTERED A GREAT FOREST. THEY ARE ON THE
			BANK OF A WIDE RIVER WHICH FLOWS SOUTH. JEN TELLS KIRA
			ABOUT HIS QUEST TO HEAL THE GREAT CRYSTAL.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[WHAT DOES JEN DO?
			^"TALK" OR "WALK"]]);
	end,
	way = { path {'#7CTALK', 'TALK', 'key7d'}:disable(),
			path {'#7CWALK', 'WALK', 'key8'}:disable(),
	};
}

cutscene {
	nam = 'key7d',
	disp = '7D',
	pic = "images/DC_7.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[GELFLINGS CAN TALK WITHOUT SPEAKING. WHEN JEN AND KIRA
			TOUCH, THEY CAN SHARE THEIR MEMORIES, THOUGHTS,
			AND FEELINGS, THIS IS KNOWN AS DREAMFASTING.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[WHAT DOES JEN DO?
			^"BACK" OR "WALK"]]);
	end,
	way = { path {'#7DBACK', 'BACK', 'key7c'}:disable(),
			path {'#7CWALK', 'WALK', 'key8'}:disable(),
	};
}

cutscene {
	nam = 'key8',
	disp = '8',
	pic = "images/DC_8.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[KIRA BRINGS YOU TO HER VILLAGE. JEN AND KIRA FOLLOW THE
			RIVER BANK AND ARRIVE AT THE PODLING VILLAGE WHERE KIRA
			WAS RAISED. TO THEIR SURPRISE, THE VILLAGE HAS BEEN TORN
			TO PIECES AND ALL THE PODLINGS ARE GONE.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[WHAT DO THEY DO?
			^"TALK" OR "LOOK"]]);
	end,
	way = { path {'#8TALK', 'TALK', 'key8b'}:disable(),
			path {'#8LOOK', 'LOOK', 'key8c'}:disable(),
	};
}

cutscene {
	nam = 'key8b',
	disp = '8B',
	pic = "images/DC_8.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[KIRA TELLS JEN ABOUT THE PODLINGS WHO RAISED HER AFTER
			HER PARENTS WERE KILLED BY THE SKEKSIS. JEN AND KIRA
			CONTINUE TO EXCHANGE STORIES ABOUT THEIR CHILDHOOD.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[WHAT DO THEY DO?
			^"LOOK" OR "BACK"]]);
	end,
	way = { path {'#8BBACK', 'BACK', 'key8'}:disable(),
			path {'#8BLOOK', 'LOOK', 'key8c'}:disable(),
	};
}

cutscene {
	nam = 'key8c',
	disp = '8C',
	pic = "images/DC_8.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[THE TWO FRANTICALLY LOOK AROUND AND DISCOVER TRACKS LEFT
			BEHIND BY GARTHIM, WARRIORS OF THE SKEKSIS. KIRA DECIDES
			TO ACCOMPANY JEN TO THE SKEKSIS CASTLE WHERE BOTH THE
			GREAT CRYSTAL AND THE CAPTURED VILLAGERS RESIDE.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[WHAT DO THEY DO?
			^"FOLLOW"]]);
	end,
	way = { path {'#8CFOLLOW', 'FOLLOW', 'key9'}:disable(),
	};
}

cutscene {
	nam = 'key9',
	disp = '9',
	pic = "images/DC_9.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[THE JOURNEY TO THE SKEKSIS CASTLE IS LONG; KIRA SUMMONS
			LANDSTRIDERS, LONG-LEGGED BEASTS THAT WILL HELP THEM CROSS
			THE GREAT DESERT TO THE SKEKSIS CASTLE.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[WHAT DOES JEN DO?
			^"ASK" OR "JUMP"]]);
	end,
	way = { path {'#9ASK', 'ASK', 'key9b'}:disable(),
			path {'#9JUMP', 'JUMP', 'key10'}:disable(),
	};
}

cutscene {
	nam = 'key9b',
	disp = '9B',
	pic = "images/DC_9.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[JEN ASKS KIRA "HOW DO I GET ON," TO WHICH KIRA REPLIES
		"JUST JUMP ON THEIR BACK."]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[WHAT DOES JEN DO?
			^"BACK" OR "JUMP"]]);
	end,
	way = { path {'#9BBACK', 'BACK', 'key9'}:disable(),
			path {'#9BJUMP', 'JUMP', 'key10'}:disable(),
	};
}

cutscene {
	nam = 'key10',
	disp = '10',
	pic = "images/DC_10.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[JEN AND KIRA CLIMB ONTO THE BACKS OF THE LANDSTRIDERS
			AND HEAD TOWARDS THE GREAT DESERT. AS THEY TRAVEL
			THE HEAT GROWS MORE OPPRESSIVE BY THE MINUTE.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[WHAT DO THEY DO?
			^"REST" OR "RIDE"]]);
	end,
	way = { path {'#10REST', 'REST', 'key10b'}:disable(),
			path {'#10RIDE', 'RIDE', 'key11'}:disable(),
	};
}

cutscene {
	nam = 'key10b',
	disp = '10B',
	pic = "images/DC_Eclipse.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[THE TWO DECIDE TO STOP AND TAKE A REST. THEY BOTH FALL
			ASLEEP AS THE HEAT GROWS MORE INTENSE. THE GREAT
			CONJUNCTION PASSES OVERHEAD. THE WORLD NOW BATHES
			IN DARKNESS UNDER THE RULE OF THE SKEKSIS.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[YOU LOSE.
			^CLICK "START" OR [TAP] TO BEGIN AGAIN.]]);
	end,
	way = { path {'#10BSTART', 'START', 'main'}:disable(),
	};
}

cutscene {
	nam = 'key11',
	disp = '11',
	pic = "images/DC_11.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[THEY CONTINUE TO RIDE THROUGH THE GREAT DESERT.
			LOOKING ACROSS THE DRY, CRACKED LANDSCAPE,
			JEN AND KIRA CAN MAKE OUT THE OUTLINE
			OF A DECAYED CASTLE.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[WHERE DO THEY GO?
			^"BRIDGE" OR "TUNNEL"]]);
	end,
	way = { path {'#11BRIDGE', 'BRIDGE', 'key11b'}:disable(),
			path {'#11TUNNEL', 'TUNNEL', 'key12'}:disable(),
	};
}

cutscene {
	nam = 'key11b',
	disp = '11B',
	pic = "images/DC_11.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[KIRA SAYS TO JEN "THE ENTRANCE IS GUARDED BY GARTHIM,
			WE SHOULD TRY TO FIND ANOTHER WAY."]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[WHERE DO THEY GO?
			^"BACK" OR "TUNNEL"]]);
	end,
	way = { path {'#11BBACK', 'BACK', 'key11'}:disable(),
			path {'#11BTUNNEL', 'TUNNEL', 'key12'}:disable(),
	};
}

cutscene {
	nam = 'key12',
	disp = '12',
	pic = "images/DC_12.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[KIRA AND JEN GET OFF THE LANDSTRIDERS AND FIND A DRAIN
			PIPE THAT IS LARGE ENOUGH FOR THEM TO FIT. THEY END
			UP IN AN UNDERGROUND LABYRINTH. JEN, KIRA AND FIZZGIG
			ARE IN THE SEWER SYSTEM. STRANGE SOUNDS ARE COMING
			FROM A PASSAGEWAY AHEAD OF THEM.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[WHAT DO THEY DO?
			^"TALK" OR "WALK"]]);
	end,
	way = { path {'#12TALK', 'TALK', 'key12a'}:disable(),
			path {'#12WALK', 'WALK', 'key13'}:disable(),
	};
}

cutscene {
	nam = 'key12a',
	disp = '12A',
	pic = "images/DC_12.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[KIRA SAYS TO JEN "I`M SCARED JEN, IT SEEMS LIKE WE
			ARE JUST WALKING AROUND IN CIRCLES."]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[WHAT DO THEY DO?
			^"WALK"]]);
	end,
	way = { path {'#12A', 'WALK', 'key13'}:disable(),
	};
}

cutscene {
	nam = 'key13',
	disp = '13',
	pic = "images/DC_13.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[A SKEKSIS PATROLLING THE LABYRINTH SUDDENLY RUSHES
			IN FROM THE DARK AND GRABS KIRA. AS HE RUNS OFF WITH HER,
			HE TOUCHES AN UNSEEN LEVER.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[WHAT DOES JEN DO?
			^"FOLLOW"]]);
	end,
	way = { path {'#13FOLLOW', 'FOLLOW', 'key14'}:disable(),
	};
}

cutscene {
	nam = 'key14',
	disp = '14',
	pic = "images/DC_14.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[HUGE BOULDERS FALL, BLOCKING THE WAY JEN AND KIRA CAME IN.
			AS JEN REGAINS CONSCIOUSNESS, HE HEARS STRANGE SOUNDS THAT
			ARE COMING FROM THE TOP OF A STAIRWAY.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[WHAT DOES JEN DO?
			^"RUN"]]);
	end,
	way = { path {'#14RUN', 'RUN', 'key15'}:disable(),
	};
}

cutscene {
	nam = 'key15',
	disp = '15',
	pic = "images/DC_15.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[JEN GETS UP AND RUNS TOWARDS THE STAIRS, TRYING TO FIND
			KIRA. HE HAS REACHED THE TOP OF THE NARROW STAIRWAY.
			STRANGE NOISES AND TORCH LIGHT ARE COMING FROM
			A COORIDOR AHEAD OF HIM.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[WHAT DOES JEN DO?
			^"REST" OR "WALK"]]);
	end,
	way = { path {'#15REST', 'REST', 'key15b'}:disable(),
			path {'#15WALK', 'WALK', 'key16'}:disable(),
	};
}

cutscene {
	nam = 'key15b',
	disp = '15B',
	pic = "images/DC_Eclipse.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[A PATROLLING SKEKSIS SURPISES JEN. HE IS CAUGHT
			AND BROUGHT TO A GREAT CHAMBER. THE GREAT CONJUNCTION
			PASSES OVERHEAD. THE WORLD NOW BATHES IN DARKNESS UNDER
			THE RULE OF THE SKEKSIS.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[YOU LOSE.
			^CLICK "START" OR [TAP] TO BEGIN AGAIN.]]);
	end,
	way = { path {'#15BSTART', 'START', 'main'}:disable(),
	};
}

cutscene {
	nam = 'key16',
	disp = '16',
	pic = "images/DC_16.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[JEN CAN SEE THE SKEKSIS GATHERED AROUND THE GREAT CRYSTAL.
			THE GREAT CONJUNCTION IS BEGINNING.
			KIRA IS BEING HELD BY THE SKEKSIS.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[WHAT DOES JEN DO?
			^"JUMP"]]);
	end,
	way = { path {'#16JUMP', 'JUMP', 'key17'}:disable(),
	};
}

cutscene {
	nam = 'key17',
	disp = '17',
	pic = "images/DC_17.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[JEN LANDS ON TOP OF THE DARK CRYSTAL! BUT THE IMPACT
			HAS CAUSED HIM TO DROP THE SHARD, WHICH NOW LIES
			PRECARIOUSLY ON THE BRINK OF THE SHAFT BENEATH THE CRYSTAL.
			JEN LOOKS UP THROUGH AN OPEN PORTAL IN THE CEILING.
			THE THREE SUNS ARE TOUCHING.]])
		pn '[cut]';
		p '[cls]';
		pn([[QUICKLY, KIRA PICKS UP THE CRYSTAL SHARD. SHE IS ABOUT
			TO THROW IT UP TO JEN, BUT THE RITUAL-MASTER,
			DRAWN DAGGER IN HAND, WARNS HER, "GIVE ME SHARD, GELFLING,
			AND YOU GO IN PEACE. OTHERWISE, NO CHOICE BUT TO KILL YOU!"]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[DOES JEN SAVE KIRA?
			^"YES" OR "NO"]]);
	end,
	way = { path {'#17YES', 'YES', 'key17b'}:disable(),
			path {'#17NO', 'NO', 'key17c'}:disable(),
	};
}

cutscene {
	nam = 'key17b',
	disp = '17B',
	pic = "images/DC_Eclipse.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[JEN ATTEMPTS TO SAVE KIRA BUT BECOMES SURROUNDED BY
			THE SKEKSIS. BOTH JEN AND KIRA ARE CAPTURED AS THE GREAT
			CONJUNCTION PASSES OVERHEAD. THE WORLD NOW BATHES
			IN DARKNESS UNDER THE RULE OF THE SKEKSIS.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[YOU LOSE.
			^CLICK "START" OR [TAP] TO BEGIN AGAIN.]]);
	end,
	way = { path {'#17BSTART', 'START', 'main'}:disable(),
	};
}

cutscene {
	nam = 'key17c',
	disp = '17c',
	pic = "images/DC_17.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[JEN SITS ON TOP OF THE CRYSTAL. KIRA HAS THROWN THE SHARD
			UP TO HIM AND HE HOLDS IT IN HIS HAND. THE EDGES OF
			THE THREE SUNS ARE OVERLAPPING.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[WHAT DOES JEN DO?
			^"HEAL"]]);
	end,
	way = { path {'#17CHEAL', 'HEAL', 'key18'}:disable(),
	};
}

cutscene {
	nam = 'key18',
	disp = '18',
	pic = "images/DC_18.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[AS THE THREE SUNS BECOME ONE, A FLOOD OF BLINDING LIGHT
			WASHES OVER HIM. JEN PLUNGES THE SHARD DEEP INTO THE WOUND
			IN THE CRYSTAL. JEN HAS HEALED THE WOUND IN THE CRYSTAL
			AND HAS RESTORED IT TO ITS ORIGINAL BRILLIANCE!]]);
		pn '[cut]';
		p '[cls]';
		pn([[HE IS NOW ON THE FLOOR OF THE CRYSTAL CHAMBER, WHICH
			IS BATHED IN RADIANT LIGHT. THE GARTHIM ARE CRACKING
			AND FALLING APART. THE FILTHY WALLS OF THE CASTLE
			ARE CRUMBLING, REVEALING ITS ORIGINAL
			CRYSTALLINE PURITY AND BEAUTY.]]);
		pn '[cut]';
		p '[cls]';
		pn([[THE EVIL REIGN OF THE SKEKSIS IS OVER, HOWEVER KIRA WHO
			WAS STABBED AT THE MOMENT OF THE GREAT CONJUNCTION,
			LIES IN JEN"S ARMS. THE GELFLING SOBS UNCONTROLLABLY
			AS HE CRADLES HER LIFELESS BODY.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[WHAT DOES JEN DO?
			^"KISS"]]);
	end,
	way = { path {'#18KISS', 'KISS', 'key19'}:disable(),
	};
}

cutscene {
	nam = 'key19',
	disp = '19',
	pic = "images/DC_19.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[JEN KISSES KIRA, SHE OPENS HER EYES, AND THE LIFE
			THAT THE SKEKSIS TOOK FROM HER BEFORE JEN HAD HEALED
			THE CRYSTAL IS REKINDLED.]]);
		pn '[cut]';
		p '[cls]';
		pn([[FINALLY, THE TWO GELFLINGS, AND ALL THE CREATURES,
			CAN LIVE PEACEFULLY TOGETHER IN A WORLD TO WHICH HARMONY,
			AFTER A THOUSAND YEARS OF DARKNESS, HAS BEEN RESTORED.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[THANKS FOR PLAYING "THE DARK CRYSTAL!"
			^YOU WON. CLICK "START" OR [TAP] TO BEGIN AGAIN.]]);
	end,
	way = { path {'#19START', 'START', 'main'}:disable(),
	};
}

cutscene {
	nam = 'X',
	disp = 'X',
	pic = "images/q05.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Lorum Ipsum.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
	end,
	way = { path {'#XLOOK', 'LOOK', 'key3b'}:disable(),
			path {'#XREST', 'REST', 'key3c'}:disable(),
			path {'#XWALK', 'WALK', 'key4'}:disable(),
	};
}
-- 9 233

---------------TEMPLATE--------------
--~ cutscene {
	--~ nam = 'key2',
	--~ disp = '2A',
	--~ pic = "images/DC_2.png",
	--~ decor = function()
		--~ p '[code ways():disable()]';
		--~ pn ([[ JEN IS IN A LARGE, CANDLE-LIT CAVERN.
			--~ URSU, WISEST OF THE MYSTICS, LIES HERE DYING.
			--~ URSU SIGHS AND SAYS, 'AT THE TIME OF THE LAST
			--~ CONJUNCTION, OR COMING TOGETHER, OF OUR WORLD'S
			--~ THREE SUNS, THE EVIL SKEKSIS GAINED CONTROL
			--~ OF THE GREAT CRYSTAL THAT RULES OUR DESTINY.]]);
		--~ pn '[cut]';
		--~ p '[cls]';
		--~ p '[code ways():enable()]';
		--~ pn([[WHAT DO YOU WANT TO DO? "LOOK" OR "LEAVE"]]);
	--~ end,
	--~ way = { path {'#2ALOOK', 'LOOK', 'key1b'}:disable(),
			--~ path {'#2ALEAVE', 'LEAVE','key2'}:disable(),
	--~ };
--~ }
---------------TEMPLATE--------------
