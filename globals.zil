"GLOBALS for

			       ZORK ZERO
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<BEGIN-SEGMENT 0>

<INCLUDE "BASEDEFS" "FIND" "PDEFS">

<ADJ-SYNONYM LARGE HUGE BIG GIANT GIGANTIC TREMENDOUS MIGHTY MASSIVE ENORMOUS
	     ;"LARGER HUGER BIGGER MIGHTIER">

<ADJ-SYNONYM SMALL SMALLER TINY TINIER LITTLE PETITE TEENSY WEENSY>

;<ADJ-SYNONYM MY MINE> ;"screws up parsing of Iron Mine and Granola Mine"

<GLOBAL LIT T>

<GLOBAL MOVES 0>

<GLOBAL SCORE 0>

<CONSTANT OBJECT-SPLIT 0>

<GLOBAL HERE:OBJECT BANQUET-HALL>

<OBJECT GLOBAL-OBJECTS
	;(SYNONYM ZZMGCK) ;"No, this synonym doesn't need to exist... sigh"
	(DESC "it")
	(FLAGS INVISIBLE TOUCHBIT SURFACEBIT TRYTAKEBIT OPENBIT SEARCHBIT
	       TRANSBIT WEARBIT ONBIT LIGHTBIT RLANDBIT WORNBIT INTEGRALBIT
	       VEHBIT OUTSIDEBIT CONTBIT VOWELBIT LOCKEDBIT NDESCBIT DOORBIT
	       ACTORBIT PARTBIT INBIT FEMALEBIT KLUDGEBIT DROPBIT BURNBIT
	       ORBBIT FLAMEBIT NALLBIT KEYBIT UNDERGROUNDBIT REDESCBIT)>

<OBJECT LOCAL-GLOBALS
	(LOC GLOBAL-OBJECTS)
	(DESC "it")
	;(SYNONYM ZZMGCK)
	;(DESCFCN 0)
        ;(GLOBAL GLOBAL-OBJECTS)
	;(FDESC "F")
	;(LDESC "F")
	;(SIZE 0)
	;(TEXT "")
	;(CAPACITY 0)
	;(GENERIC ME-F)>

<OBJECT ROOMS
	;(IN TO ROOMS)
	(DESC "it")>

<OBJECT INTNUM
	(LOC GLOBAL-OBJECTS)
	(DESC "number")
	(SYNONYM NUMBER NUMBERS INT.NUM)
	(ADJECTIVE INT.NUM INT.TIM)
	;(ACTION INTNUM-F)>

;<BEGIN-SEGMENT 0>

;<ROUTINE INTNUM-F ("AUX" X)	;"moved to CONSTRUCTION-F"
	 <COND (<AND <EQUAL? ,HERE ,CONSTRUCTION>
		     <NOUN-USED? ,INTNUM ,W?NUMBER>>
		<TELL
"The number engraved on the wall is \"" N ,CONSTRUCTION-LOC ".\"" CR>)>>

;<END-SEGMENT>

<OBJECT IT
	(LOC GLOBAL-OBJECTS)
	(SYNONYM IT ;THEM)
	(DESC "it")
	(FLAGS VOWELBIT NARTICLEBIT TOUCHBIT)>

<OBJECT THEM
	(LOC GLOBAL-OBJECTS)
	(SYNONYM ;IT THEM)
	(DESC "them")
	(FLAGS ;VOWELBIT NARTICLEBIT TOUCHBIT)>

<OBJECT HIM
	(LOC GLOBAL-OBJECTS)
	(SYNONYM HIM HIMSELF)
	(DESC "him")
	(FLAGS NARTICLEBIT TOUCHBIT)>

<OBJECT HER
	(LOC GLOBAL-OBJECTS)
	(SYNONYM HER HERSELF)
	(DESC "her")
	(FLAGS NARTICLEBIT TOUCHBIT)>

<OBJECT LEFT-RIGHT
	(LOC GLOBAL-OBJECTS)
	(DESC "that way")
	(SYNONYM LEFT RIGHT)
	(FLAGS NARTICLEBIT)
	(ACTION LEFT-RIGHT-F)>

;<BEGIN-SEGMENT 0>

<ROUTINE LEFT-RIGHT-F ()
	 <COND (<VERB? CHASTISE> ;"LOOK LEFT or LOOK RIGHT"
		<TELL "You see nothing unusual." CR>)
	       (<VERB? WALK WALK-TO ENTER>
		<COND ;(<AND <EQUAL? ,HERE ,WEIRD>	;"moved to WEIRD-F"
			    <NOUN-USED? ,LEFT-RIGHT ,W?LEFT>
			    <EQUAL? ,TOWER-BEATEN ,PYRAMID-L>>
		       <DO-WALK ,P?WEST>)
		      ;(<AND <EQUAL? ,HERE ,WEIRD>	;"moved to WEIRD-F"
			    <NOUN-USED? ,LEFT-RIGHT ,W?RIGHT>
			    <EQUAL? ,TOWER-BEATEN ,PYRAMID-R>>
		       <DO-WALK ,P?EAST>)
		      ;(<EQUAL? ,HERE ,TESTING-ROOM> ;"moved to TESTING-ROOM-F"
		       <PERFORM ,V?ENTER
				<COND (<NOUN-USED? ,LEFT-RIGHT ,W?RIGHT>
				       ,RIGHT-BOOTH)
				      (T
				       ,LEFT-BOOTH)>>)
		      (T
		       <V-WALK-AROUND>)>)
	       (<VERB? SET>
		<TELL "You turn ninety degrees, with little effect." CR>)>>

<END-SEGMENT>
<BEGIN-SEGMENT CASTLE>

<OBJECT GRUE
	(LOC GLOBAL-OBJECTS)
	(SYNONYM GRUE GRUES)
	(ADJECTIVE LURKING SINISTER HUNGRY SILENT)
	(DESC "lurking grue")
	(RESEARCH
"\"The grue was once a sinister, lurking presence in the dark places of the
earth. Its favorite diet was adventurers, but its insatiable appetite was
tempered by its fear of light. No grue was ever seen by the light of day,
and few ever survived its fearsome jaws to tell the tale.\"|
   The encyclopedia goes on to say, \"Grues were eradicated from the face of
the world during the time of Entharion, many by his own hand and his legendary
blade Grueslayer. Although it has now been many a century since the last grue
sighting, old hags still delight in scaring children by telling them that
grues still lurk in the bottomless pits of the Empire, and will one day lurk
forth again.\"") 
	(ACTION GRUE-F)>

<END-SEGMENT>
<BEGIN-SEGMENT 0>

<ROUTINE GRUE-F ()
	 <COND (<VERB? EXAMINE FIND>
		<COND (<FSET? ,LANTERN ,TRYTAKEBIT>
		       <TELL
"Don't be silly! There haven't been grues around for centuries!" CR>)
		      (T
		       <TELL
"There is no grue here, but I'm sure there is at least one lurking
in the darkness nearby.">
		       <COND (<AND <FIND-IN ,PROTAGONIST ,ONBIT>
				   <NOT <FSET? ,HERE ,ONBIT>>>
			      <TELL
" I wouldn't let my light go out if I were you!" CR>)>)>)>>

<OBJECT SAILOR
	(LOC GLOBAL-OBJECTS)
	(DESC "sailor")
	(SYNONYM SAILOR)
	(ACTION SAILOR-F)>

<ROUTINE SAILOR-F ("OPT" (ARG <>))
	 <COND (<EQUAL? .ARG ,M-WINNER>
		<COND (<VERB? HELLO>
		       <TELL "Nothing happens here." CR>)
		      (T
		       <CANT-SEE ,SAILOR>)>)
	       (<VERB? WAIT-FOR>
		<TELL "You are liable to be waiting for several sequels." CR>)
	       (<AND <HANDLE ,SAILOR>
		     <NOT <VERB? TELL HELLO>>>
		<CANT-SEE ,SAILOR>)>>

<OBJECT GLOBAL-SLEEP
	(LOC GLOBAL-OBJECTS)
	(DESC "sleep")
	(SYNONYM SLEEP NAP SNOOZE)
	(FLAGS NARTICLEBIT)
	(ACTION GLOBAL-SLEEP-F)>

<ROUTINE GLOBAL-SLEEP-F ()
	 <COND (<VERB? WALK-TO TAKE>
		<V-SLEEP>)
	       (<AND <VERB? PUT-TO>
		     <PRSI? ,GLOBAL-SLEEP>>
		<COND (<PRSO? ,BEDBUG>
		       <TELL "You sing a brief lullaby. ">
		       <REMOVE-BEDBUG "hear">)
		      (T
		       <TELL "You're not a hypnotist." CR>)>)>>

<OBJECT LULLABY
	(LOC GLOBAL-OBJECTS)
	(DESC "lullaby")
	(SYNONYM LULLABY LULLABYE SONG)
	(ACTION LULLABY-F)>

