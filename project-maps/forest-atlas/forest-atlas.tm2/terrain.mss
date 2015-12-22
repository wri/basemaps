#hillshade {
  ::0[zoom<=14],
  ::1[zoom=15],
  ::2[zoom=16],
  ::3[zoom>=17] {
    image-filters-inflate: true;
    comp-op: hard-light;
    [class='shadow'] {
      polygon-fill: rgba(0,0,0,0.075);
    }
    [class='highlight'] {
      polygon-fill: rgba(255,255,255,0.125);
    }
  }
  ::1 { image-filters: agg-stack-blur(2,2); }
  ::2 { image-filters: agg-stack-blur(4,4); }
  ::3 { image-filters: agg-stack-blur(8,8); }
}