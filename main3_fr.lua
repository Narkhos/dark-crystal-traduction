--$Name: Dark Crystal Adventure$
--$Version: 0.01$
--$Author: Narkhos$
--$Info: Il s'agit du portage d'un vieux jeu\n Dark Crystal Adventure$

require "fmt"
require "snd"
require "cutscene"
--require "dbg"

std.cut_text = '^'..fmt.nb('<')..'CLIQUEZ POUR CONTINUER>'
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
			^UNE AVENTURE TEXTUELLE.
			^CLIQUEZ SUR "COMMENCER" OU [TAP] POUR DEBUTER L'AVENTURE.]]);
	end,
	way = { path {pic = 'images/loading.jpg', '#START', 'COMMENCER', 'key1'} };
}

cutscene {
	nam = 'key1',
	disp = '1',
	pic = "images/DC_1.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Jen est dans une jolie vallée montagneuse.
Les mystiques lui ont donné un nom spécial : "La Vallée des Pierres".
Un mystique s'approche de Jen et dit : "urSu, le plus sage de notre race, se meurt. Il m'a envoyé te chercher. Viens vite" !
Puis le mystique s'éloigne.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Que faites-vous ?
			^"REGARDER" OU "SUIVRE"]]);
	end,
	way = { path {'#LOOK', 'REGARDER', 'key1b'}:disable(),
			path {'#FOLLOW', 'SUIVRE', 'key2'}:disable(),
	};
}

cutscene {
	nam = 'key1b',
	disp = '1b',
	pic = "images/DC_1.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Jen est entouré d'énormes montagnes appelées "La Vallée des Pierres". C'était là que Jen vivait depuis sa naissance. Les parents de Jen étaient morts à sa naissance et, depuis ce temps, les mystiques l'avaient élevé.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Que faites-vous ?
			^REVENIR "EN ARRIERE" OU "SUIVRE"]]);
	end,
	way = { path {'#1bBACK', 'EN ARRIERE', 'key1'}:disable(),
			path {'#1bFOLLOW', 'SUIVRE', 'key2'}:disable(),
	};
}

cutscene {
	nam = 'key2',
	disp = '2A',
	pic = "images/DC_2.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[ Jen est dans une grande caverne éclairée par des bougies. urSu, le plus sage parmis les mystiques, est étendu ici, mourant. urSu soupire et dit : "Au moment de la grande conjonction, ou convergence des trois soleils de notre monde, les maléfiques Skeksès ont pris le contrôle du grand cristal qui gouverne notre destinée.]]);
		pn '[cut]';
		p '[cls]';
		pn ([[Le cristal s'est fendu et s'est assombri. Et il restera sombre jusqu'à ce que la pièce qui s'en est détachée, l'éclat de cristal, y soit réintégré. Une prophétie affirme que l'éclat ne peut être remis en place que par la main d'un Gelfling, et seulement au moment de la prochaine grande conjonction.]]);
		pn '[cut]';
		p '[cls]';
		pn ([[Si cette prophetie n'est pas réalisée, les Skeksès deviendront encore plus puissants, et leur règne durera pour toujours. Jen, c'est à toi que la tâche de soigner le cristal échoit. Et il est temps pour ta quête de commencer,]]);
		pn '[cut]';
		p '[cls]';
		pn ([[Très bientôt, les trois soleils seront de nouveau réunis dans une grande conjonction. Tu dois trouver Aughra, gardienne des secrets et observatrice des cieux. Elle a peut-être l'éclat que tu cherches. Gelfling, je te laisse avec cette dernière énigme : "A propos de quoi les frères soleils se querellent-ils ?"]]);
		pn '[cut]';
		p '[cls]';
		pn ([[Trouve la réponse à ce mystère et présente la à Aughra. C'est seulement ainsi que tu obtiendras l'accès à son observatoire. Et maintenant, Gelfling, nos routes doivent se séparer.]]);
		pn '[cut]';
		p '[cls]';
		pn ([[Nous nous reverrons peut-être dans une autre vie, mais jamais plus dans celle-ci. A ces mots, urSu meurt, et son corp sans vie disparaît de la couche.]])
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Que faites-vous ?
			^"REGARDER" OU "PARTIR"]]);
	end,
	way = { path {'#2ALOOK', 'REGARDER', 'key2b'}:disable(),
			path {'#2ALEAVE', 'PARTIR','key3'}:disable(),
	};
}

cutscene {
	nam = 'key2b',
	disp = '2B',
	pic = "images/DC_2.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Jen regarde dans un bol posé sur le sol.
			Il voit l'image d'un éclat de cristal.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Que faites-vous ?
			^REVENIR "EN ARRIERE" OU "PARTIR"]]);
	end,
	way = { path {'#2BLOOK', 'EN ARRIERE', 'key2'}:disable(),
			path {'#2BLEAVE', 'PARTIR','key3'}:disable(),
	};
}

