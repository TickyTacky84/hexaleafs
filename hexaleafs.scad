
/**********
 * CONFIG *
 **********/

transparentAlpha = 0.25;
outlets = [1, 0, 0, 0, 0, 0];


// Generic clearance
c = 0.3;

// Special clearances for module connectors
cLow = 0.2;
cLower = 0.1;
cHigh = 0.4;
cHigher = 0.5;

// Body-Settings

// Länge Innenseite Sechseck
// Von Strip abgeleitet: 2 bzw. 4 LEDs pro Seite = 66.66666666 mm
// Streifen hat eigene Dicke und braucht etwas mehr Platz um sauber zu passen
// 66.666666 mm-Variante gedruckt, Streifen eingelegt, Überhang großzügig gemessen und durch 6 (= Anzahl Seiten) geteilt
// Ergebnis: ~21 mm Überhang, somit: Seitenlänge ~70 mm
// lBodySideInner = 66.66666666 + 3.5;
// Danach rumprobiert... :D
lBodySideInner = 68.8;

thBodyWall = 1.5;	// Normalerweise 1.6 (= 4*0.4mm), aber SuperSlicer nutzt erst bei 1.5mm genau 4 Linien

thBodyBottom = 1;	// Dicke des Hauptkörper-Bodens

hBodyInner = 30;	// Innere Höhe des Hauptkörpers (Gesamthöhe = innere Höhe + Dicke Boden)

wCableOutlet = 10;	// Breite der Kabel-Auslässe

dHoleHanger = 10;	// Durchmesser des Lochs in der Mitte zum Aufhängen
					// Achtung! Loch ist Sechseck, um gerades Aufhängen zu ermöglichen.
					// Lochdurchmesser gibt Länge der KURZEN Diagonalen des Sechsecks an!
hHoleHanger = 3;
thHoleHanger = 2;


// Cable-Guide-Settings

thCableGuide = 1;		// Dicke des "Dachs"
hCableGuide = 4;		// Innere Höhe, durch die die Kabel geführt werden
lCableGuide = 1.5;		// Tiefe
wCableGuidePost = 1.5;	// Breite der Pfosten auf denen das "Dach" sitzt

offCableGuide = 14.62;


// Body/Strip-Settings

hBodyStripRim = 3;	// Höhe des Randes, auf dem der LED-Strip sitzt
wBodyStripRim = 2;	// Breite des Randes, auf dem der LED-Strip sitzt

wStripHolder = 3;	// Breite des Strip-Haltebolzens / Diffusor-Abstandshalters
lStripHolder = 3;	// Länge des Strip-Haltebolzens / Diffusor-Abstandshalters


// Strip-Settings

// Dicke des LED-Streifens
thStrip = 0.5;
hStrip = 10;


// Diffusor-Settings

hDiffusor = 5;			// Höhe des Diffusors
dDiffusorInner = 50;	// Durchmesser der inneren Kreisvertiefung des Diffusors
thDiffusorInner = 0.4;	// Dicke des Diffusors an der inneren Kreisvertiefung
offDiffusor = 2;		// Diffusor-Offset zwischen Oberkante LED-Strip und Unterkante Diffusor


// Face-Settings

thFace = 0.8;


// Cap-Settings

thCapWall = 0.8;
wCapRim = 3.5;
thCapRim = 1;


// Connector-Settings

wConnectorLink = 5;
wConnectorHead = 10;


// Spacer-Settings
thSpacer = 0.8;



/********
 * CALC *
 ********/

// Body-Calculations

hBody = hBodyInner + thBodyBottom;


// Innendurchmesser berechnen
dBodyInner = 2 * lBodySideInner;	// Zylinder mit $fn=6 erzeugt "inneres" Sechseck
									// --> Lange Diagonale des Sechsecks berechnen = Zylinder-Durchmesser
dBodyInnerShort = ( sqrt(3) * lBodySideInner );	// --> Kurze Diagonale