<ROUTINE LULLABY-F ("AUX" ACTOR)
	 <COND (<VERB? SING>
		<COND (<NOT ,PRSI>
		       <COND (<IN? ,BEDBUG ,HERE>
			      <SETG PRSI ,BEDBUG>)
			     (<SET ACTOR <FIND-IN ,HERE ,ACTORBIT>>
			      <SETG PRSI .ACTOR>)
			     (T
			      <TELL
"[If you put me to sleep, you'd have a heck of a time communicating with the
game! By the way, don't expect any offers from the Borphee Opera Company.]" CR>
			      <RTRUE>)>)>
		<COND (<PRSI? ,BEDBUG>
		       <PERFORM ,V?PUT-TO ,BEDBUG ,GLOBAL-SLEEP>
		       <RTRUE>)
		      (<FSET? ,PRSI ,ACTORBIT>
		       <TELL
"Despite your best rendition," T ,PRSI " remains awake." CR>)
		      (T
		       <TELL
"Amazingly," T ,PRSI " is now motionless! You must have put
it right to sleep! Incredible! What a talent!" CR>)>)
	       (<VERB? PLAY>
		<COND (<AND <IN? ,BEDBUG ,HERE>
			    <NOUN-USED? ,LULLABY ,W?LULLABY ,W?LULLABYE>>
		       <PERFORM ,V?PUT-TO ,BEDBUG ,GLOBAL-SLEEP>
		       <RTRUE>)
		      (<ULTIMATELY-IN? ,VIOLIN ,PROTAGONIST>
		       <TELL "[with" T ,VIOLIN "]" CR>
		       <PERFORM-PRSA ,VIOLIN>)
		      (<IN? ,HARMONICA ,PROTAGONIST>
		       <TELL "[with" T ,HARMONICA "]" CR>
		       <PERFORM-PRSA ,HARMONICA>)
		      (T
		       <TELL "You have no instrument to play it on." CR>)>)>>

<OBJECT GROUND
	(LOC GLOBAL-OBJECTS)
	(SYNONYM FLOOR GROUND SAND)
	(SDESC "ground")
	(ACTION GROUND-F)>

<ROUTINE GROUND-F ()
	 <SET-GROUND-DESC>
	 <COND (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,OUBLIETTE>
		       <TELL "Mud. Squishy mud." CR>)
		      (<EQUAL? ,HERE ,PITS>
		       <PERFORM ,V?EXAMINE ,PITS-OBJECT>
		       <RTRUE>)
		      (<EQUAL? ,HERE ,TIGHT-SQUEEZE>
		       <TELL
"You see a man-sized opening through which cool air seems to flow." CR>)>)
	       (<VERB? LOOK-UNDER>
		<IMPOSSIBLES>)
	       (<VERB? CLIMB-UP CLIMB-ON CLIMB ENTER>
		<WASTES>)
	       (<VERB? LEAVE>
		<DO-WALK ,P?UP>)>>

<ROUTINE SET-GROUND-DESC ()
	 <COND (<FSET? ,HERE ,OUTSIDEBIT>
		<PUTP ,GROUND ,P?SDESC "ground">)
	       (<FSET? ,HERE ,DESERTBIT>
		<PUTP ,GROUND ,P?SDESC "sand">)
	       (T
		<PUTP ,GROUND ,P?SDESC "floor">)>>

<OBJECT GLOBAL-HOLE ;"exists entirely so player can type DIG HOLE"
	(LOC GLOBAL-OBJECTS)
	(DESC "hole")
	(SYNONYM HOLE)
	(ACTION GLOBAL-HOLE-F)>

<ROUTINE GLOBAL-HOLE-F ()
	 <COND (<AND <VERB? DIG>
		     <PRSO? ,GLOBAL-HOLE>>
		<COND (,PRSI
		       <COND (<PRSI? ,SHOVEL>
			      <PERFORM-PRSA ,GROUND ,SHOVEL>)
			     (<ULTIMATELY-IN? ,SHOVEL>
			      <TELL "[with" T ,SHOVEL "]" CR>
			      <PERFORM-PRSA ,PRSI ,SHOVEL>)
			     (T
			      <PRINT "[with your hands]">
			      <CRLF>
			      <PERFORM-PRSA ,PRSI ,HANDS>)>)
		      (<ULTIMATELY-IN? ,SHOVEL>
		       <TELL "[with" T ,SHOVEL "]" CR>
		       <PERFORM-PRSA ,GROUND ,SHOVEL>)
		      (T
		       <PRINT "[with your hands]">
		       <CRLF>
		       <PERFORM-PRSA ,GROUND ,HANDS>)>)
	       (<HANDLE ,GLOBAL-HOLE>
		<CANT-SEE ,GLOBAL-HOLE>)>>

<OBJECT WALL
	(LOC GLOBAL-OBJECTS)
	(DESC "wall")
	(SYNONYM WALL WALLS)
	(ADJECTIVE NORTH ;N ;NORTHEAST NE EAST ;E ;SOUTHEAST SE
	 	   SOUTH ;S ;SOUTHWEST SW WEST ;W ;NORTHWEST NW
		   REAR FAR)
	(FLAGS NDESCBIT TOUCHBIT)
	(ACTION WALL-F)>

<ROUTINE WALL-F ("AUX" (CNT 0))
   <COND (<VERB? READ EXAMINE>
	  <COND (<EQUAL? ,HERE ,CHURCH>
		 <PERFORM ,V?READ ,TENET>
		 <RTRUE>)
		;(<AND <EQUAL? ,HERE ,CELL>	;"moved to -F"
		      <IN? ,COBWEBS ,CELL>>
		 <TELL ,CELL-WALL-DESC CR>)>)
	 (<AND <VERB? CLEAN>
	       <EQUAL? ,HERE ,CELL>
	       <ADJ-USED? ,WALL ,W?REAR>
	       <IN? ,COBWEBS ,CELL>>
	  <PERFORM ,V?CLEAN ,COBWEBS>
	  <RTRUE>)
	 (<VERB? THROW-OVER>
	  <COND ;(<EQUAL? ,HERE ,PERIMETER-WALL>	;"moved to -F"
		 <TELL
"Babe Flathead himself couldn't toss something over this towering wall!" CR>)
		(T
		 <TELL "The wall joins the ceiling!" CR>)>)
	 (<AND <VERB? PUT PUT-ON>
	       <PRSO? ,N-S-PASSAGE ,NW-SE-PASSAGE>>
	  <COND (<ADJ-USED? ,WALL <>>
		 <SETG P-WON <>>
		 <TELL
"[You didn't specify which wall you meant: EAST WALL for example.]" CR>)
		(<OR <AND <PRSO? ,N-S-PASSAGE>
			  <NOT <ADJ-USED? ,WALL ,W?NORTH ,W?N>>
			  <NOT <ADJ-USED? ,WALL ,W?SOUTH ,W?S>>>
		     <AND <PRSO? ,NW-SE-PASSAGE>
			  <NOT <ADJ-USED? ,WALL ,W?NORTHWEST ,W?NW>>
			  <NOT <ADJ-USED? ,WALL ,W?SOUTHEAST ,W?SE>>>>
		 <TELL
,YOU-CANT "install the passage on that wall--it's" AR ,PRSO>)
		(<PASSAGE-THERE>
		 <RTRUE>)
		(<OR <EQUAL? ,HERE ,GONDOLA ,HOLD>
		     <EQUAL? <LOC ,PROTAGONIST> ,YACHT ,DB>>
		 <TELL
"A built-in safety feature prevents the passage from being
installed in a vehicle." CR>)
		(T
		 <MOVE ,PRSO ,HERE>
		 <FCLEAR ,PRSO ,TAKEBIT>
		 <SETG COMPASS-CHANGED T>
		 <PUTP ,PRSO ,P?OWNER ,WALL>
		 <TELL "There's now a passage leading ">
		 <COND (<PRSO? ,N-S-PASSAGE>
			<COND (<EQUAL? ,HERE ,CONSTRUCTION>
			       <SETG N-S-PASSAGE-LOC ,CONSTRUCTION-LOC>)>
			<COND (<ADJ-USED? ,WALL ,W?NORTH ,W?N>
			       <SETG N-S-PASSAGE-DIR ,P?NORTH>
			       <COND (<AND <EQUAL? ,HERE ,CONSTRUCTION>
					   <NOT <L? ,CONSTRUCTION-LOC 8>>>
				      ;"second clause in predicate: can't go
 				        north from the top Construction row"
				      <PUT ,NORTH-EXITS 0
					   <+ ,CONSTRUCTION-LOC 100>>
				      <REPEAT ()
				      ;"passage appears in room at other end"
					  <COND (<EQUAL?
						   <GET ,STORAGE-TABLE .CNT> 0>
						 <PUT ,STORAGE-TABLE .CNT
						     <+ <- ,CONSTRUCTION-LOC 8>
						        ,CONSTRUCTION-OFFSET>>
						 <PUT ,STORAGE-TABLE
						      <+ .CNT 1> ,N-S-PASSAGE>
						 <RETURN>)
						(T
						 <SET CNT <+ .CNT 2>>)>>)>
			       <TELL "nor">)
			      (T
			       <SETG N-S-PASSAGE-DIR ,P?SOUTH>
			       <COND (<AND <EQUAL? ,HERE ,CONSTRUCTION>
					   <NOT <G? ,CONSTRUCTION-LOC 55>>>
				      ;"last clause in predicate: you can't
				        go south from bottom Construction row"
				      <PUT ,NORTH-EXITS 0
					   <+ ,CONSTRUCTION-LOC 108>>
				      <REPEAT ()
				      ;"passage appears in room at other end"
				         <COND (<EQUAL?
					           <GET ,STORAGE-TABLE .CNT> 0>
					        <PUT ,STORAGE-TABLE
						     .CNT
						     <+ <+ ,CONSTRUCTION-LOC 8>
						        ,CONSTRUCTION-OFFSET>>
						<PUT ,STORAGE-TABLE
						     <+ .CNT 1> ,N-S-PASSAGE>
					        <RETURN>)
					       (T
					        <SET CNT <+ .CNT 2>>)>>)>
				     <TELL "sou">)>
			<TELL "th from the room." CR>)
		       (T
			<COND (<EQUAL? ,HERE ,CONSTRUCTION>
			       <SETG NW-SE-PASSAGE-LOC
				     ,CONSTRUCTION-LOC>)>
			<COND (<ADJ-USED? ,WALL ,W?NORTHWEST ,W?NW>
			       <SETG NW-SE-PASSAGE-DIR ,P?NW>
			       <COND (<AND <EQUAL? ,HERE ,CONSTRUCTION>
				       	   <NOT <OR <EQUAL?
						      <MOD ,CONSTRUCTION-LOC 8>
						      0>
						    <L? ,CONSTRUCTION-LOC 8>>>>
				      ;"last predicate clause: you can't go NW
				        from top or west rows of Construction" 
				      <PUT ,SE-EXITS 0
					   <+ ,CONSTRUCTION-LOC 91>>
				      <REPEAT ()
				      ;"passage appears in room at other end"
				         <COND (<EQUAL?
						   <GET ,STORAGE-TABLE .CNT> 0>
					        <PUT ,STORAGE-TABLE .CNT
					             <+ <- ,CONSTRUCTION-LOC 9>
						        ,CONSTRUCTION-OFFSET>>
						<PUT ,STORAGE-TABLE
					             <+ .CNT 1> ,NW-SE-PASSAGE>
					        <RETURN>)
					       (T
					        <SET CNT <+ .CNT 2>>)>>)>
			       <TELL "northwe">)
			      (T
			       <SETG NW-SE-PASSAGE-DIR ,P?SE>
			       <COND (<AND <EQUAL? ,HERE ,CONSTRUCTION>
				       	   <NOT <OR <EQUAL?
						      <MOD ,CONSTRUCTION-LOC 8>
						      7>
						   <G? ,CONSTRUCTION-LOC 55>>>>
				      ;"last predicate clause: you can't go SE
				        from bottom or east rows of Const site"
				      <PUT ,SE-EXITS 0
					   <+ ,CONSTRUCTION-LOC 100>>
				      <REPEAT ()
				      ;"passage appears in room at other end"
				 	 <COND (<EQUAL?
						   <GET ,STORAGE-TABLE .CNT> 0>
						<PUT ,STORAGE-TABLE
						     .CNT
					     	     <+ <+ ,CONSTRUCTION-LOC 9>
							,CONSTRUCTION-OFFSET>>
						<PUT ,STORAGE-TABLE
					     	     <+ .CNT 1> ,NW-SE-PASSAGE>
						<RETURN>)
					       (T
						<SET CNT <+ .CNT 2>>)>>)>
			       <TELL "southea">)>
			<TELL "st from the room." CR>)>)>)>>

<ROUTINE PASSAGE-THERE ("AUX" (PASSAGE? <>))
	 <COND (<ADJ-USED? ,WALL ,W?NORTH ,W?N>
		<COND (<EQUAL? ,HERE ,PEG-ROOM>
		       <COND (<NOT ,PEG-PASSAGE-OPENED>
			      <REPELLED "north">
			      <SET PASSAGE? ,M-FATAL>)
			     (T
		       	      <SET PASSAGE? <>>)>)
		      (<EQUAL? ,HERE ,SECRET-PASSAGE>
		       <COND (<NOT ,SECRET-PASSAGE-OPEN>
			      <REPELLED "north">
			      <SET PASSAGE? ,M-FATAL>)
			     (T
			      <SET PASSAGE? <>>)>)
		      (<EQUAL? ,HERE ,CONSTRUCTION>
		       <COND (<INTBL? ,NORTH-EXITS ,CONSTRUCTION-LOC 11>
			      <SET PASSAGE? T>)>)
		      (<AND <EQUAL? ,HERE ,WEIRD>
			    <NOT <EQUAL? ,TOWER-BEATEN ,PYRAMID>>>
		       <REPELLED "north">
		       <SET PASSAGE? ,M-FATAL>)
		      (<EQUAL? ,HERE ,G-U-MOUNTAIN>
		       <COND (<IN? ,BOULDER ,HERE>
			      <REPELLED "north">
			      <SET PASSAGE? ,M-FATAL>)
			     (T
			      <SET PASSAGE? <>>)>)
		      (<GETPT ,HERE ,P?NORTH>
		       <SET PASSAGE? T>)>)
	       (<ADJ-USED? ,WALL ,W?SOUTH ,W?S>
		<COND (<EQUAL? ,HERE ,CONSTRUCTION>
		       <COND (<INTBL? ,NORTH-EXITS <+ ,CONSTRUCTION-LOC 8> 11>
			      <SET PASSAGE? T>)>)
		      (<EQUAL? ,HERE ,THRONE-ROOM>
		       <COND (<NOT ,SECRET-PASSAGE-OPEN>
			      <REPELLED "south">
			      <SET PASSAGE? ,M-FATAL>)
			     (T
		       	      <SET PASSAGE? <>>)>)
		      (<GETPT ,HERE ,P?SOUTH>
		       <SET PASSAGE? T>)>)
	       (<ADJ-USED? ,WALL ,W?NORTHWEST ,W?NW>
		<COND (<EQUAL? ,HERE ,CONSTRUCTION>
		       <COND (<INTBL? ,SE-EXITS <- ,CONSTRUCTION-LOC 9> 7>
			      <SET PASSAGE? T>)>)
		      (<EQUAL? ,HERE ,PERIMETER-WALL>
		       <SET PASSAGE? <>>)
		      (<GETPT ,HERE ,P?NW>
		       <SET PASSAGE? T>)>)
	       (<ADJ-USED? ,WALL ,W?SOUTHEAST ,W?SE>
		<COND (<EQUAL? ,HERE ,CONSTRUCTION>
		       <COND (<INTBL? ,SE-EXITS ,CONSTRUCTION-LOC 7>
			      <SET PASSAGE? T>)>)
		      (<GETPT ,HERE ,P?SE>
		       <SET PASSAGE? T>)>)>
	 <COND (<EQUAL? .PASSAGE? ,M-FATAL> ;"handled earlier in routine"
		<RTRUE>)
	       (.PASSAGE?
		<TELL "There's already an exit in that direction!" CR>
		<RTRUE>)
	       (T
	 	<RFALSE>)>>

<ROUTINE REPELLED (STRING)
	 <TELL
"Strangely, the passage seems repelled by the " .STRING " wall, as though
two inconsistent types of magic were at work in the same place." CR>>

<OBJECT GLOBAL-PASSAGE
	(LOC GLOBAL-OBJECTS)
	(DESC "passage")
	(SYNONYM PASSAGE PASSAGEWAY TUNNEL)
	(ADJECTIVE GLOOMY DARK SECRET HIDDEN WIDE NARROW LOW STEEP SLOPING
	 	   DUSTY UNEVEN WINDING FORBIDDING GRAVELLY HALF-BURIED
		   HIGHWAY POORLY-DUG)
	(ACTION GLOBAL-PASSAGE-F)>

<ROUTINE GLOBAL-PASSAGE-F ()
	 <COND (<VERB? ENTER>
		<V-WALK-AROUND>)>>

<OBJECT CEILING
	(LOC GLOBAL-OBJECTS)
	(FLAGS NDESCBIT TOUCHBIT)
	(DESC "ceiling")
	(SYNONYM CEILING ROOF)
	(ADJECTIVE LOW HIGH)
	(ACTION CEILING-F)>

<ROUTINE CEILING-F ()
	 <COND (<AND <NOUN-USED? ,CEILING ,W?ROOF>
		     <EQUAL? ,HERE ,ROOF ,PARAPET>>
		<COND (<VERB? THROW-FROM>
		       <REMOVE ,PRSO>
		       <COND (<OR <PRSO? ,PERCH>
				  <ULTIMATELY-IN? ,PERCH ,PRSO>>
			      <SETG REMOVED-PERCH-LOC ,GROUND>)>
		       <PRINT "You hear a \"splat\" as">
		       <TELL T ,PRSO " sinks into the ground far below." CR>)
		      (<PRSO? ,CEILING>
		       <PERFORM-PRSA ,GLOBAL-HERE ,PRSI>)
		      (T
		       <PERFORM-PRSA ,PRSO ,GLOBAL-HERE>)>)
	       (<AND <FSET? ,HERE ,OUTSIDEBIT>
		     <HANDLE ,CEILING>>
		<CANT-SEE ,CEILING>)
	       ;(<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,BARBICAN>	;"moved to -F"
		       <TELL
"It's too gloomy in here to make out any of the features of the ceiling." CR>)
		      (<EQUAL? ,HERE ,MEGABOZ-HUT>	;"moved to -F"
		       <TELL ,MEGABOZ-CEILING-DESC CR>)>)
	       (<VERB? LOOK-UNDER>
		<PERFORM ,V?LOOK>
		<RTRUE>)>>

<OBJECT SLIME
	(LOC LOCAL-GLOBALS)
	(DESC "slime")
	(SYNONYM SLIME)
	(ADJECTIVE THICK BLACK)
	(FLAGS NARTICLEBIT)
	(ACTION SLIME-F)>

<ROUTINE SLIME-F ()
	 <COND (<VERB? TASTE TOUCH EAT>
		<TELL "Mega-yucko!" CR>)>>

<OBJECT WATER
	(LOC GLOBAL-OBJECTS)
	(DESC "water")
	(SYNONYM WATER WATERS GLOOP GLOOPS)
	(ADJECTIVE ONE TWO THREE FOUR FIVE SIX SEVEN EIGHT NINE ;TEN INT.NUM)
	(FLAGS NARTICLEBIT)
	(GENERIC G-VIAL-WATER-F)
	(OWNER <>) ;"set by GOTO"
	(ACTION WATER-F)>

<ROUTINE WATER-F ("AUX" X)
	 <COND (<SET X <FIND-WATER>>
		T)
	       (<AND <VISIBLE? ,LARGE-VIAL>
		     <VISIBLE? ,SMALL-VIAL>
		     <G? ,LARGE-VIAL-GLOOPS 0>
		     <G? ,SMALL-VIAL-GLOOPS 0>>
		<TELL ;,WHICH-WATER
"[You'll have to specify which water you mean by referring to the vial
that contains it.]" CR>
		<RTRUE>)
	       (<AND <VISIBLE? ,LARGE-VIAL>
		     <G? ,LARGE-VIAL-GLOOPS 0>>
		<SET X ,LARGE-VIAL>)
	       (<AND <VISIBLE? ,SMALL-VIAL>
		     <G? ,SMALL-VIAL-GLOOPS 0>>
		<SET X ,SMALL-VIAL>)
	       (<NOT <HANDLE ,WATER>>
		<RFALSE>)
	       (T
		<TELL ,YOU-CANT-SEE-ANY "water here.]" CR>
		<RTRUE>)>
	 <COND (<AND <VERB? COUNT>
		     <NOUN-USED? ,WATER ,W?GLOOPS>>
		<COND (<VISIBLE? ,LARGE-VIAL>
		       <TELL "The large vial ">
		       <COND (<EQUAL? ,LARGE-VIAL-GLOOPS 0>
			      <TELL "is empty">)
			     (T
			      <TELL "contains " N ,LARGE-VIAL-GLOOPS " gloop">
			      <COND (<NOT <EQUAL? ,LARGE-VIAL-GLOOPS 1>>
				     <TELL "s">)>)>
		       <COND (<VISIBLE? ,SMALL-VIAL>
			      <TELL ". ">)
			     (T
			      <TELL ,PERIOD-CR>)>)>
		<COND (<VISIBLE? ,SMALL-VIAL>
		       <TELL "The small vial ">
		       <COND (<EQUAL? ,SMALL-VIAL-GLOOPS 0>
			      <TELL "is empty">)
			     (T
			      <TELL "contains " N ,SMALL-VIAL-GLOOPS " gloop">
			      <COND (<NOT <EQUAL? ,SMALL-VIAL-GLOOPS 1>>
				     <TELL "s">)>)>
		       <TELL ,PERIOD-CR>)>)
	       (<AND <VERB? FILL>
		     <PRSI? ,WATER>>
		<COND (<PRSO? ,SMALL-VIAL ,LARGE-VIAL>
		       <COND (<EQUAL? .X ,LARGE-VIAL>
			      <PERFORM ,V?FILL ,PRSO ,LARGE-VIAL>
			      <RTRUE>)
			     (<EQUAL? .X ,SMALL-VIAL>
			      <PERFORM ,V?FILL ,PRSO ,SMALL-VIAL>
			      <RTRUE>)
			     (T
			      <RFALSE> ;"handled by VIAL-F")>)
		      (<PRSO? ,CUP>
		       <TELL
"The water evaporates in a puff of smoke as soon as it touches the cup.
A strong magic is at work here!" CR>)
		      (T
		       <IMPOSSIBLES>)>)
	       (<AND <VERB? REMOVE EMPTY>
		     <NOT ,PRSI>
		     <NOUN-USED? ,WATER ,W?GLOOP ,W?GLOOPS>
		     <OR <VISIBLE? ,LARGE-VIAL>
			 <VISIBLE? ,SMALL-VIAL>>>
		<COND (<AND <VISIBLE? ,LARGE-VIAL>
			    <VISIBLE? ,SMALL-VIAL>>
		       <COND (<AND ,LARGE-VIAL-GLOOPS
				   ,SMALL-VIAL-GLOOPS>
			      <TELL "There's water in both vials." CR>
			      <RTRUE>)
			     (,LARGE-VIAL-GLOOPS
			      <SETG PRSI ,LARGE-VIAL>)
			     (,SMALL-VIAL-GLOOPS
			      <SETG PRSI ,SMALL-VIAL>)
			     (T
			      <TELL "Neither vial contains water!" CR>
			      <RTRUE>)>)
		      (<VISIBLE? ,LARGE-VIAL>
		       <SETG PRSI ,LARGE-VIAL>)
		      (T
		       <SETG PRSI ,SMALL-VIAL>)>
		<PERFORM ,V?EMPTY-FROM ,WATER ,PRSI>
		<RTRUE>)
	       (<VERB? DRINK>
		<TELL "You're not thirsty." CR>)
	       (<VERB? LOOK-INSIDE LOOK-UNDER EXAMINE>
		<TELL "You see">
		<PRINT " nothing of interest">
		<TELL "." CR>)
	       (<VERB? REACH-IN TOUCH>
		<TELL "Your hand is now wet">
		<COND (<EQUAL? ,HERE ,OASIS>
		       <TELL " and cold">)>
		<TELL ,PERIOD-CR>)
	       (<AND <VERB? PUT PUT-ON>
		     <PRSI? ,WATER>>
		<COND (<IN? ,PROTAGONIST ,DB>
		       <TELL
"You can't reach the water -- the bathysphere is closed! (Fortunately.)" CR>
		       <RTRUE>)
		      (<EQUAL? ,HERE ,PARLOR>
		       <MOVE ,PRSO ,FISH-TANK>)
		      (<EQUAL? ,HERE ,LAKE-FLATHEAD>
		       <COND (<FSET? ,PRSO ,ANIMATEDBIT>
			      <REMOVE ,PRSO>)
			     (T
			      <MOVE ,PRSO ,LAKE-BOTTOM>)>)
		      (T
		       <COND (<OR <PRSO? ,PERCH>
				  <ULTIMATELY-IN? ,PERCH ,PRSO>>
			      <SETG REMOVED-PERCH-LOC ,WATER>)>
		       <REMOVE ,PRSO>)>
		<TELL "With a \"p">
		<COND (<AND <PRSO? ,CANDLE ,GUTTERING-TORCH ,FLICKERING-TORCH>
			    <FSET? ,PRSO ,ONBIT>>
		       <FCLEAR ,PRSO ,ONBIT>
		       <FCLEAR ,PRSO ,FLAMEBIT>
		       <COND (<PRSO? ,GUTTERING-TORCH>
			      <DEQUEUE I-GUTTERING-TORCH>)
			     (<PRSO? ,FLICKERING-TORCH>
			      <DEQUEUE I-FLICKERING-TORCH>)>
		       <TELL "ffft">)
		      (T
		       <TELL "lunk">)>
		<TELL ",\"" T ,PRSO " sinks into the water">
		<COND (<PRSO? ,ROOSTER ,FOX>
		       <TELL ", you heartless animal drowner, you">)>
		<TELL ,PERIOD-CR>)
	       (<VERB? ENTER SWIM>
		<COND (<EQUAL? .X ,SWAMP>
		       <TELL
"You're already ankle-deep in the swampy water, which is yucky enough." CR>)
		      (<EQUAL? .X ,FRIGID-RIVER>
		       <TELL
"The Frigid River is known for its unpredictable currents." CR>)
		      (<EQUAL? .X ,FLATHEAD-OCEAN>
		       <TELL
"The pounding surf would kill you in a moment." CR>)
		      (<EQUAL? .X ,LAKE-FLATHEAD>
		       <COND (,ALLIGATOR
			      <JIGS-UP
"The Loch Flatheadia Monster, usually dismissed as a fairy tale, wells
up from the depths of the lake and swallows you.">)
			     (T
		       	      <TELL
"These waters are known for their hungry denizens." CR>)>)
		      (<EQUAL? .X ,STREAM-OBJECT>
		       <DO-WALK ,P?WEST>)
		      (<EQUAL? .X ,OASIS-OBJECT>
		       <TELL
"Only a Polar Gumffbeast could swim in such cold water!" CR>)
		      (<EQUAL? .X ,FISH-TANK>
		       <COND (,DESCRIBED-TANK-AS-LARGE
			      <TELL
"There's no way you could fit into this fish tank! [All right, I'll admit
that I went a little overboard when I described the fish tank as \"bigger
than a swimming pool.\"]" CR>)
			     (T
			      <SETG DESCRIBED-TANK-AS-SMALL T>
			      <TELL
"What? Swim in an itsy-bitsy fish tank like this one?!?" CR>)>)
		      (<EQUAL? .X ,MOAT>
		       <COND (,ALLIGATOR
		       	      <JIGS-UP
"The much, much larger alligator who lives in the moat apparently considers
this a territorial invasion.">)
			     (T
		       	      <TELL
"Not recommended. Moats tend to be populated with big,
nasty alligators." CR>)>)>)
	       (<PRSO? ,WATER>
		<PERFORM-PRSA .X ,PRSI>)
	       (T
		<PERFORM-PRSA ,PRSO .X>)>>

<ROUTINE FIND-WATER ()
	 <COND (<GLOBAL-IN? ,MOAT ,HERE>
		<RETURN ,MOAT>)
	       (<EQUAL? ,HERE ,STREAM>
		<RETURN ,STREAM-OBJECT>)
	       (<EQUAL? ,HERE ,PARLOR>
		<RETURN ,FISH-TANK>)
	       (<EQUAL? ,HERE ,RIVERS-END>
		<RETURN ,FRIGID-RIVER>)
	       (<GLOBAL-IN? ,FLATHEAD-OCEAN ,HERE>
		<RETURN ,FLATHEAD-OCEAN>)
	       (<OR <EQUAL? ,HERE ,LAKE-FLATHEAD>
		    <GLOBAL-IN? ,LAKE-FLATHEAD ,HERE>>
		<RETURN ,LAKE-FLATHEAD>)
	       (<GLOBAL-IN? ,SWAMP ,HERE>
		<RETURN ,SWAMP>)
	       (<GLOBAL-IN? ,FJORD ,HERE>
		<RETURN ,FJORD>)
	       (<EQUAL? ,HERE ,OASIS>
		<RETURN ,OASIS-OBJECT>)
	       (T
		<RFALSE>)>>

<OBJECT SMALL-VIAL-WATER
	(DESC "water in the small vial")
	(SYNONYM WATER GLOOP GLOOPS)
	(ADJECTIVE ONE TWO THREE FOUR INT.NUM)
	(FLAGS NARTICLEBIT)
	(GENERIC G-VIAL-WATER-F)
	(ACTION VIAL-WATER-F)>

<OBJECT LARGE-VIAL-WATER
	(DESC "water in the large vial")
	(SYNONYM WATER GLOOP GLOOPS)
	(ADJECTIVE ONE TWO THREE FOUR FIVE SIX SEVEN EIGHT NINE INT.NUM)
	(FLAGS NARTICLEBIT)
	(GENERIC G-VIAL-WATER-F)
	(ACTION VIAL-WATER-F)>

<ROUTINE VIAL-WATER-F ()
	 <COND (<AND <VERB? TAKE>
		     <EQUAL? ,P-PRSA-WORD ,W?REMOVE>>
		<PERFORM ,V?EMPTY-FROM ,WATER
			 <COND (<PRSO? ,LARGE-VIAL-WATER> ,LARGE-VIAL)
			       (T ,SMALL-VIAL)>>)>>

<ROUTINE G-VIAL-WATER-F (SR F "AUX" ADJ VB)
	 <COND (<SET ADJ <FIND-ADJS .F>>
		<SET ADJ <CONVERT-NUMBER .ADJ>>)>
	 <COND (<L? ,LARGE-VIAL-GLOOPS .ADJ>
		<COND (<L? ,SMALL-VIAL-GLOOPS .ADJ>
		       <RETURN <>>)
		      (T
		       <RETURN ,SMALL-VIAL-WATER>)>)
	       (T
		<COND (<L? ,SMALL-VIAL-GLOOPS .ADJ>
		       <RETURN ,LARGE-VIAL-WATER>)
		      (T
		       <RETURN <>>)>)
	       ;(<AND <EQUAL? <SET VB <PARSE-ACTION ,PARSE-RESULT>> ,V?POUR>
		      <PRSI? ,LARGE-VIAL>>
		<RETURN ,SMALL-VIAL-WATER>)
	       ;(<AND <EQUAL? .VB ,V?POUR>
		     <PRSI? ,SMALL-VIAL>>
		<RETURN ,LARGE-VIAL-WATER>)
	       ;(<AND <EQUAL? .VB ,V?EMPTY-FROM>
		     <PRSI? ,LARGE-VIAL>>
		<RETURN ,LARGE-VIAL-WATER>)
	       ;(<AND <EQUAL? .VB ,V?EMPTY-FROM>
		     <PRSI? ,SMALL-VIAL>>
		<RETURN ,SMALL-VIAL-WATER>)
	       ;(<GLOBAL-IN? ,WATER ,HERE>
		<RETURN ,WATER>)
	       ;(<AND <VISIBLE? ,SMALL-VIAL-WATER>
		     <VISIBLE? ,LARGE-VIAL-WATER>>
		<TELL ,WHICH-WATER>
		<RETURN ,ROOMS>)
	       ;(T
		<RETURN ,WATER>)>
	 ;<RFALSE>>

;<OBJECT SKY
	(LOC GLOBAL-OBJECTS)
	(DESC "sky")
	(SYNONYM SKY)
	(ACTION SKY-F)>

;<ROUTINE SKY-F ()
	 <COND (<AND <NOT <FSET? ,HERE ,OUTSIDEBIT>>
		     <HANDLE ,SKY>>
		<CANT-SEE ,SKY>)>>

<CONSTANT BODY-PART-OWNERS
	<TABLE (PURE LENGTH) PROTAGONIST DIMWIT JESTER EXECUTIONER
	       		     SICKLY-WITCH PRICKLY-WITCH>>

<OBJECT HANDS
	(LOC GLOBAL-OBJECTS)
	(SYNONYM HANDS HAND PALM FINGER FINGERS)
	(ADJECTIVE BARE YOUR)
	(DESC ;"your " "hands")
	(OWNER BODY-PART-OWNERS ;PROTAGONIST)
	(FLAGS NDESCBIT PLURALBIT TOUCHBIT ;NARTICLEBIT PARTBIT)
	(ACTION HANDS-F)>

<ROUTINE HANDS-F ("AUX" ACTOR)
	 <COND (<VERB? CLEAN>
		<WASTES>)  
	       (<VERB? SHAKE>
		<COND (<SET ACTOR <FIND-IN ,HERE ,ACTORBIT "with">>
		       <PERFORM ,V?SHAKE-WITH ,HANDS .ACTOR>
		       <RTRUE>)
		      (T
		       <PRINT "There's no one here to ">
		       <TELL "shake hands with." CR>)>)
	       (<VERB? COUNT>
		<COND (<NOUN-USED? ,HANDS ,W?FINGER ,W?FINGERS>
		       <TELL "Ten">)
		      (T
		       <TELL "Two">)>
		<TELL ", as usual." CR>)
	       (<AND <VERB? OPEN CLOSE>
		     ,HAND-IN-WALDO>
		<PERFORM-PRSA ,WALDO>
		<RTRUE>)
	       (<VERB? REMOVE TAKE-OFF>
		<COND (,HAND-IN-WALDO
		       <SETG HAND-IN-WALDO <>>
		       <TELL "You withdraw your hand." CR>)
		      (,FINGER-ON-STRAW
		       <SETG FINGER-ON-STRAW <>>
		       <SETG ELIXIR-TRAPPED <>>
		       <TELL
"You remove your finger from the end of the straw." CR>)
		      (T
		       <TELL
"To quote an old song, \"The hand bone's connected to the
wrist bone...\"" CR>)>)
	       (<AND <VERB? PUT-ON>
		     <PRSO? ,GLOVE>>
		<PERFORM ,V?WEAR ,GLOVE>
		<RTRUE>)
	       (<AND <VERB? TAKE-WITH>
		     <PRSI? ,HANDS>>
		<PERFORM ,V?TAKE ,PRSO>
		<RTRUE>)
	       (<AND <VERB? SNAP>
		     <NOUN-USED? ,HANDS ,W?FINGER ,W?FINGERS>
		     <NOT ,TIME-STOPPED>>
		<COND (<IN? ,PROTAGONIST ,SMALL-THRONE>
		       <OPEN-SECRET-PASSAGE?>)
		      (T
		       <TELL "\"Snap!\"" CR>)>)
	       ;(<AND <VERB? PUT-ON>
		     <PRSI? ,EYES>>
		<PERFORM ,V?SPUT-ON ,EYES ,HANDS>
		<RTRUE>)
	       ;(<AND <VERB? PUT-ON PUT>
		     <PRSI? ,EARS>>
		<PERFORM ,V?SPUT-ON ,EARS ,HANDS>
		<RTRUE>)>>

<ROUTINE OPEN-SECRET-PASSAGE? ()
	 <COND (,SECRET-PASSAGE-OPEN
		<SETG SECRET-PASSAGE-OPEN <>>
		<SETG COMPASS-CHANGED T>
		<TELL "The secret passage closes!" CR>)
	       (,SECRET-PASSAGE-DISCOVERED
		<SETG SECRET-PASSAGE-OPEN T>
		<SETG COMPASS-CHANGED T>
		<TELL "The secret passage opens once again." CR>)
	       (T
		<SETG SECRET-PASSAGE-OPEN T>
		<SETG SECRET-PASSAGE-DISCOVERED T>
		<SETG COMPASS-CHANGED T>
		<TELL
"Behind the throne, accompanied by a puff of dust, a secret passage grinds
open, leading south into darkness!">
		<COND (<IN? ,JESTER ,HERE>
		       <TELL
" The jester applauds you, howling with mysterious delight.">)>
		<CRLF>
		<INC-SCORE ,SECRET-PASSAGE-SCORE>
		<SETG SECRET-PASSAGE-SCORE 0>
		<RTRUE>)>>

<OBJECT FEET
	(LOC GLOBAL-OBJECTS)
	(SYNONYM FEET FOOT TOE TOES)
	(ADJECTIVE YOUR)
	(DESC ;"your " "feet")
	(OWNER BODY-PART-OWNERS ;PROTAGONIST)
	(FLAGS NDESCBIT PLURALBIT TOUCHBIT ;NARTICLEBIT PARTBIT)
	(ACTION FEET-F)>

<ROUTINE FEET-F ()
	 <COND (<AND <VERB? ENTER> ;"input was GET ON FEET"
		     <EQUAL? ,P-PRSA-WORD ,W?GET>>
		<SETG P-PRSA-WORD ,W?STAND>
		<SETG PRSO <>>
		<V-STAND>)
	       (<VERB? STAND-ON>
		<SETG PRSO <>>
		<V-STAND>)>>

<OBJECT HEAD
	(LOC GLOBAL-OBJECTS)
	(DESC "head" ;"your head")
	(SYNONYM HEAD)
	(OWNER BODY-PART-OWNERS ;PROTAGONIST)
	(FLAGS ;NARTICLEBIT PARTBIT)>

<OBJECT EYES
	(LOC GLOBAL-OBJECTS)
	(DESC ;"your " "eyes")
	(SYNONYM EYE EYES)
	(ADJECTIVE MY MINE ORACLE\'S AMULET\'S FIRST SECOND THIRD FOURTH
	 	   ONE TWO THREE FOUR)
	(OWNER BODY-PART-OWNERS ;PROTAGONIST)
	(FLAGS ;NARTICLEBIT PLURALBIT PARTBIT)
	(ACTION EYES-F)>

<ROUTINE EYES-F ("AUX" WHOSE-EYE)
	 <COND (<ADJ-USED? ,EYES ,W?MY ,W?MINE>
		<SET WHOSE-EYE ,PROTAGONIST>)
	       (<ADJ-USED? ,EYES ,W?ORACLE\'S>
		<SET WHOSE-EYE ,ORACLE-OBJECT>)
	       (<ADJ-USED? ,EYES ,W?AMULET\'S>
		<SET WHOSE-EYE ,AMULET>)
	       (<EQUAL? ,HERE ,ORACLE>
		<SET WHOSE-EYE ,ORACLE-OBJECT>)
	       (<VISIBLE? ,AMULET>
		<SET WHOSE-EYE ,AMULET>)
	       (T
		<SET WHOSE-EYE ,PROTAGONIST>)>
	 <COND (<AND <OR <ADJ-USED? ,EYES ,W?THREE ,W?FOUR>
		     	 <ADJ-USED? ,EYES ,W?THIRD ,W?FOURTH>>
		     <EQUAL? .WHOSE-EYE ,PROTAGONIST>>
		<CANT-SEE ,EYES>)
	       (<VERB? COUNT>
		<COND (<EQUAL? .WHOSE-EYE ,PROTAGONIST>
		       <TELL
"Two, unless you've been careless with pointy sticks lately." CR>)
		      (T
		       <TELL "Four." CR>)>)
	       (<AND <VERB? OPEN CLOSE>
		     <EQUAL? .WHOSE-EYE ,ORACLE-OBJECT ,AMULET>>
		<TELL "There's no way to do that yourself." CR>)
	       (<VERB? CLOSE>
		<PERFORM ,V?SLEEP>
		<RTRUE>)
	       (<VERB? OPEN>
		<TELL "Your eyes ARE open!" CR>)>>

;<OBJECT EARS
	(LOC GLOBAL-OBJECTS)
	(DESC ;"your " "ears")
	(SYNONYM EAR EARS)
	(ADJECTIVE YOUR)
	(OWNER BODY-PART-OWNERS ;PROTAGONIST)
	(FLAGS ;NARTICLEBIT PLURALBIT PARTBIT)>

<OBJECT NOSE
	(LOC GLOBAL-OBJECTS)
	(DESC ;"your " "nose")
	(SYNONYM NOSE NOSTRIL)
	(ADJECTIVE YOUR)
	(OWNER BODY-PART-OWNERS ;PROTAGONIST)
	(FLAGS ;NARTICLEBIT PARTBIT)
	(ACTION NOSE-F)>

<ROUTINE NOSE-F ()
	 <COND (<VERB? PICK>
		<TELL "Oh, gross!" CR>)>>

<OBJECT MOUTH
	(LOC GLOBAL-OBJECTS)
	(DESC ;"your " "mouth")
	(SYNONYM MOUTH)
	(ADJECTIVE YOUR)
	(OWNER BODY-PART-OWNERS ;PROTAGONIST)
	(FLAGS ;NARTICLEBIT PARTBIT)
	(ACTION MOUTH-F)>

<ROUTINE MOUTH-F ()
	 <COND (<AND <VERB? PUT>
		     <PRSI? ,MOUTH>>
		<COND (<PRSO? ,STRAW>
		       <TELL
"Other than perhaps satisfying some primitive phallic urge of yours, this
accomplishes nothing. [If you want to drink something with the straw, just
try DRINK THING WITH STRAW!]" CR>)
		      (T
		       <PERFORM ,V?EAT ,PRSO>
		       <RTRUE>)>)
	       (<VERB? ENTER>
		<TELL "That would involve quite a contortion!" CR>)>>

<OBJECT PROTAGONIST
	(LOC BANQUET-HALL)
	;(SYNONYM PROTAGONIST)
	(DESC "self" ;"it")	;"SWG 4-Oct-88"
	(SIZE 1) ;"since routine WEIGHT adds PROTAGONIST weight to load"
	(FLAGS NDESCBIT ;INVISIBLE ;ACTORBIT TRANSBIT SEARCHBIT
  ;"last BIT added at Stu's suggestion for JESTER, TAKE thing you're holding")>

<END-SEGMENT>
<BEGIN-SEGMENT CASTLE>

<OBJECT ME
	(LOC GLOBAL-OBJECTS)
	(SYNONYM ;I ME MYSELF SELF ;YOU ;YOURSELF)
	(DESC "yourself")
	(FLAGS ;ACTORBIT TOUCHBIT NARTICLEBIT)
	(RESEARCH
"Son of a gun! There's no entry about you! This is one worthless
encyclopedia, huh? Why, you're about as famous as they come! At
least a third of the people in your village have heard of you, for
instance...")
	(ACTION ME-F)>

<END-SEGMENT>
<BEGIN-SEGMENT 0>

<ROUTINE ME-F () 
	 <COND (<VERB? TELL YELL CALL>
		<TELL
"Talking to yourself is a sign of impending mental collapse." CR>
		<STOP>)
	       (<VERB? ALARM>
		<TELL "You are already awake." CR>)
	       (<VERB? EAT>
		<TELL "Auto-cannibalism is not the answer." CR>)
	       (<VERB? EXAMINE>
		<V-DIAGNOSE>)
	       (<AND <VERB? GIVE>
		     <PRSI? ,ME>>
		<PERFORM ,V?TAKE ,PRSO>
		<RTRUE>)
	       (<AND <VERB? SHOW>
		     <PRSI? ,ME>>
		<PERFORM ,V?EXAMINE ,PRSO>
		<RTRUE>)
	       (<VERB? MOVE>
		<V-WALK-AROUND>)
	       (<VERB? SEARCH>
		<V-INVENTORY>
		<RTRUE>)
	       (<VERB? KILL MUNG KICK>
		<COND (<EQUAL? ,P-PRSA-WORD ,W?KILL ,W?MURDER>
		       <JIGS-UP "Done.">)
		      (T
		       <TELL
"[If you're really into masochistic fantasies, perhaps you'd be more
at home playing Infocom's ">
		       <HLIGHT ,H-ITALIC>
		       <TELL "LEATHER GODDESSES OF PHOBOS">
		       <HLIGHT ,H-NORMAL>
		       <TELL " (tm).]" CR>)>)
	       (<VERB? FIND>
		<TELL "You're in" TR ,HERE>)>>

<OBJECT GLOBAL-HERE
	(LOC GLOBAL-OBJECTS)
	(DESC "room")
	(SYNONYM ROOM PLACE LOCATION HALL AREA THERE HERE)
	(ACTION GLOBAL-HERE-F)>

<ROUTINE GLOBAL-HERE-F ()
	 <COND (<VERB? LOOK LOOK-INSIDE EXAMINE>
		<V-LOOK>)
	       (<VERB? ENTER WALK-TO>
		<COND (<EQUAL? ,HERE ,LAKE-FLATHEAD>
		       <PERFORM ,V?SWIM ,LAKE-FLATHEAD>
		       <RTRUE>)
		      (T
		       <TELL ,LOOK-AROUND>)>)
	       (<VERB? LEAVE EXIT>
		<DO-WALK ,P?OUT>)
	       (<VERB? SEARCH>
		<TELL ;,NOTHING-NEW "This reveals nothing new." CR>)
	       (<AND <VERB? PUT PUT-ON>
		     <PRSI? ,GLOBAL-HERE>>
		<COND (<EQUAL? ,P-PRSA-WORD ,W?THROW>
		       <PERFORM ,V?THROW ,PRSO>
		       <RTRUE>)
		      (T
		       <PERFORM ,V?DROP ,PRSO>
		       <RTRUE>)>)>>

<OBJECT GLOBAL-BLDG
	(LOC LOCAL-GLOBALS)
	(DESC "building")
	(SYNONYM BUILDING CLUSTER)
	(ADJECTIVE NEW SMALL STONE IMPRESSIVE)
	(ACTION GLOBAL-BLDG-F)>

<ROUTINE GLOBAL-BLDG-F ()
	 <COND (<AND <VERB? ENTER>
		     <EQUAL? ,HERE ,FISHING-VILLAGE ,WHARF>>
		<DO-WALK ,P?NORTH>)
	       (<VERB? EXIT LEAVE>
		<DO-WALK ,P?OUT>)>>

<OBJECT ARCH
	(LOC LOCAL-GLOBALS)
	(DESC "arch")
	(SYNONYM ARCH ARCHWAY)
	(ADJECTIVE STONE CRUMBLING)
	(FLAGS VOWELBIT)
	(ACTION ARCH-F)>

<ROUTINE ARCH-F ()
	 <COND (<VERB? ENTER>
		<V-WALK-AROUND>)>>

<OBJECT WINDOW
	(LOC LOCAL-GLOBALS)
	(DESC "window")
	(SYNONYM WINDOW WINDOWS GLASS PANE PANES)
	(ADJECTIVE NARROW WIDER SLITTED GLASS BROKEN WINDOW)
	(FLAGS NDESCBIT)
	(ACTION WINDOW-F)>

<ROUTINE WINDOW-F ()
	 <COND (<VERB? LOOK-INSIDE>
		<COND ;(<EQUAL? ,HERE ,GONDOLA>	;"moved to -F"
		       <COND (<EQUAL? ,DIRIGIBLE-COUNTER 0>
			      <TELL "The dirigible is moored in a hangar." CR>)
			     (<EQUAL? ,DESTINATION ,SMALLER-HANGAR>
			      <TELL
<GET ,DIRIGIBLE-TRIP-DESCS <- ,DIRIGIBLE-COUNTER 2>> CR>)
			     (T
			      <TELL
<GET ,DIRIGIBLE-TRIP-DESCS <- 5 ,DIRIGIBLE-COUNTER>> CR>)>)
		      (<EQUAL? ,HERE ,DIMWITS-ROOM ,BASTION ,SOLAR>
		       <TELL
"The window offers a splendid view of the castle grounds." CR>)
		      ;(<EQUAL? ,HERE ,HOTHOUSE>	;"moved to -F"
		       <TELL "You see a ruined castle." CR>)
		      (<EQUAL? ,HERE ,FR-PENTHOUSE ,OFFICES-NORTH
			       ,OFFICES-SOUTH ,OFFICES-EAST ,OFFICES-WEST>
		       <COND (<OR <EQUAL? ,HERE ,FR-PENTHOUSE>
				  <G? ,FLOOR-NUMBER 20>>
			      <PRINT "You can't see much">
			      <TELL "; the air is pretty smoggy today." CR>)
			     (T
		       	      <TELL
"The window offers a good view of Flatheadia." CR>)>) 
		      (T
		       <TELL "Bug 29." CR>)>)
	       (<VERB? OPEN CLOSE>
		<COND ;(<EQUAL? ,HERE ,HOTHOUSE>	;"moved to -F"
		       <TELL "There's not much left of the windows." CR>)
		      (<EQUAL? ,HERE ,DIMWITS-ROOM ,BASTION ,SOLAR>
		       <TELL
"The window is just a narrow slit in the stone wall; there's no way
to open or close it." CR>)
		      (T
		       <TELL "The window is unopenable." CR>)>)
	       (<VERB? ENTER EXIT LEAP-OFF>
		<COND ;(<EQUAL? ,HERE ,HOTHOUSE>	;"moved to -F"
		       <TELL
"You cut yourself to ribbons on the broken glass." CR>)
		      (<EQUAL? ,HERE ,DIMWITS-ROOM ,BASTION ,SOLAR>
		       <TELL
"These slitted windows are narrower than your body." CR>)
		      (T
		       <DO-FIRST "open" ,WINDOW>)>)
	       (<VERB? PUT-THROUGH>
		<COND (<EQUAL? ,HERE ,HOTHOUSE ,DIMWITS-ROOM ,SOLAR ,BASTION>
		       <REMOVE ,PRSO>
		       <PRINT "You hear a \"splat\" as">
		       <TELL T ,PRSO " sinks into the ">
		       <COND (<EQUAL? ,HERE ,HOTHOUSE>
			      <COND (<OR <PRSO? ,PERCH>
					 <ULTIMATELY-IN? ,PERCH ,PRSO>>
				     <SETG REMOVED-PERCH-LOC ,WATER>)>
			      <TELL "swamp outside">)
			     (T
			      <COND (<OR <PRSO? ,PERCH>
					 <ULTIMATELY-IN? ,PERCH ,PRSO>>
				     <SETG REMOVED-PERCH-LOC ,GROUND>)>
			      <TELL"ground far below">)>
		       <TELL ,PERIOD-CR>)
		      (T
		       <DO-FIRST "open" ,WINDOW>)>)
	       ;(<AND <VERB? EXAMINE>	;"moved to -F"
		     <EQUAL? ,HERE ,HOTHOUSE>>
		<TELL "Many of the window panes are shattered." CR>)>>

<OBJECT LOCK-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "lock")
	(SYNONYM LOCK KEYHOLE HOLE)
	(ADJECTIVE LARGE BASIC COMBINATION KEY)
	(ACTION LOCK-OBJECT-F)>

<ROUTINE LOCK-OBJECT-F ()
	 <COND (<AND <NOUN-USED? ,LOCK-OBJECT ,W?KEYHOLE>
		     <EQUAL? ,HERE ,LOWEST-HALL>>
		<CANT-SEE ,LOCK-OBJECT>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,LOWEST-HALL>
		       <TELL "It's a large combination dial lock." CR>)
		      (T
		       <TELL "It's your basic keyhole lock." CR>)>)
	       (<VERB? LOOK-INSIDE>
		<TELL "You see">
		<PRINT " nothing of interest">
		<TELL ", you shameless Peeping Tom you." CR>)
	       (<VERB? PICK>
		<TELL "You have neither the tools nor the expertise." CR>)
	       (<AND <VERB? OPEN UNLOCK LOCK>
		     <PRSO? ,LOCK-OBJECT>>
		<COND (<GLOBAL-IN? ,EAST-DOOR ,HERE>
		       <PERFORM-PRSA ,EAST-DOOR ,PRSI>)
		      (<GLOBAL-IN? ,WEST-DOOR ,HERE>
		       <PERFORM-PRSA ,WEST-DOOR ,PRSI>)
		      (<GLOBAL-IN? ,VAULT-DOOR ,HERE>
		       <PERFORM-PRSA ,VAULT-DOOR ,PRSI>)
		      (<EQUAL? ,HERE ,ATTIC>
		       <PERFORM-PRSA ,TRUNK ,PRSI>)>)>>

<OBJECT SIGN
	(LOC LOCAL-GLOBALS)
	(DESC "sign")
	(SYNONYM SIGN)
	(ADJECTIVE LARGE EYE-CATCHING)
	(FLAGS READBIT)
	;(ACTION SIGN-F)>

;<ROUTINE SIGN-F ("AUX" NUM)	;"moved to -F"
	 <COND (<VERB? READ EXAMINE>
		<COND (<EQUAL? ,HERE ,EXIT>
		       <TELL
"\"ROCKVILLE ESTATES: The new, prestigious address for the discriminating
Young Underground Professional|
64 units, Occupancy Spring 881|
Frobozz Magic Construction Company|
Quizbo Frotzwit, Managing Foreman\"" CR>)
		      (<EQUAL? ,HERE ,CROSSROADS>
		       <TELL
"\"JUNCTION of GUH-90 and GUH-95|
NORTH: Flatheadia, 1 bloit|
SOUTH: Shadowland, 15 bloits|
       Royal Museum, 17 bloits|
       Fublio Valley, 90 bloits|
EAST:  White Cliffs Beach, 4 bloits|
       Flood Control Dam #3, 4 bloits|
       Aragain Falls, 5 bloits|
WEST:  Port Foozle, 9 bloits|
       Quilbozza Beach, 9 bloits\"" CR>)
		      (<EQUAL? ,HERE ,FISHING-VILLAGE>
		       <TELL "\"Sinners: Enter here for purification!\"" CR>)
		      (<EQUAL? ,HERE ,INQUISITION>
		       <TELL
"\"Sinners, take note!|
1. We cannot execute everyone at once! Please take a number!|
2. Everyone is permitted a final request.|
3. Tell the executioner your request when your number is called.|
4. If we cannot grant your final wish, we shall be quick and merciful. We
will behead you.|
5. If we CAN grant your final wish, we will hang you. Please note that this
is slow and excruciatingly painful.\"" CR>)
		      (<EQUAL? ,HERE ,NORTH-OF-ANTHAR>
		       <TELL
"\"We've got as many refugees from the Eastlands as we can handle!
Go somewhere else!\"" CR>)
		      (<EQUAL? ,HERE ,MINE-ENTRANCE>
		       <TELL "\"Warning! Falling rock zone!\"" CR>)
		      (<EQUAL? ,HERE ,TOLL-PLAZA>
		       <TELL
"\"Exact Change Only: 1 Zorkmid (coins only).\" Below
the sign is a basket." CR>)
		      (<EQUAL? ,HERE ,OUTSIDE-HOVEL>
		       <TELL "\"Korboz the Magnificent\"" CR>)
		      (<EQUAL? ,HERE ,OUTSIDE-SHACK>
		       <TELL
"\"Warning! This shack is protected against looting by powerful magic!\"" CR>)
		      (<EQUAL? ,HERE ,WARNING-ROOM>
		       <TELL
"\"Warning! This area is populated by three races: the Veritassi (who always
tell the truth), the Prevaricons (who always lie), and the Wishyfoo (who
alternate with every statement). Be aware that visitors to Veritass and
Prevaricon areas are immediately fed to ravenous hellhounds.\"" CR>)
		      (T
		       <TELL "Bug 49">)>)>>

<OBJECT STAIRS
	(LOC LOCAL-GLOBALS)
	(DESC "stair")
	(SYNONYM FLIGHT STAIR STAIRS STAIRWAY STEP STEPS STAIRCASE GANGWAY)
	(ADJECTIVE STEEP OMINOUS DARK WIDE STONE CIRCULAR WINDING SPIRAL
	 	   COBWEBBY CRUDE FORBIDDING DECREPIT)
	(ACTION STAIRS-F)>

<ROUTINE STAIRS-F ()
	 <COND (<AND <EQUAL? ,HERE ,NORTH-SHORE ,EAST-SHORE
			     	   ,SOUTH-SHORE ,WEST-SHORE>
		     <NOT <IN? ,PROTAGONIST ,YACHT>>>
		<CANT-SEE ,STAIRS>)
	       (<VERB? CLIMB CLIMB-UP>
		<DO-WALK ,P?UP>)
	       (<VERB? CLIMB-DOWN>
		<DO-WALK ,P?DOWN>)>>

<OBJECT FIXED-LADDER
	(LOC LOCAL-GLOBALS)
	(DESC "ladder")
	(SYNONYM LADDER)
	(ADJECTIVE RICKETY)
	(ACTION FIXED-LADDER-F)>

<ROUTINE FIXED-LADDER-F ()
	 <COND (<VERB? CLIMB CLIMB-UP>
		<DO-WALK ,P?UP>)
	       (<VERB? CLIMB-DOWN>
		<DO-WALK ,P?DOWN>)
	       (<VERB? TAKE>
		<TELL "The ladder is attached to the wall." CR>)>>

<OBJECT BONES
	(LOC LOCAL-GLOBALS)
	(OWNER BONES)
	(DESC "pile of old bones")
	(SYNONYM BONE BONES PILE CREATURE ADVENTURER SKELETON SKELETONS)
	(ADJECTIVE ADVENTURER CREATURE OLD)
	(FLAGS NDESCBIT)
	(ACTION BONES-F)>

<ROUTINE BONES-F ()
	 <COND (<TOUCHING? ,BONES>
		<TELL "Let the dead lie in peace." CR>)>>

;"status line stuff"

;<CONSTANT S-TEXT 0>       ;"<SCREEN 0> puts cursor in text part of screen"
;<CONSTANT S-WINDOW 1>     ;"<SCREEN 1> puts cursor in window part of screen"
;<CONSTANT H-NORMAL 0>     ;"<HLIGHT 0> returns printing to normal (default)"
;<CONSTANT H-INVERSE 1>    ;"<HLIGHT 1> sets printing mode to inverse video"
;<CONSTANT H-BOLD 2>      ;"<HLIGHT 2> sets printing mode to bold, else normal"
;<CONSTANT H-ITALIC 4>    ;"<HLIGHT 4> italicizes, else underline, else normal"
;<CONSTANT D-SCREEN-ON 1> ;"<DIROUT 1> turns on printing to the screen"
;<CONSTANT D-SCREEN-OFF -1>;"<DIROUT -1> turns off printing to the screen"
;<CONSTANT D-PRINTER-ON 2> ;"<DIROUT 2> turns on printing to the printer"
;<CONSTANT D-PRINTER-OFF -2>;"<DIROUT -2> turns off printing to the printer"
;<CONSTANT D-TABLE-ON 3>   ;"<DIROUT 3 .TABLE> turns on printing to that table"
;<CONSTANT D-TABLE-OFF -3> ;"<DIROUT -3> turns off printing to that table"
;<CONSTANT D-RECORD-ON 4>  ;"<DIROUT 4> sends READs and INPUTs to record file"
;<CONSTANT D-RECORD-OFF -4>;"<DIROUT -4> stops sending READ and INPUT to file"

<ROUTINE CLEAR-BORDER ("AUX" X Y WRD)
	 <SCREEN ,S-WINDOW>
	 <COLOR ,FG-COLOR ,BG-COLOR> ;"clear to match text window"
	 <PICINF-PLUS-ONE ,TEXT-WINDOW-PIC-LOC>
   	 <SET Y <ZGET ,PICINF-TBL 0>>
   	 <SET X <ZGET ,PICINF-TBL 1>>
   	 <WINPOS ,S-WINDOW 1 1>
   	 <WINSIZE ,S-WINDOW .Y <LOWCORE HWRD>>
   	 <CLEAR 1>
   	 <COND (<G? .X 1>
		<WINPOS ,S-WINDOW <+ .Y 1> 1>
		<WINSIZE ,S-WINDOW <- <LOWCORE VWRD> .Y> <- .X 1>>
		<CLEAR 1>
		<WINPOS ,S-WINDOW <+ .Y 1> <+ <- <LOWCORE HWRD> .X> 1>>
		<WINSIZE ,S-WINDOW <- <LOWCORE VWRD> .Y> .X>
		<CLEAR 1>)>
	 <SETG SL-SCORE -1>
   	 <SETG OLD-REGION <>>
   	 <SETG OLD-HERE <>>
   	 <SETG COMPASS-CHANGED T>
	 <COLOR ,DEFAULT-FG ,DEFAULT-BG>
	 <SCREEN ,S-TEXT>>

; "Make text window extend to bottom of screen (more or less) or to
   top of bottom edge of border, depending..."
<ROUTINE ADJUST-TEXT-WINDOW (ID "AUX" (SCRY <LOWCORE VWRD>) WINY (ADJ 0))
	 <COND (.ID
		<PICINF .ID ,PICINF-TBL>
		<SET ADJ <ZGET ,PICINF-TBL 0>>)>
	 <SET WINY <- .SCRY <- <WINGET ,S-TEXT ,WTOP> 1> .ADJ>>
	 <SET WINY <* ,FONT-Y </ .WINY ,FONT-Y>>>
	 <WINSIZE ,S-TEXT .WINY <WINGET ,S-TEXT ,WWIDE>>>

;"Normal sizes/positions of windows 0 and 1."
<ROUTINE SPLIT-BY-PICTURE (ID "OPT" (CLEAR-SCREEN? <>) "AUX" Y X YS XS)
	 <SETG CURRENT-SPLIT .ID>
	 <COND (.CLEAR-SCREEN?
		<CLEAR -1>)>
	 <PICINF .ID ,PICINF-TBL>
	 <WINPOS ,S-TEXT <+ <SET Y <ZGET ,PICINF-TBL 0>> 1>
		 <COND (<AND <NOT ,BORDER-ON>
			     <EQUAL? .ID ,TEXT-WINDOW-PIC-LOC>>
			1)
		       (T
			<+ <SET X <ZGET ,PICINF-TBL 1>> 1>)>>
	 <WINSIZE ,S-TEXT <- <LOWCORE VWRD> .Y>
		  <COND (<AND <NOT ,BORDER-ON>
			      <EQUAL? .ID ,TEXT-WINDOW-PIC-LOC>>
			 <* ,WIDTH ,FONT-X>)
			(T
			 <- <LOWCORE HWRD> <* .X 2>>)>>
	 <WINPOS ,S-WINDOW 1 1>
	 <WINSIZE ,S-WINDOW .Y <LOWCORE HWRD>>>

<CONSTANT SL-LOC-TBL
	  <TABLE 0 0 ;HERE-LOC
		 0 0 ;REGION-LOC
		 0 0 ;COMPASS-PIC-LOC
		 0 0 ;U-BOX-LOC
		 0 0 ;D-BOX-LOC
		 0 0 ;ICON-OFFSET>>

<ROUTINE INIT-SL-WITH-SPLIT (WHICH "OPT" (DONT-CLEAR <>) "AUX" YFUDGE)
    ;<COND (.DONT-CLEAR
	   <SET YFUDGE <- <WINGET ,S-TEXT ,WHIGH> <WINGET ,S-TEXT ,WYPOS>>>)>
    <COND (.WHICH
	   <SETG CURRENT-SPLIT .WHICH>)>
    <INIT-STATUS-LINE .DONT-CLEAR>
    ;<COND (.DONT-CLEAR
	   <CURSET <- <WINGET ,S-TEXT ,WHIGH> .YFUDGE> 1>)>>

<ROUTINE INIT-STATUS-LINE ("OPT" (DONT-CLEAR <>) "AUX" (NUM 1) X Y)
	 <SETG OLD-HERE <>>
	 <SETG OLD-REGION <>>
	 <SETG SL-SCORE -1>
	 <SETG COMPASS-CHANGED T>
	 <SETG NEW-COMPASS T>
	 <COND (<NOT .DONT-CLEAR>
		<CLEAR -1>)>
	 <SPLIT-BY-PICTURE ,CURRENT-SPLIT>
	 <COND (<EQUAL? ,CURRENT-SPLIT ,TEXT-WINDOW-PIC-LOC>
		<ADJUST-TEXT-WINDOW 0>)
	       (<EQUAL? ,CURRENT-SPLIT ,F-SPLIT>
		<ADJUST-TEXT-WINDOW ,F-BOTTOM>
		<RTRUE>)
	       (T
		<ADJUST-TEXT-WINDOW ,PBOZ-BOTTOM>
		<RTRUE>)>
	 <COND (,BORDER-ON
		<SCREEN ,S-FULL>
		<SETG CURRENT-BORDER <SET-BORDER>>
		<DISPLAY-BORDER ,CURRENT-BORDER>
		<PICSET ,COMPASS-PICSET-TBL>
		<REPEAT ((BIT 64))
			<COND (<L? <SET BIT <- .BIT 1>> ,LOW-DIRECTION>
			       <RETURN>)
			      (T
			       <FCLEAR ,ROOMS <- 64 .BIT>>)>>
		<SCREEN ,S-WINDOW>)
	       (T
		<SCREEN ,S-WINDOW>
		<INVERSE-LINE 1>
		<INVERSE-LINE 2>
		<INVERSE-LINE 3>)> 
	 <FONT 4> ;"non-proportional"
	 <SETG FONT-X <LOWCORE (FWRD 1)>>
	 <CURSET <+ <GET ,SL-LOC-TBL 0> ,FONT-Y> <GET ,SL-LOC-TBL 1>>
	 <COND (<AND <EQUAL? <LOWCORE INTID> ,IBM>
		     <NOT <FLAG-ON? ,F-COLOR>>>
		<HLIGHT ,H-INVERSE>)
	       (,BORDER-ON
		<COLOR ,DEFAULT-FG -1>)
	       (T
		<HLIGHT ,H-INVERSE>)>
	 <TELL "Moves:">
	 <CURSET <+ <GET ,SL-LOC-TBL 2> ,FONT-Y> <- <GET ,SL-LOC-TBL 3> <* ,FONT-X 10>>>
	 <TELL "Score:">
	 <COND (<AND <EQUAL? <LOWCORE INTID> ,IBM>
		     <NOT <FLAG-ON? ,F-COLOR>>>
		<HLIGHT ,H-NORMAL>)
	       (,BORDER-ON
		<COLOR ,DEFAULT-FG ,DEFAULT-BG>)
	       (T
		<HLIGHT ,H-NORMAL>)>
	 <FONT 1> ;"proportional"
	 <SCREEN ,S-TEXT>
	 <RFALSE>>

<BEGIN-SEGMENT HINTS>

<ROUTINE DISPLAY-BORDER (B "AUX" BL BR Y X)
	 <SETG NEW-COMPASS T>
	 <DISPLAY .B 1 1>
	 <PICINF .B ,PICINF-TBL>
	 <SET Y <GET ,PICINF-TBL 0>>
	 <SET X <GET ,PICINF-TBL 1>>
	 <COND (<EQUAL? .B ,OUTSIDE-BORDER>
		<SET BL ,OUTSIDE-BORDER-L>
		<SET BR ,OUTSIDE-BORDER-R>)
	       (<EQUAL? .B ,CASTLE-BORDER>
		<SET BL ,CASTLE-BORDER-L>
		<SET BR ,CASTLE-BORDER-R>)
	       (<EQUAL? .B ,UNDERGROUND-BORDER>
		<SET BL ,UNDERGROUND-BORDER-L>
		<SET BR ,UNDERGROUND-BORDER-R>)
	       (<EQUAL? .B ,HINT-BORDER>
		<SET BL ,HINT-BORDER-L>
		<SET BR ,HINT-BORDER-R>)>
	 <COND (<PICINF .BL ,PICINF-TBL>
		<DISPLAY .BL <+ 1 .Y> 1>)>
	 <COND (<PICINF .BR ,PICINF-TBL>
		<DISPLAY .BR <+ 1 .Y> <+ 1 <- .X <GET ,PICINF-TBL 1>>>>)>
	 .B>

<END-SEGMENT>

<BEGIN-SEGMENT 0>

<ROUTINE SET-BORDER ()
	 <COND (<AND <EQUAL? ,HERE ,GONDOLA>
		     <G? ,DIRIGIBLE-COUNTER 0>>
		<RETURN ,OUTSIDE-BORDER>)
	       (<EQUAL? ,HERE ,FORMAL-GARDEN ,COURTYARD>
		<RETURN ,CASTLE-BORDER>)
	       (<EQUAL? ,HERE ,BARBICAN ,UPPER-BARBICAN ,GARRISON>
		<RETURN ,OUTSIDE-BORDER>)
	       (<FSET? ,HERE ,OUTSIDEBIT>
		<RETURN ,OUTSIDE-BORDER>)
	       (<FSET? ,HERE ,UNDERGROUNDBIT>
		<RETURN ,UNDERGROUND-BORDER>)
	       (T
		<RETURN ,CASTLE-BORDER>)>>

<CONSTANT SLINE <ITABLE NONE 41 ;82>>

<GLOBAL OLD-HERE <>> ;"is set to present HERE room."

<GLOBAL OLD-REGION <>>

<GLOBAL SL-SCORE -1> ;"if start at 0, STATUS-LINE never puts up the 0"

<GLOBAL WIDTH 0>

<GLOBAL COMPASS-CHANGED T>

<CONSTANT TITLE-SCREEN-PICTURE 1>

<GLOBAL ACTIVE-MOUSE <>>

<GLOBAL CURRENT-SPLIT <>> ;"set to TEXT-WINDOW-PIC-LOC in GO"
;"tells REFRESH etc. whether the screen is normal, a jester game, or whatever"

<ROUTINE BLANK-IT (TBL-SLOT COLS "AUX" (NCOLS 0) X)
	<COND (<L? .COLS 0>
	       <SET NCOLS <- 0 .COLS>>)>
	<SET X <- <GET ,SL-LOC-TBL .TBL-SLOT> <* ,FONT-X .NCOLS>>>
	<CURSET <GET ,SL-LOC-TBL <- .TBL-SLOT 1>> .X>
	<PRINT-SPACES <ABS .COLS>>
	.X>

<ROUTINE DRAW-NEW-HERE ("AUX" X)
	 <SETG OLD-HERE ,HERE>
	 <CURSET <GET ,SL-LOC-TBL 0>
		 <BLANK-IT 1 <COND (,NARROW? 18) (T 24)>>>
	 <COND (<AND <OR ,NARROW?
			 <EQUAL? ,HERE ,PHIL-HALL>>
		     <SET X <GETP ,HERE ,P?APPLE-DESC>>>
		<TELL .X>)
	       (<EQUAL? ,HERE ,G-U-MOUNTAIN ,G-U-SAVANNAH ,G-U-HIGHWAY>
		<TELL "Great Undergd. ">
		<COND (<EQUAL? ,HERE ,G-U-MOUNTAIN>
		       <TELL "Mountain">)
		      (<EQUAL? ,HERE ,G-U-SAVANNAH>
		       <TELL "Savannah">)
		      (T
		       <TELL "Highway">)>)
	       (T
		<PRINTD ,HERE>)>>

<ROUTINE DRAW-NEW-REGION ()
	 <SETG OLD-REGION <GETP ,HERE ,P?REGION>>
	 <DIROUT ,D-TABLE-ON ,SLINE>	;"start printing to buffer"
	 <PUT ,SLINE 0 0>
	 <TELL ,OLD-REGION>
	 <DIROUT ,D-TABLE-OFF>
	 <BLANK-IT 3 <COND (,NARROW? -19) (T -23)>>
	 ;"longest region on Apple is FRIGID RIVER VALLEY"
	 <CURSET <GET ,SL-LOC-TBL 2>
		 <- <GET ,SL-LOC-TBL 3> <* ,FONT-X <GET ,SLINE 0>>>>
	 <TELL ,OLD-REGION>>

<ROUTINE DRAW-NEW-SCORE ("AUX" Y X)
	 <SETG SL-SCORE ,SCORE>
	 <SET Y <+ <GET ,SL-LOC-TBL 2> ,FONT-Y>>
	 <SET X <GET ,SL-LOC-TBL 3>>
	 <CURSET .Y <- .X <* ,FONT-X 4>>>
	 <PRINT-SPACES 4>
	 <CURSET .Y <- .X <* ,FONT-X <COND (<OR <G? ,SCORE 999>
						<L? ,SCORE -99>> 4)
					   (<OR <G? ,SCORE 99>
						<L? ,SCORE -9>> 3)
					   (<OR <G? ,SCORE 9>
						<L? ,SCORE 0>> 2)
					   (T 1)>>>>
	 <PRINTN ,SCORE>>

<CONSTANT COMPASS-PICSET-TBL
	<PTABLE N-HL NE-HL E-HL SE-HL S-HL SW-HL W-HL NW-HL
	       N-UNHL NE-UNHL E-UNHL SE-UNHL S-UNHL SW-UNHL W-UNHL NW-UNHL
	       U-BOX D-BOX CASTLE-BOX-COVER UG-BOX-COVER OUTSIDE-BOX-COVER 0>>

<GLOBAL NEW-COMPASS T>			;"If true, force every portion of compass
					  to be drawn, ignoring flags saved in ROOMS.
					  Start out with it true, of course."

<ROUTINE DRAW-NEW-COMP ()
	 <SETG COMPASS-CHANGED <>>
	 <DRAW-COMPASS-ROSE ,P?NORTH ,N-HL ,N-UNHL>
	 <DRAW-COMPASS-ROSE ,P?NE ,NE-HL ,NE-UNHL>
	 <DRAW-COMPASS-ROSE ,P?EAST ,E-HL ,E-UNHL>
	 <DRAW-COMPASS-ROSE ,P?SE ,SE-HL ,SE-UNHL>
	 <DRAW-COMPASS-ROSE ,P?SOUTH ,S-HL ,S-UNHL>
	 <DRAW-COMPASS-ROSE ,P?SW ,SW-HL ,SW-UNHL>
	 <DRAW-COMPASS-ROSE ,P?WEST ,W-HL ,W-UNHL>
	 <DRAW-COMPASS-ROSE ,P?NW ,NW-HL ,NW-UNHL>
	 <COND (<AND ,LIT <SHOW-DIRECTION? ,HERE ,P?UP <>>>
		<COND (<NOT <FSET? ,ROOMS <- 64 ,P?UP>>>
		       <FSET ,ROOMS <- 64 ,P?UP>>
		       <DISPLAY ,U-BOX <GET ,SL-LOC-TBL 6> <GET ,SL-LOC-TBL 7>>)>)
	       (<FSET? ,ROOMS <- 64 ,P?UP>>
		<FCLEAR ,ROOMS <- 64 ,P?UP>>
		<DISPLAY <COND (<EQUAL? ,CURRENT-BORDER ,CASTLE-BORDER>
				,CASTLE-BOX-COVER)
			       (<EQUAL? ,CURRENT-BORDER ,OUTSIDE-BORDER>
				,OUTSIDE-BOX-COVER)
			       (T
				,UG-BOX-COVER)>
			 <GET ,SL-LOC-TBL 6> <GET ,SL-LOC-TBL 7>>)>
	 <COND (<AND ,LIT <SHOW-DIRECTION? ,HERE ,P?DOWN <>>>
		<COND (<OR ,NEW-COMPASS <NOT <FSET? ,ROOMS <- 64 ,P?DOWN>>>>
		       <FSET ,ROOMS <- 64 ,P?DOWN>>
		       <DISPLAY ,D-BOX <GET ,SL-LOC-TBL 8> <GET ,SL-LOC-TBL 9>>)>)
	       (<OR ,NEW-COMPASS <FSET? ,ROOMS <- 64 ,P?DOWN>>>
		<FCLEAR ,ROOMS <- 64 ,P?DOWN>>
		<DISPLAY <COND (<EQUAL? ,CURRENT-BORDER ,CASTLE-BORDER>
				,CASTLE-BOX-COVER)
			       (<EQUAL? ,CURRENT-BORDER ,OUTSIDE-BORDER>
				,OUTSIDE-BOX-COVER)
			       (T
				,UG-BOX-COVER)>
			 <GET ,SL-LOC-TBL 8> <GET ,SL-LOC-TBL 9>>)>
	 <SETG NEW-COMPASS <>>>

<ROUTINE DRAW-COMPASS-ROSE (DIR HIGHLIGHT-PIC UNHIGHLIGHT-PIC
			    "OPTIONAL" (MAPPING <>)
			    "AUX" (BIT <- 64 .DIR>) X Y)
	 <COND (.MAPPING
		<SET Y <GET ,PICINF-TBL 0>>
		<SET X <GET ,PICINF-TBL 1>>)
	       (T
		<SET Y <GET ,SL-LOC-TBL 4>>
		<SET X <GET ,SL-LOC-TBL 5>>)>
	 <COND (<AND ,LIT <SHOW-DIRECTION? ,HERE .DIR <>>>
		<COND (<OR ,NEW-COMPASS <FSET? ,ROOMS .BIT>>
		       <FCLEAR ,ROOMS .BIT>
		       <DISPLAY .HIGHLIGHT-PIC .Y .X>)>)
	       (T
		<COND (<OR ,NEW-COMPASS <NOT <FSET? ,ROOMS .BIT>>>
		       <FSET ,ROOMS .BIT>
		       <DISPLAY .UNHIGHLIGHT-PIC .Y .X>)>)>>

<ROUTINE SHOW-DIRECTION? (RM DIR "OPTIONAL" (MAPPING T) "AUX" PTS)
	 <COND (<AND <IN? ,N-S-PASSAGE .RM>
		     <NOT <EQUAL? .RM ,CONSTRUCTION>>
		     <EQUAL? ,N-S-PASSAGE-DIR .DIR>>
		<RTRUE>)
	       (<AND <IN? ,NW-SE-PASSAGE .RM>
		     <NOT <EQUAL? .RM ,CONSTRUCTION>>
		     <EQUAL? ,NW-SE-PASSAGE-DIR .DIR>>
		<RTRUE>)
	       (<AND <IN? ,PROTAGONIST ,YACHT>
		     <EQUAL? .DIR ,P?DOWN>>
		<RTRUE>)
	       (<AND <EQUAL? .RM ,INQUISITION>
		     <EQUAL? .DIR ,P?SOUTH>>
		<RTRUE>)
	       (<AND <==? .RM ,RUBBLE-ROOM>
		     <EQUAL? .DIR ,P?NORTH ,P?EAST>
		     <FSET? ,RUBBLE-ROOM ,TOUCHBIT>
		     <FSET? ,HEART-OF-MINE ,TOUCHBIT>>
		; "Has special connector already drawn"
		<RFALSE>)
	       (<AND <==? .RM ,HEART-OF-MINE>
		     <EQUAL? .DIR ,P?WEST ,P?SOUTH>
		     <FSET? ,RUBBLE-ROOM ,TOUCHBIT>
		     <FSET? ,HEART-OF-MINE ,TOUCHBIT>>
		<RFALSE>)
	       (<FSET? .RM ,DELTABIT>
		<COND (<EQUAL? .DIR ,P?UP ,P?DOWN>
		       <RFALSE>)
		      (<AND <EQUAL? .RM ,DELTA-1>
			    <EQUAL? .DIR ,P?SOUTH>
			    .MAPPING> ;"interferes with FROM ORACLE arrow"
		       <RFALSE>)
		      (T
		       <RTRUE>)>)
	       (<EQUAL? .RM ,CONSTRUCTION>
		<COND (<EQUAL? .DIR ,P?UP ,P?DOWN>
		       <RFALSE>)
		      (<OR
			<AND <EQUAL? .DIR ,P?NORTH>
			     <INTBL? ,CONSTRUCTION-LOC ,NORTH-EXITS 11>>
			<AND <EQUAL? .DIR ,P?NE>
			     <INTBL? ,CONSTRUCTION-LOC ,NE-EXITS 17>>
			<AND <EQUAL? .DIR ,P?EAST>
			     <INTBL? ,CONSTRUCTION-LOC ,EAST-EXITS 15>>
			<AND <EQUAL? .DIR ,P?SE>
			     <INTBL? ,CONSTRUCTION-LOC ,SE-EXITS 7>>
			<AND <EQUAL? .DIR ,P?SOUTH>
			     <INTBL? <+ ,CONSTRUCTION-LOC 8> ,NORTH-EXITS 11>>
			<AND <EQUAL? .DIR ,P?SW>
			     <INTBL? <+ ,CONSTRUCTION-LOC 7> ,NE-EXITS 17>>
			<AND <EQUAL? .DIR ,P?WEST>
			     <INTBL? <- ,CONSTRUCTION-LOC 1> ,EAST-EXITS 15>>
			<AND <EQUAL? .DIR ,P?NW>
			     <INTBL? <- ,CONSTRUCTION-LOC 9> ,SE-EXITS 7>>
			<AND <EQUAL? .DIR ,P?EAST>
			     <EQUAL? ,CONSTRUCTION-LOC 47>>>
		       <RTRUE>)
		      (<AND <IN? ,N-S-PASSAGE .RM>
			    <NOT <FSET? ,N-S-PASSAGE ,TAKEBIT>>
			    <EQUAL? .DIR ,P?NORTH ,P?SOUTH>>
		       <COND (<AND <EQUAL? ,CONSTRUCTION-LOC ,N-S-PASSAGE-LOC>
			      	   <EQUAL? ,N-S-PASSAGE-DIR .DIR>>
			      <RTRUE>)
			     (<AND <NOT <EQUAL? ,CONSTRUCTION-LOC
						,N-S-PASSAGE-LOC>>
			      	   <NOT <EQUAL? ,N-S-PASSAGE-DIR .DIR>>>
			      <RTRUE>)
			     (T
			      <RFALSE>)>)
		      (<AND <IN? ,NW-SE-PASSAGE .RM>
			    <NOT <FSET? ,NW-SE-PASSAGE ,TAKEBIT>>
			    <EQUAL? .DIR ,P?NW ,P?SE>>
		       <COND (<AND <EQUAL? ,CONSTRUCTION-LOC
					   ,NW-SE-PASSAGE-LOC>
			      	   <EQUAL? ,NW-SE-PASSAGE-DIR .DIR>>
			      <RTRUE>)
			     (<AND <NOT <EQUAL? ,CONSTRUCTION-LOC
						,NW-SE-PASSAGE-LOC>>
			      	   <NOT <EQUAL? ,NW-SE-PASSAGE-DIR .DIR>>>
			      <RTRUE>)
			     (T
			      <RFALSE>)>)
		      (T
		       <RFALSE>)>)
	       (<EQUAL? .RM ,PLAIN>
		<COND (<EQUAL? .DIR ,P?UP ,P?DOWN>
		       <RFALSE>)
		      (<OR <AND <EQUAL? .DIR ,P?NORTH ,P?NE ,P?NW>
				<EQUAL? ,RANK 1>>
			   <AND <EQUAL? .DIR ,P?EAST ,P?NE ,P?SE>
				<EQUAL? ,FILE 8>>
			   <AND <EQUAL? .DIR ,P?SOUTH ,P?SE ,P?SW>
				<EQUAL? ,RANK 8>>
			   <AND <EQUAL? .DIR ,P?WEST ,P?SW ,P?NW>
				<EQUAL? ,FILE 1>>>
		       <RFALSE>)
		      (T
		       <RTRUE>)>)
	       (<AND <EQUAL? .RM ,MIRROR-LAKE>
		     <EQUAL? .DIR ,P?NORTH ,P?SOUTH ,P?EAST ,P?WEST>>
		<RTRUE>)
	       (<AND <EQUAL? .RM ,WISHYFOO-TERRITORY>
		     <EQUAL? .DIR ,P?SW>
		     <NOT .MAPPING>>
		<RTRUE>)
	       (<AND <EQUAL? .RM ,STREAM>
		     <EQUAL? .DIR ,P?WEST>
		     <NOT <IN? ,BRIDGE ,STREAM>>>
		<RFALSE>)
	       (<AND <SET PTS <GETPT .RM .DIR>>
		     <NOT <EQUAL? <PTSIZE .PTS> ,NEXIT>>>
		<COND (<AND <EQUAL? .RM ,THRONE-ROOM>
			    <EQUAL? .DIR ,P?SOUTH>
	       	    	    <NOT ,SECRET-PASSAGE-OPEN>>
		       <RFALSE>)
		      (<AND <EQUAL? .RM ,G-U-MOUNTAIN>
			    <EQUAL? .DIR ,P?NORTH>
			    <IN? ,BOULDER .RM>>
		       <RFALSE>)
		      (<AND <EQUAL? .RM ,HOLLOW>
			    <EQUAL? .DIR ,P?SOUTH>
			    <NOT ,IRON-MINE-OPEN>>
		       <RFALSE>)
		      (<AND <EQUAL? .RM ,PEG-ROOM>
			    <EQUAL? .DIR ,P?NORTH>
			    <NOT ,PEG-PASSAGE-OPENED>>
		       <RFALSE>)
		      (<AND <EQUAL? .RM ,CRYPT>
			    <EQUAL? .DIR ,P?DOWN>
			    <NOT ,SEEN-HOLEY-SLAB>>
		       <RFALSE>)
		      (<AND <EQUAL? .RM ,RUINED-HALL>
			    <EQUAL? .DIR ,P?EAST>
			    <NOT ,SECRET-ROOM-REVEALED>>
		       <RFALSE>)
		      (<AND <EQUAL? .RM ,MARSH>
			    <EQUAL? .DIR ,P?NORTH>
			    <NOT ,STEPPING-STONES-VISIBLE>>
		       <RFALSE>)
		      (<AND <EQUAL? .RM ,WEIRD>
			    <EQUAL? .DIR ,P?NORTH ,P?EAST ,P?WEST>>
		       <COND (<EQUAL? .DIR ,P?NORTH>
			      <COND (<EQUAL? ,TOWER-BEATEN ,PYRAMID>
				     <RTRUE>)
				    (<AND <FSET? ,PYRAMID ,TOUCHBIT>
					  .MAPPING>
				     <RTRUE>)
				    (T
				     <RFALSE>)>)
			     (<EQUAL? .DIR ,P?EAST>
			      <COND (<EQUAL? ,TOWER-BEATEN ,PYRAMID-R>
				     <RTRUE>)
				    (<AND <FSET? ,PYRAMID-R ,TOUCHBIT>
					  .MAPPING>
				     <RTRUE>)
				    (T
				     <RFALSE>)>)
			     (T
			      <COND (<EQUAL? ,TOWER-BEATEN ,PYRAMID-L>
				     <RTRUE>)
				    (<AND <FSET? ,PYRAMID-L ,TOUCHBIT>
					  .MAPPING>
				     <RTRUE>)
				    (T
				     <RFALSE>)>)>)
		      (<NOT .MAPPING>
		       <RTRUE>)
		      (<AND <EQUAL? .RM ,COURTROOM>
			    <EQUAL? .DIR ,P?SOUTH>>
		       <RFALSE>)
		      (<AND <EQUAL? .RM ,TAX-OFFICE>
			    <EQUAL? .DIR ,P?SOUTH>>
		       <RFALSE>)
		      (<AND <EQUAL? .RM ,JESTERS-QUARTERS>
			    <EQUAL? .DIR ,P?SOUTH>>
		       <RFALSE>)
		      (<AND <EQUAL? .RM ,BASE-OF-MOUNTAIN>
			    <EQUAL? .DIR ,P?EAST>>
		       <RFALSE>)
		      (<AND <EQUAL? .RM ,G-U-MOUNTAIN>
			    <EQUAL? .DIR ,P?WEST>>
		       <RFALSE>)
		      (<AND <EQUAL? .RM ,FOOTHILLS>
			    <EQUAL? .DIR ,P?SOUTH>>
		       <RFALSE>)
		      (<AND <EQUAL? .RM ,BASE-OF-MOUNTAINS>
			    <EQUAL? .DIR ,P?NORTH>>
		       <RFALSE>)
		      (T
		       <RTRUE>)>)
	       (T
		<RFALSE>)>>

<ROUTINE COMPASS-CLICK (PIC1 PIC2 "AUX" TL-X TL-Y BR-X BR-Y CENTER-X CENTER-Y DIR)
	 <COND (<EQUAL? .PIC1 ,COMPASS-PIC-LOC> ;"not mapping"
		<SET TL-X <GET ,SL-LOC-TBL 7>>
		<SET TL-Y <GET ,SL-LOC-TBL 6>>
		<PICINF ,U-BOX ,PICINF-TBL>
		<SET BR-X <+ .TL-X <GET ,PICINF-TBL 1>>>
		<SET BR-Y <+ .TL-Y <GET ,PICINF-TBL 0>>>
		<COND (<WITHIN? .TL-X .TL-Y .BR-X .BR-Y>
		       <RETURN ,P?UP>)>
		<SET TL-X <GET ,SL-LOC-TBL 9>>
		<SET TL-Y <GET ,SL-LOC-TBL 8>>
		<PICINF ,D-BOX ,PICINF-TBL>
		<SET BR-X <+ .TL-X <GET ,PICINF-TBL 1>>>
		<SET BR-Y <+ .TL-Y <GET ,PICINF-TBL 0>>>
		<COND (<WITHIN? .TL-X .TL-Y .BR-X .BR-Y>
		       <RETURN ,P?DOWN>)>)>
	 <COND (<EQUAL? .PIC1 ,MAP-COMPASS-PIC-LOC>
		<PICINF-PLUS-ONE .PIC1>
		<SET TL-Y <GET ,PICINF-TBL 0>>
		<SET TL-X <GET ,PICINF-TBL 1>>)
	       (T
		<SET TL-Y <GET ,SL-LOC-TBL 4>>
		<SET TL-X <GET ,SL-LOC-TBL 5>>)>
	 <PICINF .PIC2 ,PICINF-TBL>
	 <SET BR-Y <+ <GET ,PICINF-TBL 0> .TL-Y>>
	 <SET BR-X <+ <GET ,PICINF-TBL 1> .TL-X>>
	 <SET CENTER-X <+ .TL-X </ <GET ,PICINF-TBL 1> 2>>>
	 <SET CENTER-Y <+ .TL-Y </ <GET ,PICINF-TBL 0> 2>>>
	 <COND (<WITHIN? .TL-X .TL-Y .BR-X .BR-Y>
		<COND (<AND <EQUAL? <LOWCORE INTID> ,MACINTOSH>
			    <NOT <MAC-II?>>>
		       <SET DIR <MAC-CLICK .CENTER-X .CENTER-Y .TL-X .TL-Y>>)
		      (<OR <EQUAL? <LOWCORE INTID> ,IBM ,AMIGA ,MACINTOSH>
			   <APPLE?>>		
		       <SET DIR <MAC-II-CLICK .CENTER-X .CENTER-Y>>)
		      (T
		       <SOUND 1>
		       <TELL
"[Clicking on the compass rose is not yet implemented on this machine.]" CR>
		       <RFALSE>)>
		<COND (.DIR
		       <RETURN .DIR>)
		      (T
		       <SOUND 1>
		       <RFALSE>)>)
	       (T
		<SOUND 1>
		<RFALSE>)>>

<ROUTINE MAC-CLICK (CENTER-X CENTER-Y TL-X TL-Y "AUX" X Y DIR)
	 <COND (<WITHIN? <+ .TL-X 25> .TL-Y <+ .TL-X 35> <+ .TL-Y 20>>
		<SET DIR ,P?NORTH>)
	       (<WITHIN? <+ .TL-X 25> <+ .TL-Y 36> <+ .TL-X 35> <+ .TL-Y 58>>
		<SET DIR ,P?SOUTH>)
	       (<WITHIN? <+ .TL-X 38> <+ .TL-Y 23> <+ .TL-X 60> <+ .TL-Y 33>>
		<SET DIR ,P?EAST>)
	       (<WITHIN? .TL-X <+ .TL-Y 23> <+ .TL-X 22> <+ .TL-Y 33>>
		<SET DIR ,P?WEST>)
	       (<WITHIN? <+ .TL-X 37> <+ .TL-Y 10> <+ .TL-X 48> <+ .TL-Y 21>>
		<SET DIR ,P?NE>)
	       (<WITHIN? <+ .TL-X 37> <+ .TL-Y 35> <+ .TL-X 48> <+ .TL-Y 46>>
		<SET DIR ,P?SE>)
	       (<WITHIN? <+ .TL-X 12> <+ .TL-Y 35> <+ .TL-X 23> <+ .TL-Y 46>>
		<SET DIR ,P?SW>)
	       (<WITHIN? <+ .TL-X 12> <+ .TL-Y 10> <+ .TL-X 23> <+ .TL-Y 21>>
		<SET DIR ,P?NW>)
	       (<WITHIN? <+ .TL-X 23> <+ .TL-Y 21> <+ .TL-X 37> <+ .TL-Y 35>>
		;"center section of Mac I compass rose"
		<COND (<AND <G? ,MOUSE-LOC-X .CENTER-X>
			    <L? ,MOUSE-LOC-Y .CENTER-Y>> ;"ne quadrant"
		       <SET X <- ,MOUSE-LOC-X .CENTER-X>>
		       <SET Y <- .CENTER-Y ,MOUSE-LOC-Y>>
		       <COND (<G? .X .Y>
			      <SET DIR ,P?EAST>)
			     (T
			      <SET DIR ,P?NORTH>)>)
		      (<G? ,MOUSE-LOC-X .CENTER-X> ;"se quadrant"
		       <SET X <- ,MOUSE-LOC-X .CENTER-X>>
		       <SET Y <- ,MOUSE-LOC-Y .CENTER-Y>>
		       <COND (<G? .X .Y>
			      <SET DIR ,P?EAST>)
			     (T
			      <SET DIR ,P?SOUTH>)>)
		      (<G? ,MOUSE-LOC-Y .CENTER-Y> ;"sw quadrant"
		       <SET X <- .CENTER-X ,MOUSE-LOC-X>>
		       <SET Y <- ,MOUSE-LOC-Y .CENTER-Y>>
		       <COND (<G? .X .Y>
			      <SET DIR ,P?WEST>)
			     (T
			      <SET DIR ,P?SOUTH>)>)
		      (T;"nw quadrant"
		       <SET X <- .CENTER-X ,MOUSE-LOC-X>>
		       <SET Y <- .CENTER-Y ,MOUSE-LOC-Y>>
		       <COND (<G? .X .Y>
			      <SET DIR ,P?WEST>)
			     (T
			      <SET DIR ,P?NORTH>)>)>)
	       (T
		<RFALSE>)>
	 <RETURN .DIR>>

<CONSTANT TANGENT-VALUE 41>

<ROUTINE MAC-II-CLICK (CENTER-X CENTER-Y "AUX" X Y DIR COMP-WIDTH COMP-HEIGHT)
	 <PICINF ,N-HL ,PICINF-TBL>
	 <SET COMP-HEIGHT <GET ,PICINF-TBL 0>>
	 <SET COMP-WIDTH <GET ,PICINF-TBL 1>>
	 <COND (<AND <G? ,MOUSE-LOC-X .CENTER-X>
		     <L? ,MOUSE-LOC-Y .CENTER-Y>> ;"ne quadrant"
		<SET X <- ,MOUSE-LOC-X .CENTER-X>>
		<SET Y <- .CENTER-Y ,MOUSE-LOC-Y>>
		;"adjust for non-square compass roses"
		<SET Y </ <* .Y .COMP-WIDTH> .COMP-HEIGHT>>
		<COND (<G? <* .X ,TANGENT-VALUE> <* .Y 100>>
		       <SET DIR ,P?EAST>)
		      (<G? <* .Y ,TANGENT-VALUE> <* .X 100>>
		       <SET DIR ,P?NORTH>)
		      (T
		       <SET DIR ,P?NE>)>
		;<COND (,DEBUG
		       <TELL
"[ne quad: X= " N .X ", Y= " N .Y ", C-X= " N .CENTER-X ", C-Y= " N .CENTER-Y "]" CR>)>)
	       (<G? ,MOUSE-LOC-X .CENTER-X> ;"se quadrant"
		<SET X <- ,MOUSE-LOC-X .CENTER-X>>
		<SET Y <- ,MOUSE-LOC-Y .CENTER-Y>>
		;"adjust for non-square compass roses"
		<SET Y </ <* .Y .COMP-WIDTH> .COMP-HEIGHT>>
		<COND (<G? <* .X ,TANGENT-VALUE> <* .Y 100>>
		       <SET DIR ,P?EAST>)
		      (<G? <* .Y ,TANGENT-VALUE> <* .X 100>>
		       <SET DIR ,P?SOUTH>)
		      (T
		       <SET DIR ,P?SE>)>
		;<COND (,DEBUG
		       <TELL
"[se quad: X= " N .X ", Y= " N .Y ", C-X= " N .CENTER-X ", C-Y= " N .CENTER-Y "]" CR>)>)
	       (<G? ,MOUSE-LOC-Y .CENTER-Y> ;"sw quadrant"
		<SET X <- .CENTER-X ,MOUSE-LOC-X>>
		<SET Y <- ,MOUSE-LOC-Y .CENTER-Y>>
		;"adjust for non-square compass roses"
		<SET Y </ <* .Y .COMP-WIDTH> .COMP-HEIGHT>>
		<COND (<G? <* .X ,TANGENT-VALUE> <* .Y 100>>
		       <SET DIR ,P?WEST>)
		      (<G? <* .Y ,TANGENT-VALUE> <* .X 100>>
		       <SET DIR ,P?SOUTH>)
		      (T
		       <SET DIR ,P?SW>)>
		;<COND (,DEBUG
		       <TELL
"[sw quad: X= " N .X ", Y= " N .Y ", C-X= " N .CENTER-X ", C-Y= " N .CENTER-Y "]" CR>)>)
	       (T ;"nw quadrant"
		<SET X <- .CENTER-X ,MOUSE-LOC-X>>
		<SET Y <- .CENTER-Y ,MOUSE-LOC-Y>>
		;"adjust for non-square compass roses"
		<SET Y </ <* .Y .COMP-WIDTH> .COMP-HEIGHT>>
		<COND (<G? <* .X ,TANGENT-VALUE> <* .Y 100>>
		       <SET DIR ,P?WEST>)
		      (<G? <* .Y ,TANGENT-VALUE> <* .X 100>>
		       <SET DIR ,P?NORTH>)
		      (T
		       <SET DIR ,P?NW>)>
		;<COND (,DEBUG
		       <TELL
"[nw quad: X= " N .X ", Y= " N .Y ", C-X= " N .CENTER-X ", C-Y= " N .CENTER-Y "]" CR>)>)>
	 <RETURN .DIR>>

<ROUTINE SAY-HERE ("AUX" X)
	 <PRINTD ,HERE>
	 <SET X <LOC ,PROTAGONIST>>
	 <COND (<IN? ,PROTAGONIST ,CARD-TABLE>
		<TELL ", at" T .X>)
	       (<AND <NOT <EQUAL? .X ,HERE>>
		     <FSET? .X ,VEHBIT>>
		<TELL ", ">
		<COND (<FSET? .X ,INBIT>
		       <TELL "i">)
		      (T
		       <TELL "o">)>
		<TELL "n" T .X>)
	       (,UNDER-TABLE
		<TELL ", under the table">)>
	 <RTRUE>>

;<ROUTINE ITALICIZE (STR "OPTIONAL" (NO-CAPS? <>)
			"AUX" LEN (PTR 2) CHAR ;(SCRIPTING-ON <>))
	 ;<COND (<BTST <LOWCORE FLAGS> 1>
		<SET SCRIPTING-ON T>)>
	 ;<COND (.SCRIPTING-ON
		<DIROUT ,D-PRINTER-OFF>)>
	 <DIROUT ,D-SCREEN-OFF>
	 <DIROUT ,D-TABLE-ON ,SLINE>
	 <TELL .STR>
	 <DIROUT ,D-TABLE-OFF>
	 ;<COND (.SCRIPTING-ON
		<DIROUT ,D-PRINTER-ON>)>
	 ;<COND (<NOT <VERB? SCRIPT UNSCRIPT>>
		<DIROUT ,D-SCREEN-ON>)>
	 <DIROUT ,D-SCREEN-ON>
	 <SET LEN <+ <GET ,SLINE 0> 1>>
	 <COND (<EQUAL? .LEN 1>
		<RTRUE>)
	       (<OR <ZERO? <LOWCORE SERIAL>>  ; "ZIL?"
		    <BAND <LOWCORE ZVERSION> 8>> ; "ITALICS BIT SET?"
		<HLIGHT ,H-ITALIC>
		<REPEAT ()
			<SET CHAR <GETB ,SLINE .PTR>>
			<COND (<EQUAL? .CHAR 32> ; "SPACE?"
			       <HLIGHT ,H-NORMAL>
			       <PRINTC 32>
			       <HLIGHT ,H-ITALIC>)
			      (T
			       <PRINTC .CHAR>)>
			<COND (<EQUAL? .PTR .LEN>
			       <RETURN>)
			      (T
			       <SET PTR <+ .PTR 1>>)>>
		<HLIGHT ,H-NORMAL>)
	       (.NO-CAPS?
		<TELL .STR>)
	       (T                       ; "NO ITALICS, CAPITALIZE"
		<REPEAT ()
			<SET CHAR <GETB ,SLINE .PTR>>
			<COND (<AND <G? .CHAR 96>
				    <L? .CHAR 123>>
			       <SET CHAR <- .CHAR 32>>)>
			<PRINTC .CHAR>
			<COND (<EQUAL? .PTR .LEN>
			       <RETURN>)
			      (T
			       <SET PTR <+ .PTR 1>>)>>)>>

;<ROUTINE SEEING? (OBJ)
	 <COND (<AND <PRSO? .OBJ>
		     <EQUAL? ,PRSA 
		 ,V?EXAMINE ,V?LOOK ,V?LOOK-INSIDE ,V?READ ,V?FIND
		 ,V?SEARCH ,V?SHOW ,V?LOOK-UNDER ,V?LOOK-BEHIND 
		 ,V?LOOK-DOWN ,V?COUNT ,V?POINT>>
	        <RTRUE>)
	       (T
	        <RFALSE>)>>

<CONSTANT TOUCHING-VERBS
      <PLTABLE V?BITE V?CLEAN V?CLIMB V?CLIMB-DOWN V?CLIMB-ON V?CLIMB-UP
	       V?CLOSE V?CUT V?EAT V?ENTER V?KICK V?KILL V?KISS V?KNOCK
	       V?LOCK V?LOOK-BEHIND V?LOOK-INSIDE V?LOOK-UNDER V?LOWER V?MOVE
	       V?MUNG V?OFF V?ON V?OPEN V?PUSH V?RAISE V?REACH-IN V?SEARCH
	       V?SET V?SHAKE V?STAND-ON V?SWIM V?TASTE V?TAKE V?THROW V?TIE
	       V?TOUCH V?UNLOCK>>

<ROUTINE TOUCHING? (THING)
   <COND (<AND <PRSO? .THING>
	       <INTBL? ,PRSA <REST ,TOUCHING-VERBS 2> <GET ,TOUCHING-VERBS 0>>>
	  <RTRUE>)
	 (<AND <PRSI? .THING>
	       <VERB? GIVE PUT PUT-ON>>
	  <RTRUE>)
	 (T
	  <RFALSE>)>>

<ROUTINE HANDLE (OBJ) ;"used by action routines before calling CANT-SEE"
	 <COND (<OR <AND <EQUAL? .OBJ ,PRSO>
			 <EVERYWHERE-VERB? 1>>
		    <AND <EQUAL? .OBJ ,PRSI>
			 <EVERYWHERE-VERB? 2>>>
		<RFALSE>)
	       (T
		<RTRUE>)>>

;"this routine is fucked. When prsi is passed, PRSO is often printed. Fucked"
<ROUTINE CANT-SEE ("OPTIONAL" (OBJ <>) (STRING <>) "AUX" WRD)
	 <COND (<SET WRD <GET-NP .OBJ>>
		<SET WRD <NP-NAME .WRD>>)>
	 <SETG P-WON <>>
	 <TELL "[" ,YOU-CANT "see">
	 <COND (<OR <NOT .OBJ>
		    <AND .WRD
			 <NOT <CAPITAL-NOUN? .WRD>>>>
		<TELL " any">)>
	 <COND (<NOT .OBJ>
		<TELL " " .STRING>)
	       (<EQUAL? .OBJ ,PRSI>
		<PRSI-PRINT>)
	       (T
		<PRSO-PRINT>)>
	 <TELL " here.]" CR>
	 <STOP>>

<ROUTINE PRSO-PRINT ("AUX" PTR)
	 <COND (<OR ;,P-MERGED
		    <NOUN-USED? ,PRSO ,W?IT>
		    ;<EQUAL? <GET <SET PTR <GET ,P-ITBL ,P-NC1>> 0> ,W?IT>>
		<TELL " " D ,PRSO>)
	       (T
		<TELL !\ >
		<NP-PRINT <GET-NP ,PRSO>>
		;<BUFFER-PRINT .PTR <GET ,P-ITBL ,P-NC1L> <>>)>>

<ROUTINE PRSI-PRINT ("AUX" PTR)
	 <COND (<OR ;,P-MERGED
		    <NOUN-USED? ,PRSI ,W?IT>
		    ;<EQUAL? <GET <SET PTR <GET ,P-ITBL ,P-NC2>> 0> ,W?IT>>
		<TELL " " D ,PRSI>)
	       (T
		<TELL !\ >
		<NP-PRINT <GET-NP ,PRSI>>
		;<BUFFER-PRINT .PTR <GET ,P-ITBL ,P-NC2L> <>>)>>

<ROUTINE CANT-VERB-A-PRSO (STRING)
	 <TELL ,YOU-CANT .STRING A ,PRSO "!" CR>>

;<ROUTINE NOW-TIED (OBJ)
	 <TELL "Okay," T ,PRSO " is now tied to" TR .OBJ>>

<ROUTINE TELL-HIT-HEAD ()
	 <TELL
"You hit your head against" T ,PRSO " as you attempt this feat." CR>>

<ROUTINE OPEN-CLOSED (OBJ)
	 <COND (<FSET? .OBJ ,OPENBIT>
		<TELL "open">)
	       (T
		<TELL "closed">)>>

;<ROUTINE IN-YOUR-PACKAGE (STRING)
	 <TELL "This is the " .STRING " that came in your package.">>

<ROUTINE CANT-REACH (OBJ)
	 <COND (<AND ,HAND-IN-WALDO
		     <NOT <EQUAL? .OBJ ,WALDO>>
		     <IN? .OBJ ,HERE>>
		<TELL "The waldo doesn't seem capable of that." CR>)
	       (,UNDER-TABLE
		<TELL
,YOULL-HAVE-TO "get out from under the table in order to reach it." CR>)
	       (T
	 	<TELL ,YOU-CANT "reach" T .OBJ>
	 	<COND (<NOT <IN? ,PROTAGONIST ,HERE>>
		       <TELL " from" T <LOC ,PROTAGONIST>>)>
		<TELL ,PERIOD-CR>)>>

;<ROUTINE EAGERLY-ACCEPTS ()
	 <MOVE ,PRSO ,PRSI>
	 <TELL "Eagerly," T ,PRSI " accepts" T ,PRSO>>

;<ROUTINE NOT-ON-GROUND (VEHICLE)
	 <TELL "But" T .VEHICLE " isn't on the ground!" CR>>

<ROUTINE DO-FIRST (STRING "OPTIONAL" (OBJ <>))
	 <TELL ,YOULL-HAVE-TO .STRING>
	 <COND (.OBJ
		<TPRINT .OBJ>)>
	 <TELL " first." CR>>

<ROUTINE NOT-IN ()
	 <TELL "But" T-IS-ARE ,PRSO "not ">
	 <COND (<FSET? ,PRSI ,ACTORBIT>
		<TELL "being held by">)
	       (<FSET? ,PRSI ,SURFACEBIT>
		<TELL "on">)
	       (T
		<TELL "in">)>
	 <TELL TR ,PRSI>>

<ROUTINE PART-OF ()
	 <TELL
,YOU-CANT "--" T-IS-ARE ,PRSO "an integral part of" TR <LOC ,PRSO>>>

;<ROUTINE CHANGE-OBJECT (OLD NEW)
	 <COND (<PRSO? .OLD>
		<PERFORM ,PRSA .NEW ,PRSI>)
	       (T
		<PERFORM ,PRSA ,PRSO .OLD>)>
	 <RTRUE>>

;<ROUTINE CANT-USE-THAT-WAY (STRING)
	 <TELL "[" ,YOU-CANT "use " .STRING " that way.]" CR>>

<ROUTINE RECOGNIZE ()
	 <SETG P-WON <>>
	 <TELL
"[Sorry, but I don't understand. Please rephrase that or try
something else.]" CR>>

<ROUTINE PRONOUN ()
	 <COND (<PRSO? ,ME>
		<TELL "You">)
	       (<AND <PRSO? ,WHITE-CASTLE>
		     <NOT <NOUN-USED? ,WHITE-CASTLE ,W?MAN>>>
		<TELL "It">)
	       (<FSET? ,PRSO ,PLURALBIT>
		<TELL "They">)
	       (<FSET? ,PRSO ,FEMALEBIT>
		<TELL "She">)
	       (<FSET? ,PRSO ,ACTORBIT>
		<TELL "He">)
	       (T
		<TELL "It">)>>

;<ROUTINE DONT-F ()
	 <COND (<VERB? WAIT>
		<TELL "Time doesn't pass..." CR>)
	       (<VERB? TAKE>
		<TELL "Not taken." CR>)
	       (T
		<TELL "Not done." CR>)>>

;<ROUTINE REFERRING ("OPTIONAL" (HIM-HER <>))
	 <TELL "It's not clear wh">
	 <COND (.HIM-HER
		<TELL "o">)
	       (T
		<TELL "at">)>
	 <TELL " you're referring to." CR>>

;<ROUTINE UNIMPORTANT-THING-F ()
	 <TELL "That's not important; leave it alone." CR>>

<ROUTINE HIT-ANY-KEY ("OPTIONAL" (STRING <>))
	 <TELL "[Hit any key to ">
	 <COND (.STRING
		<TELL "begin playing " .STRING>)
	       (T
		<TELL "continue">)>
	 <TELL ".]">
	 <DIROUT ,D-SCREEN-OFF>
	 <CRLF> ;"to transcript only"
	 <DIROUT ,D-SCREEN-ON>
	 <COND (,DEMO-VERSION?
		<INPUT-DEMO 1>)
	       (T
		<INPUT 1>)>
	 <MOUSE-INPUT?>>

<ROUTINE LOCKED-UNLOCKED (OBJ "OPTIONAL" (UN <>))
	 <TELL "A faint click indicates that" T .OBJ " is now ">
	 <COND (.UN
		<TELL "un">)>
	 <TELL "locked." CR>>

<ROUTINE CANT-TURN (STRING)
	 <TELL ,YOU-CANT "turn that o" .STRING ,PERIOD-CR>>

<ROUTINE YOU-MUST-TELL-ME ()
	 <TELL "You must tell me how to do that to" AR ,PRSO>>

<ROUTINE GRUE-PIT-WARNING ()
	 <COND (<AND <NOT <IN? ,PROTAGONIST ,DB>>
		     <NOT ,TIME-STOPPED>
		     <NOT <EQUAL? ,HERE ,PIT-BOMB-LOC>>>
	 	<TELL " You are likely to ">
	 	<COND (<FSET? ,LANTERN ,TRYTAKEBIT>
		       <TELL "fall into a bottomless pit.">)
		      (T
		       <TELL "be eaten by a grue.">)>)>
	 <CRLF>>

<ROUTINE DARK-DEATH ()
	 <TELL "Oh, no! You have ">
	 <COND (<FSET? ,LANTERN ,TRYTAKEBIT>
		<TELL "fallen into a bottomless pit">)
	       (T
		<TELL "walked into the slavering fangs of a lurking grue">)>
	 <JIGS-UP "!">>

<CONSTANT TOO-DARK "It's too dark to see a thing.">

<CONSTANT YNH "You're not holding">

<CONSTANT THERES-NOTHING "There's nothing ">

<CONSTANT YOU-SEE "You can see">

<CONSTANT IT-SEEMS-THAT "It seems that">

<CONSTANT YOU-CANT-SEE-ANY "[You can't see any ">

<CONSTANT YOU-CANT "You can't ">

<CONSTANT YOULL-HAVE-TO "You'll have to ">

<CONSTANT LOOK-AROUND "Look around you.|">

<CONSTANT CANT-FROM-HERE "You can't do that from here.|">

<CONSTANT HOLDING-IT "You're holding it!|">

<CONSTANT PERIOD-CR ".|">

<CONSTANT ELLIPSIS "...||">

<CONSTANT FAILED "Failed.|">

<CONSTANT OK "Okay.|">

<CONSTANT HUH "Huh?|">

<CONSTANT NOTHING-HAPPENS "Nothing happens.|">

<CONSTANT ALREADY-IS "It already is!|">

;<CONSTANT NOTHING-NEW "This reveals nothing new.|">

<CONSTANT ONLY-BLACKNESS "You see only blackness.|">

;<CONSTANT NO-VERB "[There was no verb in that sentence!]|">

;<CONSTANT WEARING-IT "You're wearing it!|">

<CONSTANT POORLY-CONFIGURED 
"You nearly make it, but the branches are just too poorly configured for
climbing.|">

<CONSTANT ANSWER-MY-RIDDLE "\"You'll have to answer my riddle first!\"|">

<CONSTANT SOME-LIGHT "You can see some light through the crack.|">

<CONSTANT TYPE-A-NUMBER "Please type a number between 1 and ">

<CONSTANT BY-THAT-NAME "There's no one here by that name.|">

<CONSTANT NOTHING-IN-REACH
"You reach in as far as you can, but feel nothing.|">

<CONSTANT WONT-BUDGE "It won't budge.|">

<CONSTANT COOK-DESC
"garbed in a white apron and wearing a puffy white chef's hat.">

<CONSTANT BOOKKEEPER-DESC
"is hunched over one of the desks, wearing suspenders, a bow tie, thick
eyeglasses, and a green visor.">

<CONSTANT ERE-YOU-PASS
"\"'Ere you pass to the west, you must first pass this test! Show me an object
which no one has ever seen before and which no one will ever see again!\"|">

<CONSTANT DEEPLY-ROOTED "The spenseweed is deeply rooted.|">

<END-SEGMENT>