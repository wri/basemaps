# WRI basemaps

Basemaps for WRI projects.

**Base layer**

Layer name | Description | Mapbox ID
------ | ------ | ------
WRI Mono | Plain canvas backdrop | wri.c974eefc
WRI Contextual | Contextual backdrop | wri.b71b0f45

**Label layer**

Layer name | Description | Mapbox ID
------ | ------ | ------
WRI Labels | English labels | wri.acf5a04e
WRI Labels Localized | Labels in local language | wri.b677c4f8
WRI Labels Localized IN | Labels in local language (India boundaries) | wri.99740e02
WRI Labels Localized CN | Labels in local language (China boundaries) | wri.4d3dc5a3


### Usage
Basemaps can be accessed through any API that can consume web tiles. These maps are made with OpenStreetMap and MapBox data so must show attribution.

**Public access token**

```pk.eyJ1Ijoid3JpIiwiYSI6IjU3NWNiNGI4Njc4ODk4MmIyODFkYmJmM2NhNDgxMWJjIn0.v1tciCeBElMdpnrikGDrPg ```

**ArcGIS JS API**

```
var map;

require(["esri/map", "esri/layers/WebTiledLayer"],
  function(Map, WebTiledLayer) {
    map = new Map("map", {
      center: [-77.0164, 38.9047],
      zoom: 5
    });

  var baseLayer = new WebTiledLayer("https://api.tiles.mapbox.com/v4/wri.c974eefc/${level}/${col}/${row}.png?access_token=pk.eyJ1Ijoid3JpIiwiYSI6IjU3NWNiNGI4Njc4ODk4MmIyODFkYmJmM2NhNDgxMWJjIn0.v1tciCeBElMdpnrikGDrPg", {});
  var labelLayer = new WebTiledLayer("https://api.tiles.mapbox.com/v4/wri.acf5a04e/${level}/${col}/${row}.png?access_token=pk.eyJ1Ijoid3JpIiwiYSI6IjU3NWNiNGI4Njc4ODk4MmIyODFkYmJmM2NhNDgxMWJjIn0.v1tciCeBElMdpnrikGDrPg", {});
  map.addLayer(baseLayer);
  map.addLayer(labelLayer);
});
```

**Leaflet**
```
var map = L.map("map").setView([-77.0164, 38.9047], 5);

var baseLayer = L.tileLayer("https://api.tiles.mapbox.com/v4/wri.c974eefc/{z}/{x}/{y}.png?access_token=pk.eyJ1Ijoid3JpIiwiYSI6IjU3NWNiNGI4Njc4ODk4MmIyODFkYmJmM2NhNDgxMWJjIn0.v1tciCeBElMdpnrikGDrPg", {}).addTo(map);
var labelLayer = L.tileLayer("https://api.tiles.mapbox.com/v4/wri.acf5a04e/{z}/{x}/{y}.png?access_token=pk.eyJ1Ijoid3JpIiwiYSI6IjU3NWNiNGI4Njc4ODk4MmIyODFkYmJmM2NhNDgxMWJjIn0.v1tciCeBElMdpnrikGDrPg", {}).addTo(map);
```

**Static images (png, jpg)**

You can export static versions of each layer from [Mapbox Studio](https://www.mapbox.com/mapbox-studio/). [Download](https://github.com/wri/basemaps/archive/master.zip) this repository and open the desired layer in Mapbox Studio (Projects -> Browse). Tap the picture button in the far top-right corner to export. Thedetail of the map changes depending on zoom level, so make sure you are at the desired zoom level before exporting.