// Außendurchmesser berechnen
// 2x Wandstärke zur kurzen Diagonalen addieren
// Aus Ergebnis Seitenlänge ermitteln und über Seitenlänge lange Diagonale berechnen
//tmp_dBodyInnerShort = ( sqrt(3) * lBodySideInner ) + ( 2 * thBodyWall );
//tmp_sideLength = tmp_dBodyInnerShort / sqrt(3);
//dBodyOuter = 2 * tmp_sideLength;
lBodySideOuter = ( dBodyInnerShort + 2 * thBodyWall ) / sqrt(3);
dBodyOuter = 2 * lBodySideOuter;
dBodyOuterShort = sqrt(3) * lBodySideOuter;


// Innendurchmesser im Bereich des Strip-Randes berechnen
// Kurze Diagonale berechnen, 2x Randbreite subtrahieren
// Aus Ergebnis Seitenlänge ermitteln und über Seitenlänge lange Diagonale berechnen
lBodySideRim = ( dBodyInnerShort - 2 * wBodyStripRim ) / sqrt(3);
dBodyInnerRim = 2 * lBodySideRim;
dBodyInnerRimShort = sqrt(3) * lBodySideRim;


// Aussendurchmesser Loch zum Aufhängen
lSideHoleHanger = dHoleHanger / sqrt(3);
dHoleHangerOuter = 2 * lSideHoleHanger;


// Diffusor-Calculations

// Höhe der Diffusor-Abstandshalter / Strip-Haltebolzen
hSpacerDiffusor = hBodyStripRim + hStrip + offDiffusor;

// Durchmesser des Diffusors
lDiffusorSide = ( dBodyInnerShort - 2 * c ) / sqrt(3);
dDiffusor = 2 * lDiffusorSide;
dDiffusorShort = sqrt(3) * lDiffusorSide;


// Cap-Calculations

// Innen-Durchmesser der Abdeckkappe
lCapSideInner = ( dBodyOuterShort + 2 * c ) / sqrt(3);
dCapInner = 2 * lCapSideInner;
dCapInnerShort = sqrt(3) * lCapSideInner;

// Außen-Durchmesser der Abdeckkappe
lCapSideOuter = ( dCapInnerShort + 2 * thCapWall ) / sqrt(3);
dCapOuter = 2 * lCapSideOuter;
dCapOuterShort = sqrt(3) * lCapSideOuter;


lCapSideRim = ( dCapOuterShort - 2 * wCapRim ) / sqrt(3);
dCapRim = 2 * lCapSideRim;
dCapRimShort = sqrt(3) * lCapSideRim;


// Connector-Calculations

hConnector = thBodyBottom + hBodyStripRim;
lConnectorLink = 2 * (thBodyWall + c + thCapWall) + c;
lConnectorHead = wBodyStripRim;



// Spacer-Calculations
hSpacer = hBodyInner - hSpacerDiffusor - hDiffusor - 2 * c;


/************************
 * RHOMBUS-CALUCLATIONS *
 ************************/

wRhombusCapOuter = dCapOuterShort;
lRhombusCapOuter = dCapOuter / 2;
lRhombusCapSideOuter = lRhombusCapOuter;

h = lRhombusCapSideOuter * sin(60);
h2 = h - 2 * thCapWall;

lRhombusCapSideInner = h2 / sin(60);
lRhombusCapInner = lRhombusCapSideInner;
wRhombusCapInner = 2 * sqrt( pow(lRhombusCapSideInner, 2) - 0.25 * pow(lRhombusCapInner, 2) );

h3 = h - 2 * wCapRim;

lRhombusCapSideRim = h3 / sin(60);
lRhombusCapRim = lRhombusCapSideRim;
wRhombusCapRim = 2 * sqrt( pow(lRhombusCapSideRim, 2) - 0.25 * pow(lRhombusCapRim, 2) );

h4 = h - 2 * thCapWall - 2 * c;

