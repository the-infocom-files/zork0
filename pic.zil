"PIC for
				Library
	(c) Copyright 1987 Infocom, Inc. All Rights Reserved."

<BEGIN-SEGMENT STARTUP>

<ROUTINE TITLE-SCREEN ()
	 <CLEAR -1>
	 <PICINF ,P-TITLE ,YX-TBL>
	 <SETG CURRENT-SPLIT ,TITLE-SCREEN-PICTURE>
	 <SPLIT <GET ,YX-TBL 0>>
	 <SCREEN 1>
	 <CURSET -1> ;"turn cursor off"
	 <DISPLAY ,P-TITLE 1 1>
	 <SCREEN 0>>

<END-SEGMENT>

<BEGIN-SEGMENT 0>

<CONSTANT YX-TBL <TABLE 0 0>>

;<ROUTINE CENTER-PIC (P "AUX" X (CENTER </ ,WIDTH 2>))
	 <CPICINF .P ,YX-TBL>
	 <SET X <GET ,YX-TBL 1>>
	 <CDISPLAY .P 1 <- .CENTER </ .X 2>>>>

;<CONSTANT WIN-TBL <TABLE 0 0 0>>

<ROUTINE YCEILING (Y)
	 <* ,FONT-Y </ <+ .Y <- ,FONT-Y 1>> ,FONT-Y>>>

<ROUTINE XCEILING (X)
	 <* ,FONT-X </ <+ .X <- ,FONT-X 1>> ,FONT-X>>>

;<CONSTANT WTBL <LTABLE 0>>

;<ROUTINE WINPROP (WIN PROP)
	 <WINGET .WIN ,WTBL .PROP>
	 <GET ,WTBL 1>>

<ROUTINE MARGINAL-PIC (P "AUX" X Y YLEFT HIGH YLOC WWIDTH OFFSET-Y OFFSET-X)
	 <PICINF .P ,YX-TBL>
	 ;"Integral character height of the picture"
	 <SET Y <YCEILING <GET ,YX-TBL 0>>>
	 ;"Round up to integral character width"
	 <SET X <XCEILING <GET ,YX-TBL 1>>>
	 <SET HIGH <WINGET ,S-TEXT ,WHIGH>>
	 <SET WWIDTH <WINGET ,S-TEXT ,WWIDE>>
	 <SET YLEFT <- <WINGET ,S-TEXT ,WYPOS> 1>>
	 <SET YLEFT <- .HIGH .YLEFT>>
	 <COND (<G? .Y .YLEFT>
		<CURGET ,YX-TBL>
		<SET YLOC <GET ,YX-TBL 0>>
		<SET YLEFT <YCEILING <- .Y .YLEFT>>>
		<SCROLL ,S-TEXT .YLEFT>
		<SET YLOC <- .YLOC .YLEFT>>
		<COND (<L=? .YLOC 0> <SET YLOC 1>)>
		<CURSET .YLOC <GET ,YX-TBL 1>>)>
	 <SET YLEFT <+ .Y <WINGET ,S-TEXT ,WYPOS>>>
	 <COND (<AND <APPLE?>
		     <EQUAL? .P ,PROLOGUE-LETTER ,EPILOGUE-LETTER ,MAIN-LETTER>>
		;"on Apple, ICON-OFFSET used only for icons, not letters"
		<SET OFFSET-Y 0>
		<SET OFFSET-X 0>)
	       (T
		<SET OFFSET-Y <GET ,SL-LOC-TBL 10>>
		<SET OFFSET-X <GET ,SL-LOC-TBL 11>>)>
	 <DISPLAY .P <+ <WINGET ,S-TEXT ,WYPOS> .OFFSET-Y> <+ 1 .OFFSET-X>>
	 <COND (<NOT <APPLE?>>
		<SET X <+ .X ,FONT-X>>)>
	 <COND (<G=? .X .WWIDTH>
		<CURSET .YLEFT 1>
		<COND (,DEMO-VERSION?
		       <INPUT-DEMO 1>)
		      (T
		       <INPUT 1>)>
		<MOUSE-INPUT?>
		<COND (<L=? <- .HIGH .YLEFT> ,FONT-Y>
		       <SCROLL ,S-TEXT ,FONT-Y>)>)
	       (T
		;<COND (.RIGHT?
		       <MARGIN 0 .X>)
		      (T
		       <MARGIN .X 0>)>
		<MARGIN .X 0>
		<SET Y </ .Y ,FONT-Y>>
		<SET WWIDTH </ <- .WWIDTH .X> ,FONT-X>>
		<PUTB ,P-INBUF 0
		      <COND (<G? .WWIDTH ,INBUF-LENGTH>
			     ,INBUF-LENGTH)
			    (T
			     .WWIDTH)>>
		;<PUT ,WIN-TBL 0 2>
		;<PUT ,WIN-TBL 1 ,RESET-MARGIN>
		;<PUT ,WIN-TBL 2 .Y ;<+ .Y 1>>
		<COND (<EQUAL? <LOWCORE INTID> ,IBM>
		       <SET Y <- .Y 1>> ;"dunno why, but it works")>
		<WINPUT 0 ,WCRCNT .Y>
		<WINPUT 0 ,WCRFUNC ,RESET-MARGIN>)>>

<ROUTINE RESET-MARGIN ()
	 <PUTB ,P-INBUF 0 ,INBUF-LENGTH>
	 <MARGIN 0 0>>

<END-SEGMENT>