cutscene {
	nam = 'key3',
	disp = '3A',
	pic = "images/DC_3.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Jen dévale tête la première une pente abrupte.
			Jen traverse une jungle de lianes enchevêtrées,
			de fleurs exubérantes et de créatures méfiantes.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Que faites-vous ?
			^"REGARDER", "SE REPOSER", OU "MARCHER"]]);
	end,
	way = { path {'#3ALOOK', 'REGARDER', 'key3b'}:disable(),
			path {'#3AREST', 'SE REPOSER','key3c'}:disable(),
			path {'#3AWALK', 'MARCHER','key4'}:disable(),
	};
}

cutscene {
	nam = 'key3b',
	disp = '3B',
	pic = "images/DC_3.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Jen traverse une jungle de lianes enchevêtrées,
			de fleurs exubérantes et de créatures méfiantes.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Que faites-vous ?
			^REVENIR "EN ARRIERE", OU "MARCHER", OU "SE REPOSER"]]);
	end,
	way = { path {'#3BBACK', 'EN ARRIERE', 'key3'}:disable(),
			path {'#3BREST', 'SE REPOSER','key3c'}:disable(),
			path {'#3BWALK', 'MARCHER','key4'}:disable(),
	};
}

cutscene {
	nam = 'key3c',
	disp = '3C',
	pic = "images/DC_Eclipse.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Un Garthim, guerrier des Skeksès, surgit de derrière une rangée d'arbres et te capture. Il te ramène au chateau des Skeksès d'ou tu assiste, impuissant, à la grande conjonction. Le monde baigne maintenant dans l'obscurité sous la domination des Skeksès.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Vous avez échoué.
			^CLIQUEZ SUR "RECOMMENCER" OU [TAP] POUR RETENTER L'AVENTURE.]]);
	end,
	way = { path {'#3CSTART', 'RECOMMENCER', 'main'}:disable(),
	};
}

cutscene {
	nam = 'key4',
	disp = '4',
	pic = "images/DC_4.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Jen est dans un terrain marécageux sinistre. Les lianes sont descendues des arbres et se sont enroulées autour de Jen. Les lianes ne vont pas le laisser partir.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Que faites-vous ?
			^"CRIER" OU "SE DEBATTRE"]]);
	end,
	way = { path {'#4YELL', 'CRIER', 'key4b'}:disable(),
			path {'#4STRUGGLE', 'SE DEBATTRE', 'key4c'}:disable(),
	};
}

cutscene {
	nam = 'key4b',
	disp = '4B',
	pic = "images/DC_4.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Il n'y a personne alentours pour entendre ses appels à l'aide.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Que faites-vous ?
			^"CRIER" OU "SE DEBATTRE"]]);
	end,
	way = { path {'#4BYELL', 'CRIER', 'key4b'}:disable(),
			path {'#4BSTRUGGLE', 'SE DEBATTRE', 'key4c'}:disable(),
	};
}

cutscene {
	nam = 'key4c',
	disp = '4C',
	pic = "images/DC_4.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Alors que les lianes se ressèrent, une main apparaît devant lui.
			Jen se retrouve face à face avec un globe oculaire
			poussé dans l'enchevêtrement par une main flétrie.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Que faites-vous ?
			^"PARLER" OU "SE DEBATTRE"]]);
	end,
	way = { path {'#4CTALK', 'PARLER', 'key4d'}:disable(),
			path {'#4CSTRUGGLE', 'SE DEBATTRE', 'key4e'}:disable(),
	};
}