lRhombusBodySideOuter = h4 / sin(60);
lRhombusBodyOuter = lRhombusBodySideOuter;
wRhombusBodyOuter = 2 * sqrt( pow(lRhombusBodySideOuter, 2) - 0.25 * pow(lRhombusBodyOuter, 2) );

h5 = h - 2 * thCapWall - 2 * c - 2 * thBodyWall;

lRhombusBodySideInner = h5 / sin(60);
lRhombusBodyInner = lRhombusBodySideInner;
wRhombusBodyInner = 2 * sqrt( pow(lRhombusBodySideInner, 2) - 0.25 * pow(lRhombusBodyInner, 2) );
hRhombusBodyInner = hBodyInner - 2 * thFace - c;

xDistMountESP = 23.4;
yDistMountESP = 51.9;
dHoleMountESP = 2.8;
hPinMountESP = hRhombusBodyInner;

dCable = 7.5;




/***********
 * MODULES *
 ***********/

module body() {

	color("white") {

		// body
		difference() {

			union() {

				difference() {

					// main body
					translate([0, 0, -thBodyBottom])
						cylinder(d=dBodyOuter, h=hBody, $fn=6);

					// carve out down to strip rim
					translate([0, 0, hBodyStripRim])
						cylinder(d=dBodyInner, h=hBody + 1, $fn=6);

					// carve out down to strip rim
					cylinder(d=dBodyInnerRim, h=hBody + 1, $fn=6);

				}

				// hanger hole reinforcement
				hull() {

					rotate([0, 0, 30])
					translate([0, 0, hHoleHanger - 0.1])
						cylinder(d=dHoleHangerOuter + 2 * thHoleHanger, h=0.1, $fn=6);

					translate([0, 0, -0.1])
						cylinder(d=2 * (dHoleHangerOuter + 2 * thHoleHanger), h=0.1);

				}

			}

			// hanger hole
			rotate([0, 0, 30])
			translate([0, 0, -thBodyBottom - 0.5])
				cylinder(d=dHoleHangerOuter, h=thBodyBottom + hHoleHanger + 1, $fn=6);

			// cable-outlets and connector-slots
			for(i = [60:60:360]) {

				rotate([0, 0, i]) {

					// cable outlets
					translate([wStripHolder / 2, dBodyInnerRimShort / 2 - 1, 0])
						cube([wCableOutlet, (thBodyWall + wBodyStripRim) * 3, hBodyStripRim]);

					translate([-wCableOutlet - wStripHolder / 2, dBodyInnerRimShort / 2 - 1, 0])
						cube([wCableOutlet, (thBodyWall + wBodyStripRim) * 3, hBodyStripRim]);

					// connector-slots
					translate([-wCableOutlet - wConnectorHead, (dCapOuterShort + c) / 2 - 0.01, -thBodyBottom])
						connector(c=0);

					translate([wCableOutlet + wConnectorHead, (dCapOuterShort + c) / 2 - 0.01, -thBodyBottom])
						connector(c=0);

				}

			}

		}


		// Diffusor-Abstandshalter / Strip-Haltebolzen und cable-guides
		for(i = [60:60:360]) {

			// spacers
			rotate([0, 0, i])
			translate([0, dBodyInnerShort / 2 - thStrip - c, 0])
			translate([-wStripHolder / 2, -lStripHolder, 0])	// center cube for positioning
				cube([wStripHolder, lStripHolder, hSpacerDiffusor]);

			// cable-guides
			rotate([0, 0, i])
			translate([0, dBodyInnerShort / 2 - offCableGuide, 0])
				cableGuide();

			rotate([0, 0, i + 30])
			translate([0, dBodyInnerShort / 2 - offCableGuide, 0])
				cableGuide();

		}

	}

}


module diffusor() {

	difference() {

		// main diffusor body
		color("white", transparentAlpha)
			cylinder(d=dDiffusor, h=hDiffusor, $fn = 6);

		// carve out shape
		hull() {

			translate([0, 0, -1])
				cylinder(d=dDiffusor - 5, h=1, $fn = 6);	// -5 = little offset to get an rim on bottom of the diffusor

			translate([0, 0, hDiffusor - thDiffusorInner - 1])
				cylinder(d=dDiffusorInner, h=1);

		}

	}

}


