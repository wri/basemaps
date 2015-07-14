Map {
  background-color:lighten( #F3EFE1, 3);
}

////////////////////////////////////////////////
// Water features //
////////////////////////////////////////////////

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
@water: mix(@land,@fill4,50);

#waterway {
  [type='river'],
  [type='canal'] {
    line-color:  mix(@land,@fill4,60);
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


////////////////////////////////////////////////
// Landcover (will be part of terrain) //
////////////////////////////////////////////////

#landcover {
  ::0[zoom<=12],
  ::1[zoom>=13][zoom<=14],
  ::2[zoom=15],
  ::3[zoom=16],
  ::4[zoom=17],
  ::5[zoom>=18] { 
    [class="wood"] { polygon-fill: @wooded; }
    [class="scrub"] { polygon-fill: @scrub; } 
    [class="grass"] { polygon-fill: @grass; } 
    [class="crop"] { polygon-fill: @crop; } 
    [class="snow"] { polygon-fill: lighten( @landcover, 3); }    
  }
 ::1[zoom>=13][zoom<=14] { image-filters: agg-stack-blur(1,1); }
 ::2[zoom=15] { image-filters: agg-stack-blur(4,4);  }
 ::3[zoom=16] { image-filters: agg-stack-blur(8,8); }
 ::4[zoom=17] { image-filters: agg-stack-blur(16,16); }
 ::5[zoom>=18] { image-filters: agg-stack-blur(32,32); }
}


////////////////////////////////////////////////
// Terrain //
////////////////////////////////////////////////

#hillshade [zoom<=18] {
  ::low[zoom<=12],
  ::1[zoom>=13][zoom<=14],
  ::2[zoom=15],
  ::3[zoom=16], 
  ::4[zoom=17],
  ::5[zoom=18]  {
    polygon-clip: false;
    [class='full_shadow'] {
      polygon-fill: #333;
      polygon-opacity: 0.05;
      polygon-comp-op: multiply;   
      [zoom>=6] { polygon-opacity:0.08; }
      [zoom>=10] { polygon-opacity:0.1; } 
      [zoom>=16] { polygon-opacity:0.07; } 
      [zoom=17] { polygon-opacity:0.05; }
      [zoom=18] { polygon-opacity:0.03; }  
    }
    [class='medium_shadow'] {
      polygon-fill: #D4CFC1;
      polygon-opacity: 0.05;
      polygon-comp-op: multiply;     
      [zoom>=6] { polygon-opacity:0.08; }     
      [zoom>=10] { polygon-opacity:0.1; }  
      [zoom>=15] { polygon-opacity:0.07; } 
      [zoom>=16] { polygon-opacity:0.05; } 
      [zoom=17] { polygon-opacity:0.04; }
      [zoom=18] { polygon-opacity:0.03; }   
    }
    [class='medium_highlight'] {
      polygon-fill: #D4C39C;
      polygon-opacity: 0.3;  
      [zoom>=6] { polygon-opacity:0.4; }     
      [zoom>=10] { polygon-opacity:0.45; }    
      [zoom>=16] { polygon-opacity:0.25; polygon-fill: #fff; } 
      [zoom=17] { polygon-opacity:0.15; } 
      [zoom=18] { polygon-opacity:0.05; }    
    }
    [class='full_highlight'] {  
      polygon-fill: #fff;
      polygon-opacity: 0.3; 
      [zoom>=6] { polygon-opacity:0.35; }    
      [zoom>=10] { polygon-opacity:0.4; } 
      [zoom>=16] { polygon-opacity:0.25; } 
      [zoom=17] { polygon-opacity:0.15; } 
      [zoom=18] { polygon-opacity:0.05; }    
    }
  }
  ::1[zoom>=13][zoom<=14] { image-filters: agg-stack-blur(1,1); }
  ::2[zoom=15] { image-filters: agg-stack-blur(4,4);  }
  ::3[zoom=16] { image-filters: agg-stack-blur(8,8); }
  ::4[zoom=17] { image-filters: agg-stack-blur(16,16); }
  ::5[zoom=18] { image-filters: agg-stack-blur(32,32); }
}


////////////////////////////////////////////////
// Landuse //
////////////////////////////////////////////////
/*
// Woods and scrubs //
#landuse {
  ::greenery {
    [class='wood'] { polygon-fill: @wooded; }
      [class='scrub'] { polygon-fill: @scrub; }
      [class='grass'] { polygon-fill: @grass }
      [class='wood'],[class='scrub'],[class='grass'] {
        polygon-opacity: 0.7;  
        [zoom=7] { polygon-opacity: 0.2; }
        [zoom=8] { polygon-opacity: 0.5; }   
      }
    }
 }
*/
// Parks //
#landuse {
  [class='park'] { 
    polygon-fill: @park;
    [zoom=7] { polygon-opacity: 0.2; }
    [zoom=8] { polygon-opacity: 0.5; }
    [zoom=9] { polygon-opacity: 0.9; }
  }
}

// Pitches //
  // Low zoom
 #landuse {
  [class='pitch'][zoom<=17] {
    polygon-fill: @park;
    line-color: lighten(@park, 10);
    line-width: 1;
    [zoom=17] { line-width: 1.5; }
  }
}
  // High zoom
 #landuse {
  [class='pitch'][zoom>=18] {
    ::wall {
    line-color: lighten(@park, 10);
    line-width: 3;
    line-join: round;
    line-cap: round;
    polygon-fill: lighten(@park, 10);
  }    
    ::roof {
      polygon-fill: @park;
      polygon-geometry-transform: translate(-2,-2);
      polygon-clip: false;
      [zoom>=15] {  
      line-width: 1;
      line-color: lighten(@park, 10);
      line-geometry-transform:translate(-2,-2);
      line-clip:false;
      }
    }   
  }
}

// All other landuse //
/*
#landuse {
  [class='sand'] {
    polygon-fill: @sand;
  }
  [class='school'] {
    polygon-fill: @school;
    line-color: @gray-3;
  }
  [class='cemetery'] {
    polygon-fill: @cemetery;
  }
  [class='hospital'] {
    polygon-fill: @hospital;
    line-color: @gray-3;
  }
  [class='parking'] {
    polygon-fill: @parking;
    [zoom>=16] {
      line-color: @building_line;
      line-dasharray: 5,2;
      line-width: 0.5;  
      [zoom>=17] { line-width: 1; }
    }
  }
  [class='industrial'] {
    polygon-fill: @industrial;
  }
  [class='piste'] {
    polygon-fill: @piste;
  }
  [class='glacier'] {
    polygon-fill: @glacier;
  }
}
*/



////////////////////////////////////////////////
// Buildings //
////////////////////////////////////////////////

#building [zoom>=13][zoom<=17] {
  polygon-fill: @building;
  line-color: @building_line;
  line-width: 0.5;
  [zoom=16] { polygon-opacity: 1; }
  [zoom=17] { 
    polygon-opacity: 1; 
    line-width: 1;
  }
}