cutscene {
	nam = 'key4d',
	disp = '4D',
	pic = "images/DC_4.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Une créature répond, mais Jen ne peut en comprendre la langue.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Que faites-vous ?
			^"RETOUR" OU "SE DEBATTRE"]]);
	end,
	way = { path {'#4DBACK', 'RETOUR', 'key4c'}:disable(),
			path {'#4CSTRUGGLE', 'SE DEBATTRE', 'key4e'}:disable(),
	};
}

cutscene {
	nam = 'key4e',
	disp = '4E',
	pic = "images/DC_4.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Les créatures se manifestent et surgissent de derrière un buisson.
			Aughra dit : "Gelfling, connais-tu la réponse à l'énigme ? Hein ?"]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Que répondez-vous ?
			^"OUI" OU "NON"]]);
	end,
	way = { path {'#4EYES', 'OUI', 'key4el'}:disable(),
			path {'#4ENO', 'NON', 'key4f'}:disable(),
	};
}

cutscene {
	nam = 'key4f',
	disp = '4F',
	pic = "images/DC_Eclipse.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Aughra ordonne aux lianes de ne jamais le laisser partir. Jen est piégé et la grande conjonction a lieu. Le monde baigne maintenant dans l'obscurité sous la domination des Skeksès.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Vous avez échoué.
			^CLIQUEZ SUR "RECOMMENCER" OU [TAP] POUR RETENTER L'AVENTURE.]]);
	end,
	way = { path {'#3CSTART', 'RECOMMENCER', 'main'}:disable(),
	};
}

cutscene {
	nam = 'key4el',
	disp = '4EL',
	pic = "images/DC_4.png",
	decor = function()
--		p '[code ways():disable()]';
		pn ([[Aughra demande : "A propos de quoi les frères soleils se querellent-ils ? J'attends ta réponse, Gelfling", aboie-t-elle avec impatience.
			A cela, Jen répond : "les frères soleils se querellent au sujet des soeurs lunes". "Très bien", ricane Aughra !
			Elle ordonne aux lianes de libérer Jen.]]);
		pn '[cut]';
		p '[cls]';
		pn([[Avant même que Jen puisse reprendre son souffle, Aughra se met en route vers le nord, en direction de son observatoire. Jen, sentant que quelque-chose d'important était sur le point de se produire, lui emboîte le pas.]]);
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
		pn ([[Jen est dans l'observatoire d'Aughra, gardienne des secrets et observatrice des cieux. Aughra se tourne vers Jen et demande : "Que veux-tu ?"]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Que faites-vous ?
			^"REGARDER" OU "DEMANDER"]]);
	end,
	way = { path {'#5LOOK', 'REGARDER', 'key5b'}:disable(),
			path {'#5ASK', 'DEMANDER', 'key5c'}:disable(),
	};
}

cutscene {
	nam = 'key5b',
	disp = '5B',
	pic = "images/DC_5a.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Jen est dans un grand observatoire contenant le planétaire mystique d'Aughra, qu'elle utilise pour prédire le mouvement des astres.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Que faites-vous ?
			^"REGARDER" OU "DEMANDER"]]);
	end,
	way = { path {'#5BLOOK', 'REGARDER', 'key5b'}:disable(),
			path {'#5BASK', 'DEMANDER', 'key5c'}:disable(),
	};
}

cutscene {
	nam = 'key5c',
	disp = '5C',
	pic = "images/DC_5b.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Jen interroge Aughra au sujet de l'éclat de cristal. Aughra ricane : "C'est tout ? Pourquoi ne pas l'avoir dit plus tôt" ? Elle dépose un éclat bleu sur la table. "C'est l'éclat qui appartient au cristal, seul un Gelfling peut le rendre au cristal et restaurer l'équilibre.]]);
		pn '[cut]';
		p '[cls]';
		pn([[Fait attention jeune Gelfling, les Skeksès sont de terribles créatures et vont tout faire pour t'empêcher de réparer le cristal. Ton voyage continue petit, part d'ici et rétablit l'ordre de ces contrées.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Que faites-vous ?
			^"PARLER" OU "PARTIR"]]);
	end,
	way = { path {'#5CTALK', 'PARLER', 'key5d'}:disable(),
			path {'#5CLEAVE', 'PARTIR', 'key6'}:disable(),
	};
}