module face() {

	color("white", transparentAlpha)
		cylinder(d=dBodyOuter, h=thFace, $fn=6);

}


module cap(outlets=outlets) {

	color("black") {

		difference() {

			// main cap body
			cylinder(d=dCapOuter, h=hBody + thFace + c + thCapRim, $fn=6);

			// inner section
			translate([0, 0, -thCapRim])
				cylinder(d=dCapInner, h=hBody + thFace + c + thCapRim, $fn=6);

			// rim
			translate([0, 0, 2 * thCapRim])
				cylinder(d=dCapRim, h=hBody + thFace + c + thCapRim, $fn=6);

			
			// cable outlets / connector-sections
			for(i = [0:60:300]) {

				if(outlets[i/60] > 0) {

					rotate([0, 0, i]) {

						// calbe outlets
						translate([wStripHolder / 2, dBodyInnerRimShort / 2 - 1, -1])
							cube([wCableOutlet, (thBodyWall + wBodyStripRim) * 3, hBodyStripRim + thBodyBottom + 1]);

						translate([-wCableOutlet - wStripHolder / 2, dBodyInnerRimShort / 2 - 1, -1])
							cube([wCableOutlet, (thBodyWall + wBodyStripRim) * 3, hBodyStripRim + thBodyBottom + 1]);


						// connector-sections
						translate([-wCableOutlet - wConnectorHead, (dCapOuterShort + c) / 2 - 0.01, hConnector / 2 - 0.5])
							cube([wConnectorLink, thBodyWall * 2, hConnector+1], center=true);

						translate([wCableOutlet + wConnectorHead, (dCapOuterShort + c) / 2 - 0.01, hConnector / 2 - 0.5])
							cube([wConnectorLink, thBodyWall * 2, hConnector+1], center=true);


					}

				}

			}

		}

	}

}


module connectorHalf(c=c) {

	translate([0, lConnectorLink / 2, 0]) {

		difference() {

			hull() {

				translate([-(wConnectorHead - 2 * c) / 2, -0.01 + lConnectorHead, 0])
					cube([wConnectorHead - 2 * c, 0.01, hConnector - c]);

				translate([-(wConnectorLink - 2 * c) / 2, 0, 0])
					cube([wConnectorLink - 2 * c, 0.01, hConnector - c]);

			}

			translate([-wConnectorHead / 2, lConnectorHead - c, 0])
				cube([wConnectorHead, c+1, hConnector]);

		}

	}

	translate([-(wConnectorLink - 2 * c) / 2, 0, 0])
		cube([wConnectorLink - 2 * c, lConnectorLink / 2, hConnector - c]);

}


module connector(c=c) {

	color("white") {

		connectorHalf(c);
		mirror([0, 1, 0])
			connectorHalf(c);

	}

}


module connectorBlind(cConnector=c) {

	difference() {

		connector(cConnector);

		translate([ -wConnectorHead - wConnectorLink, -1.5 * c - thCapWall, -hConnector ])
			cube([( wConnectorHead + wConnectorLink ) * 2, ( lConnectorHead + lConnectorLink ) * 2, hConnector * 3]);

	}

}


module cableGuide() {

	translate([-wCableOutlet - wCableGuidePost / 2 - wCableGuidePost, -lCableGuide / 2, 0]) {

		difference() {

			cube([2 * wCableOutlet + wCableGuidePost + 2 * wCableGuidePost, lCableGuide, hCableGuide + thCableGuide]);

			translate([wCableGuidePost, -lCableGuide, -1])
				cube([2 * wCableOutlet + wCableGuidePost, 3 * lCableGuide, hCableGuide + 1]);

		}

	}


	translate([-wCableGuidePost / 2, -lCableGuide / 2])
		cube([wCableGuidePost, lCableGuide, hCableGuide]);


}


