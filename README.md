# Hexaleafs - Yet another take on Nanoleaf-inspired Hexagons :)
![preview of the finished project](./img/preview_03.jpg)

## Aim
- Selfmade Nanoleaf-like lamp-thingy :)
- Good light diffusion with invisible LED-spots
- Print as many parts as possible using a 3d printer

## My result
- Good light diffusion by using printed diffusors
- Generic design with single hexagons, that can be interlinked - even though, once assembled, the design can't be change anymore
- Easy setup using WLED

## BOM for building the Hexaleafs as shown in the pictures
### Parts to buy
- WS2812B LED-Strip with white PCB and 30 or 60 LEDs/m. Length depending on your design (30 LEDs/m = 12 LEDs per hex, 60 LEDs/m = 24 LEDs per hex. In my case I used a 5m and a 1m strip of these 60LEDs/m strips: https://www.amazon.de/gp/product/B01CDTEG1O/ref=ppx_yo_dt_b_asin_title_o03_s00?ie=UTF8&psc=1)
- Black Filament (I used this PETG: https://www.dasfilament.de/filament-spulen/petg-1-75-mm/158/petg-filament-1-75-mm-schwarz)
- White Filament (I used this PETG: https://www.dasfilament.de/filament-spulen/petg-1-75-mm/157/petg-filament-1-75-mm-weiss)
- Clear Filament (I used this PETG: https://www.dasfilament.de/filament-spulen/petg-1-75-mm/136/petg-filament-1-75-mm-natur)
- Flexible, white wire (I used ~10 meters 22AWG)
- ESP32 (pin spacing: 52mm, 23mm, I used this one: https://www.banggood.com/ESP32-Development-Board-WiFi+bluetooth-Ultra-Low-Power-Consumption-Dual-Cores-ESP-32-ESP-32S-Board-Geekcreit-for-Arduino-products-that-work-with-official-Arduino-boards-p-1109512.html?cur_warehouse=CN&ID=6300464&rmmds=search If you can’t find one matching the pins spacing, you could also use just 2 of the 4 pins to hold the ESP32 and remove the unneeded pins or customize the .scad-file)
- Crimping-Tool and DuPont-Connectors (2x 3 pin connectors per hex, plus some additional connectors for power distribution)
- 5V power supply (I’m currently using this 8A power supply: https://www.amazon.de/LED-Netzteil-MeanWell-LPV-60-5-Schaltnetzteil/dp/B00MWQF08C/ref=sr_1_5?keywords=meanwell+5v+8a&qid=1642237318&sr=8-5 which is still underpowered for the huge amount of LEDs… Be careful when configuring the power limit in WLED!)
- 2-wire cable to connect the power supply to the ESP32
- (2-wire cable to connect the power supply to mains – depending on power supply)
- some shrinking tube
- soldering iron and solder

### Parts to print
#### White:
- 14x [body.stl](./stl/clearance_0.3mm/body.stl)
- ~70x [connector_c_0.1mm_default.stl](./stl/clearance_0.3mm/connector_c_0.1mm_default.stl)
- ~60x [connectorBlind_c_0.1mm_default.stl](./stl/clearance_0.3mm/connectorBlind_c_0.1mm_default.stl)
- 1x [rhombusBody_no_electronics.stl](./stl/clearance_0.3mm/rhombusBody_no_electronics.stl)
- 1x [rhombusBody_with_electronics.stl](./stl/clearance_0.3mm/rhombusBody_with_electronics.stl)
- 2x [rhombusFace_0.8mm.stl](./stl/clearance_0.3mm/rhombusFace_0.8mm.stl)

**Additional information:**
The mm-value in the filename of the connectors show the clearance of these components. 0.1mm was the value I used so that the connectors are a snug fit. You might need to use a different file here. Example: connectorBlind_c_0.1mm_default.stl - 0.1mm clearance.
**connectorBlind** is used only to block light on the outer leafs of your structure.

#### Black:
- 4x [cap_111111.stl](./stl/clearance_0.3mm/cap_111111.stl)
- 3x [cap_011111.stl](./stl/clearance_0.3mm/cap_011111.stl)
- 2x [cap_001111.stl](./stl/clearance_0.3mm/cap_001111.stl)
- 5x [cap_000111.stl](./stl/clearance_0.3mm/cap_000111.stl)
- 1x [rhombusCap_no_electronics.stl](./stl/clearance_0.3mm/rhombusCap_no_electronics.stl)
- 1x [rhombusCap_with_electronics.stl](./stl/clearance_0.3mm/rhombusCap_with_electronics.stl)
- 2x [rhombusFace_0.8mm.stl](./stl/clearance_0.3mm/rhombusFace_0.8mm.stl)

Additional information:
The cap uses a bit masking in the filename. There are 6 sides of the cap. If the side covers the holes of the base there will be a 0 in the filename. If the holes are not covered and thus usable there will be a 1.
Example: cap_111111.stl - all 6 sides are accessible / cap_000111.stl - 3 sides are covered, 3 sides are accessible
This is important as you do not want open holes at the edge of your structure as it may leak light.

#### Clear:
- 14x [diffusor_5mm.stl](./stl/clearance_0.3mm/diffusor_5mm.stl) - !! 50% infill, rectlinear infill pattern !!
- 14x [face_0.8mm.stl](./stl/clearance_0.3mm/face_0.8mm.stl)
- 14x [spacer_0.8mm.stl](./stl/clearance_0.3mm/spacer_0.8mm.stl)
- 2x [rhombusFace_0.8mm.stl](./stl/clearance_0.3mm/rhombusFace_0.8mm.stl)

### Print settings
#### Default
Most of the parts don't require specific settings. Just use your default profile.

#### Diffusor
When printing the diffusor, make sure, to set the infill to 50% rectlinear. This way you get a proper diffusion.

---
## General Structure of a Hexaleaf
The printed body with its LED strip already inserted
![hexaleaf body with inserted LED strip](./img/body_led.jpg)

After adding diffusor and spacer
> Caution! The diffusor must be inserted with the flat side UP.

![hexaleaf body with diffusor and spacer](./img/body_diffusor.jpg)

After adding face and cap (I don't have pics of a single, assembled hexaleaf... sorry)
![hexaleaf body with diffusor and spacer](./img/finished_off.jpg)

The whole assembly is held toghether by the connectors, unused connector slots are closed with the "blind" connectors
![connectors](./img/connector.jpg)
![connectors blind](./img/connectors_blind.jpg)


## LED-Strip & body preparation
To get your LED-Strips ready, they need to be cut, have wires soldered on and finally be bent.
1. Cut your strip in pieces of 12 (@30LEDs/m) or 24 (@60LEDs/m) LEDs each. You need as many strip-pieces, as you have bodies. **Caution!** The long LED strips you can buy, are made up of several shorter strips, that are soldered together. These solder joints can't get bent and are a severe problem, if they occur in one of the corners of a hexaleaf. To prevent this issue, I checked my strips before cutting them. Count the number of LEDs from the beginning of the strip to the first joint, where two strips are soldered together. If the number is even, remove the first LED from your strip. This way, the solder joints will never be in a corner and, if you have a 60 LEDs/m strip, also never be at one of the posts, holding the strip in place.
2. Prepare 6 strips of wire with a length of 10-11cm, using the white wire. Strip the insulation on one side for about 3-5mm, so can solder the wire easily to the pads on the LED-strips. On the other side, remove just a little bit of shielding (~2mm) as preparation for the crimping. Coat the side with more insulation removed with a nice layer of tin and crimp a DuPont-connector to the other side. In the end, you'll need 3 male and 3 female connectors. Don't add the connector housing yet, as the wires are easier to solder to the strip without it.
3. Solder the 3 wires with the **male** DuPont-connectors to the **input side** of your LED-strip pieces. On most of the strips, the input side is marked with DI, while the output is marked with DO (besides VCC and GND). You can also recognize the input by the little arrow, printed on the pcb. If it points away from the solder pads, it's the input side, if it points towards the solder pads, it's the output side. After you finished the input-side, solder the remaining 3 wires, with the **female** DuPont-connectors, to the **output side** of the strip.
4. Insert the 3 male, as well as the 3 female connectors in a 3-pin-housing each. When doing this step, make sure you are using the same wire order for each and every connector. My connector housings had a little arrow embedded on one of the outermost pins. So I build up every connector by inserting GND into the slot with the arrow, the Data-Pin into the center slot and finally VCC into the remaining slot. This way, when connecting the hexaleafs later on, you can be sure which pin is which and don't get confused. Just plug "the arrows" together :)
5. After the wires are soldered to the strip, it's a good idea to pre-bend your strip. This makes the assembly way easier. To do this, use a ruler and, depending on your strip type, count 2 (30 LEDs/m) or 4 (60 LEDs/m) LEDs from the beginning of the strip. Place the edge of the ruler on the middle of the solder pads, that come **after** the 2nd/4th LED, with the LEDs facing towards you. Now bend the strip upwards and toward you. Repeat this until you made 5 bends.
Your strip should now look something like this: ![prepared led strip](./img/led_strip_prepared.jpg)
6. Insert the finished LED strip in one of your prepared bodies. While doing so, you'll notice, that the beginning and end of each strip doesn't fit that well, because of the solder joints where the wires are attached. To circumvent this issue, simply bend the strips here as well, so that your finished body looks like this: ![hexaleaf body with inserted LED strip](./img/body_led.jpg)
7. Repeat for each of the LED strip pieces/bodies you need.

## Combining the bodies / assembling the layout
1. Lay out the prepared body-parts in the layout you want to use. While doing so, make sure, that the start/end-corner (where each strip starts and ends) of each hexaleaf is facing the same direction. This way, the effects, the hexaleafs will play later on, will all start in the same spot of each hexaleaf and travel in the same way through each hexaleaf, as well as through your layout. In my case, I put all start/end-corners to the lower right, as I felt it looked the nicest. Also, don't forget to include the [rhombusBody_with_electronics](./stl/clearance_0.3mm/rhombusBody_with_electronics.stl) in your layout, as it is mandatory for storing the ESP.
2. Now start by taking one of the layed out bodies and insert 2 of the printed [connectors](./stl/clearance_0.3mm/connector_c_0.1mm_default.stl) on each side, where another body or a rhombus body will be connected. I inserted the connectors from the bottom, without turning the respective body around. This way, I made sure I don't accidentially rotate something or make any other layout-mistakes.
3. Now take one of the bodies, that should connect to the one you just prepared and just clip them together. After this, add the connectors to this new body, as needed. It might look something like this: ![body with rhombus body connected](./img/body_first_connections.jpg) And later like this: ![most of the bodies connected to form the final layout](./img/body_most_connections_done.jpg)
4. Work your way through the whole layout, until all bodies are connected.
5. As soon as all bodies are connected, you can turn the whole thing around to make sure all connectors are sitting tight and flat. If some of the connectors are sticking out a bit, push them in, so the surface of the back gets nice and flat. Also, put [blind connectors](./stl/clearance_0.3mm/connectorBlind_c_0.1mm_default.stl) and all the remaining connector slots. This way, you minimize light leakage in the finished assembly. My finnished assembly looked like this from the back: ![layout finished from the back](./img/layout_finished_back.jpg) With nice and flat connectors: ![connectors from the back](./img/connectors_back.jpg)
6. You can now turn the whole assembly around again and start working on the LED-Strip connections.


## LED-Strip-Connections
For smooth animations and effects using WLED and the layout shown here, it's important to have a symmetrical layout for the LED-strips.
The trick used here is wiring some of the strips in parallel, so the respective hexaleafs always perform the same effects.

### The connection-layout I used looks as follows
The numbers and arrows within the single hexaleafs show the connection-order. So hexaleaf 1 is connected to 2, hexaleaf 2 to 3 and so on. Especially the hexaleaf marked with 3 and the upper one marked with 4 are important, because they each contain a split, where the strips start to be wired in parallel (as shown by 2 or 3 arrows pointing to the next hexaleafs).
- Caution! The parallel connection of the following LED-strips must occur at the output of the respective hexaleafs LED-strip, not on the input side.
![led-strip layout 01](./img/led_layout_01.png)

Another layout I came up with after finishing this project looks like this:
![led-strip layout 02](./img/led_layout_02.png)

Also, here is a example for a completely different layout, I came up with:
![hexaleaf layout alternative 01](./img/layout_alt_01.png)

Example for a Y-splitter with additional power injection, where the middle pin is Data and the outer pins are 5V and GND
![y-splitter with additional power injection](./img/y_splitter_power_injection.jpg)


## Parts needed for one hexaleaf
#### Electronics:
- LED-strip (12 LEDs @ 30 LEDs/m, 24 LEDs @ 60 LEDs/m) - obviously 60 LEDs/m is much brighter
- 2x 3-Pin DuPont-Connector
- (Optional) Y-splitter to connect LED-strips in parallel
- (Optional) Power-Adapter to inject 5V to various points in your design

#### White:
- 1x body.stl
- 12x connectors (blind) – amount of blind and standard connectors depends on amount of connected hexes

#### Black:
- 1x cap xxxxxx.stl (which stl file depends on connected hexes, 0 = no outlets to next hex, 1 = includes outlets to next hex)

#### Clear:
- 1x diffusor – 5mm.stl
- 1x face 0.8mm.stl
- 1x spacer.stl