cutscene {
	nam = 'key5d',
	disp = '5D',
	pic = "images/DC_5b.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Aughra te rappelle que le cristal doit être réparé avant la conjonction.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Que faites-vous ?
			^"PARTIR" OU REVENIR "EN ARRIERE"]]);
	end,
	way = { path {'#5DLEAVE', 'PARTIR', 'key6'}:disable(),
			path {'#5DBACK', 'EN ARRIERE', 'key5c'}:disable(),
	};
}

cutscene {
	nam = 'key6',
	disp = '6',
	pic = "images/DC_6.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Jen se retrouve enlisé jusqu'aux genoux dans un sinistre marécage.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Que faites-vous ?
			^"MARCHER"]]);
	end,
	way = { path {'#6WALK', 'MARCHER', 'key7'}:disable(),
	};
}

cutscene {
	nam = 'key7',
	disp = '7',
	pic = "images/DC_7.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Enfoncé jusqu'à la taille, Jen se retrouve complètement enlisé dans une partie marécageuse d'un grand marais. A chaque instant, il glisse plus profondément dans le grand marais. C'est alors qu'il voit quelqu'un bouger derrière un buisson.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Que faites-vous ?
			^"SE DEBATTRE" OU "CRIER"]]);
	end,
	way = { path {'#7STRUGGLE', 'SE DEBATTRE', 'key7b'}:disable(),
			path {'#7SHOUT', 'CRIER', 'key7c'}:disable(),
	};
}

cutscene {
	nam = 'key7b',
	disp = '7B',
	pic = "images/DC_Eclipse.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Jen commence à couler plus rapidement et se retrouve coincé, seule sa tête dépassant encore de la boue. La grande conjonction passe. Le monde baigne maintenant dans l'obscurité sous la domination des Skeksès.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Vous avez échoué.
			^CLIQUEZ SUR "RECOMMENCER" OU [TAP] POUR RETENTER L'AVENTURE.]]);
	end,
	way = { path {'#7BSTART', 'RECOMMENCER', 'main'}:disable(),
	};
}

cutscene {
	nam = 'key7c',
	disp = '7C',
	pic = "images/DC_7.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Jen crie "AU SECOURS" ! La fille prend une longue branche et aide Jen à se sortir du marécage. La fille sourit et dit : "Je m'appelle Kira, et voici Fizzgig. Je pensais être la seule Gelfling encore en vie. Mais j'imagine que tu devais te dire la même chose" !]]);
		pn '[cut]';
		p '[cls]';
		pn([[Jen et Kira sont entrés dans la grande forêt. Ils sont sur la berge d'une large rivière qui coule vers le sud. Jen parle à Kira de sa quête pour soigner le cristal.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Que faites-vous ?
			^"PARLER" OU "MARCHER"]]);
	end,
	way = { path {'#7CTALK', 'PARLER', 'key7d'}:disable(),
			path {'#7CWALK', 'MARCHER', 'key8'}:disable(),
	};
}

cutscene {
	nam = 'key7d',
	disp = '7D',
	pic = "images/DC_7.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Les Gelflings peuvent communiquer sans parler. Quand Jen et Kira se touchent, ils peuvent partager leurs souvenirs, leurs pensées et leurs sentiments. C'est ce qu'on appelle le dreamfasting.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Que faites-vous ?
			^"EN ARRIERE" OU "MARCHER"]]);
	end,
	way = { path {'#7DBACK', 'EN ARRIERE', 'key7c'}:disable(),
			path {'#7CWALK', 'MARCHER', 'key8'}:disable(),
	};
}