module spacer() {

	color("white", transparentAlpha) {

		difference() {

			cylinder(d=dDiffusor, h=hSpacer, $fn = 6);

			translate([0, 0, -1])
				cylinder(d=dDiffusor - 2 * thSpacer, h=hSpacer + 2, $fn = 6);

		}

	}

}


module assembled(outlets=outlets, cConnectors=c) {

	body();

	translate([0, 0, hSpacerDiffusor])
	//color("blue")
		diffusor();

	translate([0, 0, hSpacerDiffusor + hDiffusor + c])
	//color("red")
		spacer();

	translate([0, 0, hBodyInner])
	//color("blue")
		face();

	translate([0, 0, -thBodyBottom])
		cap(outlets);

	for(i = [0:1:5]) {

		if(outlets[i] > 0) {

			// connectors
			rotate([0, 0, i * 60]) {

				translate([-wCableOutlet - wConnectorHead, (dCapOuterShort + c) / 2 - 0.01, -thBodyBottom])
					connector(c=cConnectors);

				translate([wCableOutlet + wConnectorHead, (dCapOuterShort + c) / 2 - 0.01, -thBodyBottom])
					connector(c=cConnectors);

			}

		}
		else {

			// blind connectors
			rotate([0, 0, i * 60]) {

				translate([-wCableOutlet - wConnectorHead, (dCapOuterShort + c) / 2 - 0.01, -thBodyBottom])
					connectorBlind(cConnector=cConnectors);

				translate([wCableOutlet + wConnectorHead, (dCapOuterShort + c) / 2 - 0.01, -thBodyBottom])
					connectorBlind(cConnector=cConnectors);

			}

		}

	}

}


/*****************************
 * RHOMBUS - ELECTRONICS BOX *
 *****************************/

module rhombusCap(addElectronics=false) {

	difference() {

		linear_extrude(height=hBody + thFace + c + thCapRim)
			polygon([
				[0, lRhombusCapOuter / 2],
				[wRhombusCapOuter / 2, 0],
				[0, -lRhombusCapOuter / 2],
				[-wRhombusCapOuter / 2, 0]
			]);

		translate([0, 0, -1])
		linear_extrude(height=hBody + thFace + c + 1)
			polygon([
				[0, lRhombusCapInner / 2],
				[wRhombusCapInner / 2, 0],
				[0, -lRhombusCapInner / 2],
				[-wRhombusCapInner / 2, 0]
			]);

		translate([0, 0, hBody + thFace + c])
			linear_extrude(height=thCapRim * 3, center=true)
				polygon([
					[0, lRhombusCapRim / 2],
					[wRhombusCapRim / 2, 0],
					[0, -lRhombusCapRim / 2],
					[-wRhombusCapRim / 2, 0]
				]);

		if(addElectronics) {

			// cable outlet
			translate([0, -20, dCable / 2 + 5 + thBodyBottom])
			rotate([90, 0, -30])
			union() {
				cylinder(d=dCable, h=20, $fn=32);
				translate([0, -hBodyInner / 2, 10])
					cube([dCable, hBodyInner, 20], center=true);
			}

		}

		// cable outlets
		translate([-(wRhombusCapOuter/2+c)/2, (lRhombusCapOuter/2+c) / 2, 0])
		rotate([0, 0, 30])
		translate([0, -(dCapOuterShort + c) / 2, 1]) {
			translate([wStripHolder / 2, dBodyInnerRimShort / 2 - 1, -1])
				cube([wCableOutlet, (thBodyWall + wBodyStripRim) * 3, hBodyStripRim + thBodyBottom + 1]);

			translate([-wCableOutlet - wStripHolder / 2, dBodyInnerRimShort / 2 - 1, -1])
				cube([wCableOutlet, (thBodyWall + wBodyStripRim) * 3, hBodyStripRim + thBodyBottom + 1]);

			// connector-slots
			translate([-wCableOutlet - wConnectorHead, (dCapOuterShort + c) / 2 - 0.01, -thBodyBottom])
				connector(c=0);

			translate([wCableOutlet + wConnectorHead, (dCapOuterShort + c) / 2 - 0.01, -thBodyBottom])
				connector(c=0);
		}

		mirror([1, 0, 0])
		translate([-(wRhombusCapOuter/2+c)/2, (lRhombusCapOuter/2+c) / 2, 0])
		rotate([0, 0, 30])
		translate([0, -(dCapOuterShort + c) / 2, 1]) {
			translate([wStripHolder / 2, dBodyInnerRimShort / 2 - 1, -1])
				cube([wCableOutlet, (thBodyWall + wBodyStripRim) * 3, hBodyStripRim + thBodyBottom + 1]);

			translate([-wCableOutlet - wStripHolder / 2, dBodyInnerRimShort / 2 - 1, -1])
				cube([wCableOutlet, (thBodyWall + wBodyStripRim) * 3, hBodyStripRim + thBodyBottom + 1]);

			// connector-slots
			translate([-wCableOutlet - wConnectorHead, (dCapOuterShort + c) / 2 - 0.01, -thBodyBottom])
				connector(c=0);

			translate([wCableOutlet + wConnectorHead, (dCapOuterShort + c) / 2 - 0.01, -thBodyBottom])
				connector(c=0);
		}


	}


}



