#
# XML for Legume Origins Google Map
#

xml.instruct! :xml, :version => "1.0" 
xml.markers do
    for l in @legumes
      xml.marker(
        :name => l.name,
        :short_name => l.short_name,
        :overview => l.lotja_content.overview,
        :lat => l.lotja_content.origin_lat,
        :lng => l.lotja_content.origin_long
      )
    end
end