cutscene {
	nam = 'key8',
	disp = '8',
	pic = "images/DC_8.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Kira t'emmène dans son village. Jen et Kira longent la rivière et arrivent au village des Podlings ou Kira à été élevée. A leur grande surprise, le village a été réduit en pièces et tous les Podlings sont partis.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Que faites-vous ?
			^"PARLER" OU "REGARDER"]]);
	end,
	way = { path {'#8TALK', 'PARLER', 'key8b'}:disable(),
			path {'#8LOOK', 'REGARDER', 'key8c'}:disable(),
	};
}

cutscene {
	nam = 'key8b',
	disp = '8B',
	pic = "images/DC_8.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Kira parle à Jen des Podlings qui l'ont élevée après que ses parents aient été tués par les Skeksès. Jen et Kira continuent à échanger leurs souvenirs d'enfance.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Que faites-vous ?
			^"REGARDER" OU "EN ARRIERE"]]);
	end,
	way = { path {'#8BBACK', 'EN ARRIERE', 'key8'}:disable(),
			path {'#8BLOOK', 'REGARDER', 'key8c'}:disable(),
	};
}

cutscene {
	nam = 'key8c',
	disp = '8C',
	pic = "images/DC_8.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Ils regardent tous les deux désespérément alentour et découvrent une piste laissée par un Garthim, guerrier des Skeksès. Kira décide d'accompagner Jen jusqu'au chateau des Skeksès ou le grand cristal et les villageois capturés se trouvent.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Que faites-vous ?
			^"SUIVRE"]]);
	end,
	way = { path {'#8CFOLLOW', 'SUIVRE', 'key9'}:disable(),
	};
}

cutscene {
	nam = 'key9',
	disp = '9',
	pic = "images/DC_9.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Le voyage vers le chateau des Skeksès est long. Kira appelle des Landstriders, des bêtes à longues jambes qui vont les aider à traverser le grand désert jusqu'au chateau des Skeksès.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Que faites-vous ?
			^"DEMANDER" OU "SAUTER"]]);
	end,
	way = { path {'#9ASK', 'DEMANDER', 'key9b'}:disable(),
			path {'#9JUMP', 'SAUTER', 'key10'}:disable(),
	};
}

cutscene {
	nam = 'key9b',
	disp = '9B',
	pic = "images/DC_9.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Jen demande à Kira : "Comment est-ce que je monte" ? Kira lui répond : "Saute simplement sur son dos".]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Que faites-vous ?
			^"EN ARRIERE" OU "SAUTER"]]);
	end,
	way = { path {'#9BBACK', 'EN ARRIERE', 'key9'}:disable(),
			path {'#9BJUMP', 'SAUTER', 'key10'}:disable(),
	};
}

cutscene {
	nam = 'key10',
	disp = '10',
	pic = "images/DC_10.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Jen et Kira montent sur le dos des Landstriders et se dirigent vers le grand désert. Alors qu'ils voyagent, la chaleur devient de plus en plus oppressante.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Que faites-vous ?
			^"SE REPOSER" OU "CHEVAUCHER"]]);
	end,
	way = { path {'#10REST', 'SE REPOSER', 'key10b'}:disable(),
			path {'#10RIDE', 'CHEVAUCHER', 'key11'}:disable(),
	};
}

cutscene {
	nam = 'key10b',
	disp = '10B',
	pic = "images/DC_Eclipse.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Ils décident de s'arrêter pour se reposer et s'endorment alors que la chaleur devient plus intense. La grande conjonction passe. Le monde baigne maintenant dans l'obscurité sous la domination des Skeksès.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Vous avez échoué.
			^CLIQUEZ SUR "RECOMMENCER" OU [TAP] POUR RETENTER L'AVENTURE.]]);
	end,
	way = { path {'#10BSTART', 'RECOMMENCER', 'main'}:disable(),
	};
}

cutscene {
	nam = 'key11',
	disp = '11',
	pic = "images/DC_11.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Ils continuent de chevaucher à travers le grand désert. En regardant au delà du paysage sec et lézardé, Jen et Kira distinguent les contours d'un chateau délabré.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Ou vont-ils ?
			^"PONT" OU "TUNNEL"]]);
	end,
	way = { path {'#11BRIDGE', 'PONT', 'key11b'}:disable(),
			path {'#11TUNNEL', 'TUNNEL', 'key12'}:disable(),
	};
}

