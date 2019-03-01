import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import "bootstrap";

import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { initProfileMapbox } from '../plugins/init_profile_map';

initMapbox();
initAutocomplete();
initProfileMapbox();

