// Languages: name (local), name_en, name_fr, name_es, name_de
@name: '[name_en]';

// Fonts //
@sans: 'Arial Unicode MS Regular';
@sans_bold: 'Arial Unicode MS Regular';

/*
This style is designed to be easily recolored by adjusting the color
variables below. For predicatable feature relationships,
maintain or invert existing value (light to dark) scale.
*/

// Color palette //
@road:  #fff;
@land:  #F6F5F0;

@fill1: #fff;
@fill2: #bbb;
@fill3: #777;
@fill4: #8C6900;

@text: #333;
@text1: #fff;
@text2: #bbb;
@text3: #ccc;
@text4: #999;

@water: mix(@land,@fill4,80);

// Political boundaries //
#admin[admin_level=2][maritime=0] {
  line-join: round;
  line-color: #fff;
  line-width: 1;
  [zoom>=5] { line-width: 1.4; }
  [zoom>=6] { line-width: 1.8; }
  [zoom>=8] { line-width: 2; }
  [zoom>=10] { line-width: 3; }
  [disputed=1] { line-dasharray: 4,4; }
}


