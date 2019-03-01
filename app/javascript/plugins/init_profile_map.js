import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';


const profileMapElement = document.getElementById('profile-map');

const buildProfileMap = () => {
  mapboxgl.accessToken = profileMapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'profile-map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
};


const fitProfileMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initProfileMapbox = () => {
  if (profileMapElement) {
    const map = buildProfileMap();
    const markers = JSON.parse(profileMapElement.dataset.markers);
    markers.forEach((marker) => {
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(map);
    });
    fitProfileMapToMarkers(map, markers);
  }
};

export { initProfileMapbox };