cutscene {
	nam = 'key11b',
	disp = '11B',
	pic = "images/DC_11.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Kira dit à Jen : "L'entrée est gardée par des Garthims, nous devrions chercher une autre voie."]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Ou vont-ils ?
			^"EN ARRIERE" OU "TUNNEL"]]);
	end,
	way = { path {'#11BBACK', 'EN ARRIERE', 'key11'}:disable(),
			path {'#11BTUNNEL', 'TUNNEL', 'key12'}:disable(),
	};
}

cutscene {
	nam = 'key12',
	disp = '12',
	pic = "images/DC_12.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Kira et Jen descendent des Landstriders et trouvent un conduit d'évacuation assez large pour qu'ils puissent passer. Ils se retrouvent dans un labyrinthe souterrain. Jen, Kira et Fizzgig sont dans les égouts. Des sons étranges proviennent d'un passage devant eux.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Que faites-vous ?
			^"PARLER" OU "MARCHER"]]);
	end,
	way = { path {'#12TALK', 'PARLER', 'key12a'}:disable(),
			path {'#12WALK', 'MARCHER', 'key13'}:disable(),
	};
}

cutscene {
	nam = 'key12a',
	disp = '12A',
	pic = "images/DC_12.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Kira dit à Jen : "J'ai peur Jen, on dirait que nous tournons en rond".]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Que faites-vous ?
			^"MARCHER"]]);
	end,
	way = { path {'#12A', 'MARCHER', 'key13'}:disable(),
	};
}

cutscene {
	nam = 'key13',
	disp = '13',
	pic = "images/DC_13.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Un Skeksès patrouillant dans le labyrinthe surgit soudain de l'obscurité et attrape Kira. Alors qu'il s'enfuit avec elle, il active un levier secret.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Que faites-vous ?
			^"SUIVRE"]]);
	end,
	way = { path {'#13FOLLOW', 'SUIVRE', 'key14'}:disable(),
	};
}

cutscene {
	nam = 'key14',
	disp = '14',
	pic = "images/DC_14.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Un énorme rocher tombe, bloquant le passage par lequel Jen et Kira sont entrés.
			Tandis que Jen reprend connaissance, il entend d'étranges sons venant du haut d'un escalier.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Que faites-vous ?
			^"COURIR"]]);
	end,
	way = { path {'#14RUN', 'COURIR', 'key15'}:disable(),
	};
}

cutscene {
	nam = 'key15',
	disp = '15',
	pic = "images/DC_15.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Jen se lève et court vers les escaliers à la recherche de Kira. Il est arrivé en haut d'un escalier étroit. D'étranges bruits et des lumières de torches arrivent d'un corridor devant lui.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Que faites-vous ?
			^"SE REPOSER" OU "MARCHER"]]);
	end,
	way = { path {'#15REST', 'SE REPOSER', 'key15b'}:disable(),
			path {'#15WALK', 'MARCHER', 'key16'}:disable(),
	};
}

cutscene {
	nam = 'key15b',
	disp = '15B',
	pic = "images/DC_Eclipse.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Un Skeksès en patrouille surprend Jen. Il est capturé et emmené dans la grande salle. La grande conjonction passe. Le monde baigne maintenant dans l'obscurité sous la domination des Skeksès.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Vous avez échoué.
			^CLIQUEZ SUR "RECOMMENCER" OU [TAP] POUR RETENTER L'AVENTURE.]]);
	end,
	way = { path {'#15BSTART', 'RECOMMENCER', 'main'}:disable(),
	};
}

cutscene {
	nam = 'key16',
	disp = '16',
	pic = "images/DC_16.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Jen peut voir les Skeksès réunis autour du grand cristal.
			La grande conjonction commence.
			Kira est retenue par les Skeksès.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Que faites-vous ?
			^"SAUTER"]]);
	end,
	way = { path {'#16JUMP', 'SAUTER', 'key17'}:disable(),
	};
}

