"DEFS to replace parser's versions for

			       ZORK ZERO
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<BEGIN-SEGMENT 0>

<INCLUDE "basedefs" "symbols">

<COMPILATION-FLAG P-DEBUGGING-PARSER <>>

<ADD-TELL-TOKENS D *	 <DPRINT .X>>

<DELAY-DEFINITION	CAPITAL-NOUN?>
<DELAY-DEFINITION	LIT?>

<REPLACE-DEFINITION READ-INPUT
<ROUTINE READ-INPUT ("AUX" TRM TMP N M FDEF DIR)
	 <TELL ">">
	 <PUTB ,P-INBUF 1 0>
	 <REPEAT ()
	      <COND (,DEMO-VERSION?
		     <SET TRM <READ-DEMO ,P-INBUF <>>>)
		    (T
		     <SET TRM <READ ,P-INBUF <>>>)>
	      <COND (<EQUAL? .TRM ,PAD0>
		     <SET TRM ,F10>)
		    (<AND <G=? .TRM ,PAD1>
			  <L=? .TRM ,PAD9>>
		     <SET TRM <+ ,F1 <- .TRM ,PAD1>>>)>
	      <COND (<EQUAL? .TRM ,CLICK1 ,CLICK2>
		     <MOUSE-INPUT?>
		     <COND (<SET DIR <COMPASS-CLICK ,COMPASS-PIC-LOC ,N-HL>>
			    <READ-INPUT-COMP .DIR>
			    <RETURN>)>)
		    (<EQUAL? .TRM 13 10>
		     <RETURN>)
		    (<AND <SET TMP
			       <INTBL? .TRM <REST ,FKEYS 2> <GET ,FKEYS 0>>>
			  <SET FDEF <GET .TMP 1>>> ;"key def"
		     <SET TRM <ADD-TO-INPUT <REST .FDEF> .TRM <GETB .FDEF 1>>>
		     <COND (<EQUAL? .TRM 13 10>
			    <RETURN>)>)
		    (T
		     <SOUND ,S-BEEP>)>>
	 <SCRIPT-INBUF>
	 <LEX ,P-INBUF ,P-LEXV>>

<GLOBAL MOUSE-LOC-X <>> ;"X-coordinate of most recent mouse click"

<GLOBAL MOUSE-LOC-Y <>> ;"Y-coordinate of most recent mouse click"

<ROUTINE MOUSE-INPUT? ()
	 <SETG MOUSE-LOC-X <LOWCORE MSLOCX>>
	 <SETG MOUSE-LOC-Y <LOWCORE MSLOCY>>>

<ROUTINE SCRIPT-INBUF ("AUX" BUF (CNT 0) (N <GETB ,P-INBUF 1>) CHR)
	 <DIROUT ,D-SCREEN-OFF>
	 <SET BUF <REST ,P-INBUF>>
	 <REPEAT ()
		 <COND (<IGRTR? CNT .N> <RETURN>)
		       (ELSE
			<SET CHR <GETB .BUF .CNT>> 
			<COND (<AND <G=? .CHR !\a>
				    <L=? .CHR !\z>>
			       <PRINTC <- .CHR 32>>)
			      (ELSE <PRINTC .CHR>)>)>>
	 <CRLF>
	 <DIROUT ,D-SCREEN-ON>>>

<REPLACE-DEFINITION GAME-VERB?
<CONSTANT GAME-VERB-TABLE
 <LTABLE V?BRIEF V?QUIT V?RESTART V?RESTORE
	 V?SAVE V?SCORE V?SCRIPT V?SUPERBRIEF
	 ;V?TELL V?UNSCRIPT V?VERBOSE V?VERSION V?$VERIFY ;V?FOOTNOTE
	 V?NOTIFY V?HINT V?COLOR V?TIME V?MAP V?DEFINE V?MODE V?CREDITS
	 V?$REFRESH>>

<ROUTINE GAME-VERB? ()
 <COND (<INTBL? ,PRSA <ZREST ,GAME-VERB-TABLE 2> <ZGET ,GAME-VERB-TABLE 0>>
	<RTRUE>)>
 ;<COND (<VERB?!- $RANDOM $COMMAND $RECORD $UNRECORD>
	<RTRUE>)>>>

