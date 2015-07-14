// Color palette //
@road:  #fff;
@land:  #F6F5F0;

@fill1: #fff;
@fill2: #bbb;
@fill3: #777;
//@fill4: #8C6900;
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