module rhombusBody(addElectronics=false) {

	// body
	difference() {

		translate([0, 0, -thBodyBottom])
		linear_extrude(height=hRhombusBodyInner + thBodyBottom)
			polygon([
				[0, lRhombusBodyOuter / 2],
				[wRhombusBodyOuter / 2, 0],
				[0, -lRhombusBodyOuter / 2],
				[-wRhombusBodyOuter / 2, 0]
			]);


		linear_extrude(height=hRhombusBodyInner + 1)
			polygon([
				[0, lRhombusBodyInner / 2],
				[wRhombusBodyInner / 2, 0],
				[0, -lRhombusBodyInner / 2],
				[-wRhombusBodyInner / 2, 0]
			]);
			
		if(addElectronics) {

			// cable outlet
			translate([0, -20, dCable / 2 + 5])
			rotate([90, 0, -30])
			cylinder(d=dCable, h=20, $fn=32);

		}

		// cable outlets
		translate([-(wRhombusCapOuter/2+c)/2, (lRhombusCapOuter/2+c) / 2, 0])
		rotate([0, 0, 30])
		translate([0, -(dCapOuterShort + c) / 2, 0]) {
			translate([wStripHolder / 2, dBodyInnerRimShort / 2 - 1, 0])
				cube([wCableOutlet, (thBodyWall + wBodyStripRim) * 3, hBodyStripRim]);

			translate([-wCableOutlet - wStripHolder / 2, dBodyInnerRimShort / 2 - 1, 0])
				cube([wCableOutlet, (thBodyWall + wBodyStripRim) * 3, hBodyStripRim]);

			// connector-slots
			translate([-wCableOutlet - wConnectorHead, (dCapOuterShort + c) / 2 - 0.01, -thBodyBottom])
				connector(c=0);

			translate([wCableOutlet + wConnectorHead, (dCapOuterShort + c) / 2 - 0.01, -thBodyBottom])
				connector(c=0);
		}

		mirror([1, 0, 0])
		translate([-(wRhombusCapOuter/2+c)/2, (lRhombusCapOuter/2+c) / 2, 0])
		rotate([0, 0, 30])
		translate([0, -(dCapOuterShort + c) / 2, 0]) {
			translate([wStripHolder / 2, dBodyInnerRimShort / 2 - 1, 0])
				cube([wCableOutlet, (thBodyWall + wBodyStripRim) * 3, hBodyStripRim]);

			translate([-wCableOutlet - wStripHolder / 2, dBodyInnerRimShort / 2 - 1, 0])
				cube([wCableOutlet, (thBodyWall + wBodyStripRim) * 3, hBodyStripRim]);

			// connector-slots
			translate([-wCableOutlet - wConnectorHead, (dCapOuterShort + c) / 2 - 0.01, -thBodyBottom])
				connector(c=0);

			translate([wCableOutlet + wConnectorHead, (dCapOuterShort + c) / 2 - 0.01, -thBodyBottom])
				connector(c=0);
		}


	}




