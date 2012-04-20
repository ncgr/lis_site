/**
 * Javascript to generate the markers on the Google Map.
 *
 * See the Google Maps API http://code.google.com/apis/maps/index.html
 * and http://econym.org.uk/gmap/ for more information.
 * Thanks to both for compiling such great resources.
 * --------------------------------------------------------------------
 */

var gmarkers = [];
var htmls = [];

var map = new GMap2(document.getElementById("species-map"));
map.addControl(new GLargeMapControl());
map.addControl(new GMapTypeControl());
map.enableScrollWheelZoom();
map.setMapType(G_HYBRID_MAP);

function loadMap() {
  if (GBrowserIsCompatible()) {
    map.setCenter(new GLatLng(0.0, 0.0), 1);

    // Read the xml data
    GDownloadUrl('/pages/legume_origins.xml', function(data) {
        var xml = GXml.parse(data);
        var markers = xml.documentElement.getElementsByTagName("marker");

        for (var i = 0; i < markers.length; i++) {
          var lat = parseFloat(markers[i].getAttribute("lat"));
          var lng = parseFloat(markers[i].getAttribute("lng"));

          // set the lat and lng as a point
          var point = new GLatLng(lat,lng);

          // set up the vars for the html[]
          var name = markers[i].getAttribute("name");
          var short_name = markers[i].getAttribute("short_name");
          var overview = markers[i].getAttribute("overview");

          overview = overview.substring(0, 300);

          var html = "<p><strong>" + name + "</strong></p>";
          html += "<div id='map-info'><p><img src='http://" + short_name + ".comparative-legumes.org/images/" + short_name + ".png'" +
          "alt='' />" + overview + " ...</p></div>";
          html += "<p><a href='http://" + short_name + ".comparative-legumes.org'>Read More &raquo;</a></p>";

          // create the marker
          var marker = createMarker(point, name, html);
          // add it to the map
          map.addOverlay(marker);
        }
    });
  } else {
    alert("Sorry, your browser is not compatible with Google Maps.");
  }
}

// A function to create the marker and set up the event window
function createMarker(point, name, html) {
  var marker = new GMarker(point);

  var opts = {};
  // max width - height of the marker window
  opts.maxWidth = 300;
  opts.maxHeight = 160;

  var i = gmarkers.length;

  GEvent.addListener(marker, "click", function() {
      marker.openInfoWindowHtml(html, opts);
      });
  gmarkers.push(marker);
  htmls[i] = html;

  return marker;
}
