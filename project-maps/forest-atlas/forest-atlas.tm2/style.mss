// Color palette //
@road:  #fff;
@land:  #E6E5E1;

@fill1: #fff;
@fill2: #bbb;
@fill3: #777;
@fill4: #7e6758;

@text1: #fff;
@text2: #bbb;
@text3: #ccc;
@text4: #999;

Map { background-color: @land; }

// Water Features //
#water {
  ::shadow {
    polygon-fill: mix(@land,@fill4,60);
  }
  ::fill {
    // a fill and overlay comp-op lighten the polygon-
    // fill from ::shadow.
    polygon-fill: @land;
    comp-op: soft-light;
    // blurring reveals the polygon fill from ::shadow around
    // the edges of the water
   image-filters: agg-stack-blur(10,10);
  }
}

// Water color is calculated by sampling the resulting color from
// the soft-light comp-op in the #water layer style above. 
@water: mix(@land,@fill4,60);

#waterway {
  [type='river'],
  [type='canal'] {
    line-color: @water;
    line-width: 0.5;
    [zoom>=12] { line-width: 1; }
    [zoom>=14] { line-width: 2; }
    [zoom>=16] { line-width: 3; }
  }
  [type='stream'] {
    line-color: @water;
    line-width: 0.5;
    [zoom>=14] { line-width: 1; }
    [zoom>=16] { line-width: 2; }
    [zoom>=18] { line-width: 3; }
  }
}

// Political boundaries //
#admin[admin_level=2][maritime=0] {
  line-join: round;
  line-color: #97928E;
  line-width: 0.8;
  [zoom>=5] { line-width: 1.2; }
  [zoom>=6] { line-width: 1.6; }
  [zoom>=8] { line-width: 2; }
  [zoom>=10] { line-width: 3; }
  [disputed=1] { line-dasharray: 4,4; }
} 