<REPLACE-DEFINITION	NO-M-WINNER-VERB?
<DEFMAC NO-M-WINNER-VERB? ()
	'<EQUAL? ,PRSA ,V?ASK-ABOUT ,V?SRIDE-DIR ,V?SSEARCH-OBJECT-FOR
		       ,V?SPUT-ON ,V?SSHOW ,V?STHROW ,V?SWRAP ,V?STOUCH>>>

<REPLACE-DEFINITION NOT-HERE-VERB?
<ROUTINE NOT-HERE-VERB? (V)
	<EQUAL? .V ,V?WALK-TO ,V?RESEARCH>>>

<REPLACE-DEFINITION	OWNERS
	<CONSTANT OWNERS
		  <TABLE (PURE LENGTH)
			 JESTER WALL SAPPHIRE SPENSEWEED POSTER UNICORNS T-OF-B>>>
;<REPLACE-DEFINITION	PARSER-REPORT <CONSTANT PARSER-REPORT <>>>

<REPLACE-DEFINITION	PERSONBIT <CONSTANT PERSONBIT ACTORBIT>>
<REPLACE-DEFINITION	PLAYER <CONSTANT PLAYER PROTAGONIST>>
;<REPLACE-DEFINITION	PLURAL <CONSTANT PLURAL PLURALBIT>>
<REPLACE-DEFINITION	PRINT-INTQUOTE <CONSTANT PRINT-INTQUOTE 0>>
<DELAY-DEFINITION	REFRESH>
<REPLACE-DEFINITION	ROOMSBIT <CONSTANT ROOMSBIT KLUDGEBIT>>

<REPLACE-DEFINITION SEE-VERB?
<ROUTINE SEE-VERB? ()
	<EQUAL? ,PRSA ,V?CHASTISE ,V?COUNT ,V?EXAMINE ,V?FIND ,V?TAKE
		      ;,V?INVENTORY ,V?LOOK ,V?LOOK-BEHIND ,V?LOOK-DOWN
		      ,V?LOOK-INSIDE ,V?LOOK-UNDER ,V?READ ,V?SEARCH>>>

<COMPILATION-FLAG P-APOSTROPHE-BREAKS-WORDS <>>
<REPLACE-DEFINITION	SIBREAKS <SETG20 SIBREAKS ".,\"!?">>

<REPLACE-DEFINITION	SETUP-ORPHAN-NP <CONSTANT SETUP-ORPHAN-NP 0>>

<REPLACE-DEFINITION	SPEAKING-VERB?
<ROUTINE SPEAKING-VERB? ("OPT" (A ,PRSA))
 <COND (<EQUAL? .A ;,V?ANSWER ,V?ASK-ABOUT ,V?ASK-FOR ,V?HELLO
		   ,V?NO ;,V?REPLY ,V?TELL ,V?TELL-ABOUT ,V?YES>
	<RTRUE>)>>>