cutscene {
	nam = 'key17',
	disp = '17',
	pic = "images/DC_17.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Jen atterit au sommet du cristal ! Mais l'impact lui a fait lacher l'éclat qui atterit en équilibre précaire sur le bord du puit se trouvant sous le cristal.
			Jen regarde au dessus de lui, à travers un portail ouvert dans le plafond.
			Les trois soleils se touchent.]])
		pn '[cut]';
		p '[cls]';
		pn([[Rapidement, Kira ramasse l'éclat de cristal. Elle s'apprête à le lancer à Jen, mais le grand prêtre, dague à la main, lui lance un avertissement : "Donne moi l'éclat, Gelfling, et tu pourras partir en paix. Sinon, je n'aurai d'autre choix que de te tuer" !]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Jen sauve-t-il Kira ?
			^"OUI" OU "NON"]]);
	end,
	way = { path {'#17YES', 'OUI', 'key17b'}:disable(),
			path {'#17NO', 'NON', 'key17c'}:disable(),
	};
}

cutscene {
	nam = 'key17b',
	disp = '17B',
	pic = "images/DC_Eclipse.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Jen tente de sauver Kira mais se retrouve encerclé de Skeksès. Jen et Kira sont tous deux capturés alors que la grande conjonction à lieu. Le monde baigne maintenant dans l'obscurité sous la domination des Skeksès.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Vous avez échoué.
			^CLIQUEZ SUR "RECOMMENCER" OU [TAP] POUR RETENTER L'AVENTURE.]]);
	end,
	way = { path {'#17BSTART', 'RECOMMENCER', 'main'}:disable(),
	};
}

cutscene {
	nam = 'key17c',
	disp = '17c',
	pic = "images/DC_17.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Jen est assis en haut du cristal. Kira lui a lancé l'éclat et il le tient à présent dans sa main. Les contours des trois soleils se superposent.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Que faites-vous ?
			^"SOIGNER"]]);
	end,
	way = { path {'#17CHEAL', 'SOIGNER', 'key18'}:disable(),
	};
}

cutscene {
	nam = 'key18',
	disp = '18',
	pic = "images/DC_18.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Alors que les trois soleils ne font plus qu'un, un flot de lumière éblouissant le submerge. Jen plonge profondément l'éclat dans la plaie du cristal. Jen a guérit la blessure du cristal et lui a rendu sa brillance d'origine !]]);
		pn '[cut]';
		p '[cls]';
		pn([[Il est maintenant sur le sol de la salle du cristal, baignée d'une lumière radieuse. Les Garthims se fissurent et tombent en morceaux. Les murs souillés du chateau se désagrègent, révélant leur pureté cristaline et leur beauté originelles.]]);
		pn '[cut]';
		p '[cls]';
		pn([[Le règne des maléfiques Skeksès est terminé. Mais Kira, qui a été poignardée au moment de la grande conjonction, repose dans les bras de Jen. Le Gelfling ne peut retenir ses sanglots alors qu'il berce son corp sans vie.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Que faites-vous ?
			^"EMBRASSER"]]);
	end,
	way = { path {'#18KISS', 'EMBRASSER', 'key19'}:disable(),
	};
}

cutscene {
	nam = 'key19',
	disp = '19',
	pic = "images/DC_19.png",
	decor = function()
		p '[code ways():disable()]';
		pn ([[Jen embrasse Kira. Elle ouvre les yeux et la vie, que les Skeksès lui avaient pris avant que Jen n'ai soigné le cristal, refait surface.]]);
		pn '[cut]';
		p '[cls]';
		pn([[Les deux Gelflings et toutes les créatures peuvent enfin vivre en paix tous ensemble dans un monde dont l'harmonie, après des centaines d'années d'obscurité, a été rétablie.]]);
		pn '[cut]';
		p '[cls]';
		p '[code ways():enable()]';
		pn([[Merci d'avoir joué à "THE DARK CRYSTAL" !
			^Vous êtes victorieux. CLIQUEZ SUR "RECOMMENCER" OU [TAP] POUR RETENTER L'AVENTURE.]]);
	end,
	way = { path {'#19START', 'RECOMMENCER', 'main'}:disable(),
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