	if(addElectronics) {

		// esp mount / face support
		rotate([0, 0, 90])
		for(x = [-1:2:1]) {
			for(y = [-1:2:1]) {
				translate([x * xDistMountESP / 2, y * yDistMountESP / 2, 0])
					cylinder(d=dHoleMountESP - c, h=hPinMountESP, $fn = 32);
			}
		}


		// dummy ESP
		*translate([-57/2, -28.3/2, 0])
			cube([57, 28.3, 10]);

	}

}


module rhombusFace() {

	linear_extrude(height=thFace)
		polygon([
			[0, lRhombusBodyOuter / 2],
			[wRhombusBodyOuter / 2, 0],
			[0, -lRhombusBodyOuter / 2],
			[-wRhombusBodyOuter / 2, 0]
		]);

}



/*******
 * OUT *
 *******/

//cConnectors = cLow;
//cConnectors = cLower;
cConnectors = c;
//cConnectors = cHigh;
//cConnectors = cHigher;



*assembled(cConnectors=cConnectors);
*body();
*cap();
*connector(c=c);
*spacer();

*rhombusBody(addElectronics=false);
*rhombusBody(addElectronics=true);

*rotate([180, 0, 0])
rhombusCap(addElectronics=false);
*rotate([180, 0, 0])
rhombusCap(addElectronics=true);

*rhombusFace();


*translate([-(dCapOuterShort+c)/2, (dCapOuter+c)/2, 0])
rotate([0, 0, 30])
assembled(cConnectors=cConnectors, outlets=[1, 1, 1, 1, 1, 1]);

*translate([(dCapOuterShort+c)/2, (dCapOuter+c)/2, 0])
rotate([0, 0, 30])
assembled(cConnectors=cConnectors, outlets=[1, 1, 1, 1, 1, 1]);


	*union() {
		color("white")
		rhombusBody(addElectronics=true);

		color("black")
		translate([0, 0, hRhombusBodyInner+c/2])
			rhombusFace();

		color("white")
		translate([0, 0, hRhombusBodyInner+c/2+thFace+c/2])
			rhombusFace();

		color("white", transparentAlpha)
		translate([0, 0, hRhombusBodyInner+c/2+thFace+c/2+thFace+c/2])
			rhombusFace();

		color("black")
		translate([0, 0, -1])
			rhombusCap(addElectronics=true);

	}

// print orientation
*body();
*rotate([180, 0, 0]) cap();
*face();
*rotate([180, 0, 0]) diffusor();
*connector(c=cConnectors);
*connectorBlind(cConnector=cConnectors);


*rotate([180, 0, 0]) cap([1, 1, 1, 1, 1, 1]);
*rotate([180, 0, 0]) cap([0, 1, 1, 1, 1, 1]);
*rotate([180, 0, 0]) cap([0, 0, 1, 1, 1, 1]);
*rotate([180, 0, 0]) cap([0, 0, 0, 1, 1, 1]);


// debug
*difference() {

	assembled();

	translate([0, 0, -10])
		cube([100, 100, 50]);

}



*union() {
	translate([-(dCapOuter / 2 + 0), 0, 0]) {
		assembled(cConnectors=cConnectors);
		translate([0, dCapOuterShort + c, 0])
			assembled(cConnectors=cConnectors);
		rotate([0, 0, -60])
		translate([0, dCapOuterShort + c, 0])
			assembled(cConnectors=cConnectors);
	}

	rotate([0, 0, 30])
	translate([0, -dCapOuter / 4, 0])
		rhombusBody();
}