<ROUTINE APPLE? ()
	 <COND (<EQUAL? <LOWCORE INTID> ,APPLE-2E ,APPLE-2C ,APPLE-2GS>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<REPLACE-DEFINITION STATUS-LINE

;"call v-$refresh to during game if want to clear junk"
<ROUTINE UPDATE-STATUS-LINE ("AUX" X Y)
	 <SCREEN ,S-WINDOW>
	 <FONT 4> ;"non-proportional"
	 <COND (<AND <EQUAL? <LOWCORE INTID> ,IBM>
		     <NOT <FLAG-ON? ,F-COLOR>>>
		<HLIGHT ,H-INVERSE>)
	       (<NOT ,BORDER-ON>
		<HLIGHT ,H-INVERSE>)
	       (,BORDER-ON
		<CURSET <- <GET ,SL-LOC-TBL 0> 1> <GET ,SL-LOC-TBL 1>>
		<COLOR ,DEFAULT-FG -1>)>
	 <COND (<NOT <EQUAL? ,HERE ,OLD-HERE>> ;"Print loc if it's a new loc"
		<DRAW-NEW-HERE>)>
	 <COND (<NOT <EQUAL? <GETP ,HERE ,P?REGION> ,OLD-REGION>>
		<DRAW-NEW-REGION>)>
	 <SET Y <+ <GET ,SL-LOC-TBL 0> ,FONT-Y>>
	 <SET X <+ <GET ,SL-LOC-TBL 1> <* ,FONT-X 8>>>
	 <CURSET .Y .X>
	 <PRINT-SPACES 5>
	 <CURSET .Y .X>
	 <PRINTN ,MOVES>
	 <COND (<NOT <EQUAL? ,SCORE ,SL-SCORE>> ;"score changed?"
	        <DRAW-NEW-SCORE>)>
	 <COND (<AND <EQUAL? <LOWCORE INTID> ,IBM>
		     <NOT <FLAG-ON? ,F-COLOR>>>
		<HLIGHT ,H-NORMAL>
		<COND (<AND ,BORDER-ON ,COMPASS-CHANGED>
		       <DRAW-NEW-COMP>)>)
	       (,BORDER-ON
		<COLOR ,DEFAULT-FG ,DEFAULT-BG>
		<COND (,COMPASS-CHANGED
		       <DRAW-NEW-COMP>)>)
	       (<NOT ,BORDER-ON>
		<HLIGHT ,H-NORMAL>)>
	 <FONT 1> ;"proportional"
	 <SCREEN ,S-TEXT>
	 <RFALSE>>

<ROUTINE PICINF-PLUS-ONE (PIC)
	 <PICINF .PIC ,PICINF-TBL>
	 <PUT ,PICINF-TBL 0 <+ <GET ,PICINF-TBL 0> 1>>
	 <PUT ,PICINF-TBL 1 <+ <GET ,PICINF-TBL 1> 1>>>

<ROUTINE PRINT-SPACES (CNT)
	 <REPEAT ()
		 <COND (<L? <SET CNT <- .CNT 1>> 0>
			<RETURN>)
		       (T
			<PRINTC 32>)>>>
>

<REPLACE-DEFINITION TELL-TOO-DARK
	 <ROUTINE TELL-TOO-DARK ()
		  <SETG P-CONT -1> ;<RFATAL>
		  <TELL ,TOO-DARK>
		  <COND (<EQUAL? ,PRSA ,V?LOOK>
			 <GRUE-PIT-WARNING>)
			(T
			 <CRLF>)>>>

<COMPILATION-FLAG P-TITLE-ABBRS T>

<REPLACE-DEFINITION TITLE-ABBR?
<DEFMAC TITLE-ABBR?!- ('WRD) <FORM EQUAL? .WRD ',W?ST ',W?D ',W?J ',W?A>>>

<DELAY-DEFINITION	VERB-ALL-TEST>
<REPLACE-DEFINITION	YES? <CONSTANT YES? 0>>

<COMPILATION-FLAG P-PS-ADV T>
<COMPILATION-FLAG P-PS-COMMA T>
<COMPILATION-FLAG P-PS-OFWORD T>
;<COMPILATION-FLAG P-PS-THEWORD T>
<COMPILATION-FLAG P-PS-QUOTE T>

<TERMINALS (VERB 6) (NOUN 4) (ADJ 5)	;"keep these three in order! -- SWG"
 	   (DIR 1)
 	   (PARTICLE 3) (PREP 2)	;"keep these two in order! -- SWG"
	   ASKWORD	;7
	   OFWORD ;ARTICLE QUOTE COMMA
	   ADV QUANT MISCWORD>

<PROPDEF DIRECTIONS <>
	 (DIR TO R:ROOM =
	  (UEXIT 1)	;442	#SEMI "UNCONDITIONAL EXIT"
	  (REXIT <ROOM .R>)	#SEMI "TO ROOM")
	 (DIR S:STRING =
	  (NEXIT 2)	;108	#SEMI "IMPOSSIBLE EXIT"
	  (NEXITSTR <STRING .S>) #SEMI "FAILURE MESSAGE")
	 (DIR SORRY S:STRING =
	  (NEXIT 2)		#SEMI "IMPOSSIBLE EXIT"
	  (NEXITSTR <STRING .S>) #SEMI "FAILURE MESSAGE")
	 (DIR PER F:FCN =
	  (FEXIT 3)	;60	#SEMI "CONDITIONAL EXIT"
	  (FEXITFCN <WORD .F>)	#SEMI "PER FUNCTION"
	  <BYTE 0>)
	 (DIR TO R:ROOM IF F:GLOBAL "OPT" ELSE S:STRING =
	  (CEXIT 4)	;9	#SEMI "CONDITIONAL EXIT"
	  (REXIT <ROOM .R>)	#SEMI "TO ROOM"
	  (CEXITFLAG <GLOBAL .F>) #SEMI "IF FLAG IS TRUE"
	  (CEXITSTR <STRING .S>) #SEMI "FAILURE MESSAGE")
	 (DIR TO R:ROOM IF O:OBJECT IS OPEN "OPT" ELSE S:STRING =
	  (DEXIT 5)	;17	#SEMI "CONDITIONAL EXIT"
	  (DEXITOBJ <OBJECT .O>) #SEMI "IF DOOR IS OPEN"
	  (DEXITSTR <STRING .S>) #SEMI "FAILURE MESSAGE"
	  (DEXITRM <ROOM .R>)	#SEMI "TO ROOM")>

<DIRECTIONS	NORTH NE EAST SE SOUTH SW WEST NW UP DOWN IN OUT>

<OBJECT INTDIR
	(LOC GLOBAL-OBJECTS)
	(DESC "direction")
	(SYNONYM NORTH NE EAST SE SOUTH SW WEST NW ;UP ;DOWN)>

;<REPLACE-DEFINITION GET-DEXITOBJ
<ROUTINE GET-DEXITOBJ (PT) <ZGET <REST .PT> ,DEXITOBJ>>>

;<CONSTANT M-OBJDESC? 10>

<ZSTART GO> ;"else, ZIL gets confused between verb-word GO and routine GO"

<CONSTANT S-FULL 7>

<ROUTINE CLOCKER ("AUX" E TICK RTN (FLG <>) (Q? <>) OWINNER)
	 <COND (,CLOCK-WAIT
		<SETG CLOCK-WAIT <>>
		<RFALSE>)
	       (,TIME-STOPPED
		;"don't run interrupts, but do increment moves"
		<SETG MOVES <+ ,MOVES 1>>
		<RFALSE>)>
	 <SETG CLOCK-HAND <REST ,C-TABLE ,C-INTS>>
	 <SET E <REST ,C-TABLE ,C-TABLELEN>>
	 <SET OWINNER ,WINNER>
	 <SETG WINNER ,PROTAGONIST>
	 <REPEAT ()
		 <COND (<EQUAL? ,CLOCK-HAND .E>
			;<SETG CLOCK-HAND .E>
			<SETG MOVES <+ ,MOVES 1>>
			<SETG WINNER .OWINNER>
			<RETURN .FLG>)
		       (<NOT <ZERO? <GET ,CLOCK-HAND ,C-RTN>>>
			<SET TICK <GET ,CLOCK-HAND ,C-TICK>>
			<COND (<L? .TICK -1>
			       <PUT ,CLOCK-HAND ,C-TICK <- -3 .TICK>
							;<- <- .TICK> 3>>
			       <SET Q? ,CLOCK-HAND>)
			      (<NOT <ZERO? .TICK>>
			       <COND (<G? .TICK 0>
				      <SET TICK <- .TICK 1>>
				      <PUT ,CLOCK-HAND ,C-TICK .TICK>)>
			       <COND (<NOT <ZERO? .TICK>>
				      <SET Q? ,CLOCK-HAND>)>
			       <COND (<NOT <G? .TICK 0>>
				      <SET RTN
					   <IFFLAG (IN-ZILCH
						    <GET ,CLOCK-HAND ,C-RTN>)
						   (T
						    <NTH ,CLOCK-HAND
							 <+ <* ,C-RTN 2>
							    1>>)>>
				      <COND (<ZERO? .TICK>
					     <PUT ,CLOCK-HAND ,C-RTN 0>)>
				      <COND (<APPLY .RTN>
					     <SET FLG T>)>
				      <COND (<AND <NOT .Q?>
						  <NOT
						   <ZERO?
						    <GET ,CLOCK-HAND
							 ,C-RTN>>>>
					     <SET Q? T>)>)>)>)>
		 <SETG CLOCK-HAND <REST ,CLOCK-HAND ,C-INTLEN>>
		 <COND (<NOT .Q?>
			<SETG C-INTS <+ ,C-INTS ,C-INTLEN>>)>>>

<END-SEGMENT>
