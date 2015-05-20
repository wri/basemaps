////////////////////////////////////////////////
// COLORS //
////////////////////////////////////////////////

@black: #222;
@gray-1: #8C6900;
@gray-2: #8C6900;
@gray-3: #8C6900;
@gray-4: #8C6900;
@gray-5: #666;

@fill1: #fff;
@fill2: #bbb;
@fill3: #777;
//@fill4: #8C6900;
@fill4: #7e6758;

@blue: #EFEAD9;
@blue_lt:  #8C6900;
@yellow: #eee;
@blue-gray:  #8C6900;
//@green: #eee;
@green: lighten(@gray-1, 50);
@green-desat: desaturate(lighten(@gray-1, 30), 45);

@land:  #F6F5F0;
@sand: mix(@yellow, @land, 15);
@snow: lighten(desaturate(@blue, 45), 35);

@building:          lighten( #F3EFE1, 10);
@building_line:     darken( #F3EFE1, 10);

// Landcover //
@landcover: #F3EFE1;
@vegitation: #ebefde;

@park: darken( @vegitation, 2);
//@wooded:darken( @landcover, 3);
@wooded: darken( @vegitation, 3);
@scrub: darken( @landcover, 0);
@grass: lighten( @landcover, 0);
@crop: lighten( @landcover, 0);
//@grass: mix( @landcover, @vegitation, 1);
//@crop: mix( @landcover, @vegitation, 1);
@snow: lighten( @landcover, 3);

