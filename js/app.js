$(document).ready(function() {

L.mapbox.accessToken = 'pk.eyJ1Ijoid3JpIiwiYSI6Ik9TY2w5RTQifQ.0HV7dQTjK40mk7GpNNA64g';
  var map = L.mapbox.map('map', null, {
      maxZoom: 18
  }).setView([30.0599153,31.2620199], 4);

  var baseLayers = {
      'Mono': L.mapbox.tileLayer('wri.c974eefc'),
      'Context': L.mapbox.tileLayer('wri.b71b0f45')
  };
  var overlays = {
      'Example Data Layer': L.tileLayer.wms("http://gis.wri.org/arcgis/services/Aqueduct/aqueduct_projections_2014/MapServer/WMSServer",{layers:'1', opacity: 0.5, transparent:true,format:'image/png'}),
      'Example Data Layer 2': L.mapbox.tileLayer('devseed.malaria-color'),
      'English labels': L.mapbox.tileLayer('wri.acf5a04e'),
      'Locale labels': L.mapbox.tileLayer('wri.b677c4f8'),
      'China labels & boundaries': L.mapbox.tileLayer('wri.4d3dc5a3'),
      'India labels & boundaries': L.mapbox.tileLayer('wri.99740e02'),
  };
		

  baseLayers.Mono.addTo(map);
  L.control.layers(baseLayers, overlays).addTo(map);
  
  $('#nav a').click(function(e) {
    $('#nav a').removeClass('active');
    $(this).addClass('active');
  });
  
  $('a#logo').click(function(e) {
    e.preventDefault();
    map.setView([30.0599153,31.2620199], 6);
  });
  
  $('a#world').click(function(e) {
    e.preventDefault();
    map.setView([0,0], 2);
  });
  
  $('a#mexico').click(function(e) {
    e.preventDefault();
    map.setView([18.6271195,-97.8573248], 6);
  });
  
  $('a#kenya').click(function(e) {
    e.preventDefault();
    map.setView([-0.360425,39.7605035], 6);
  });
  
  $('a#cairo').click(function(e) {
    e.preventDefault();
    map.setView([30.0599153,31.2620199], 12);
  });
  
  
  map.on('zoomend', function() {
    var zoom = map.getZoom();
    $('#zoom-level').empty().append(zoom);
  });
  
});

