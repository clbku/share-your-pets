import { useEffect, useRef } from "react"
import mapboxgl from 'mapbox-gl'

import 'mapbox-gl/dist/mapbox-gl.css';

const INITIAL_CENTER = [
  -74.0242,
  40.6941
] as [number, number];
const INITIAL_ZOOM = 13;


export const Map: React.FC = (props) => {
  const mapRef = useRef<mapboxgl.Map>(null)
  const mapContainerRef = useRef<HTMLDivElement>(null)

  useEffect(() => {
    mapboxgl.accessToken = import.meta.env.VITE_MAPBOX_TOKEN;
    mapRef.current = new mapboxgl.Map({
      container: mapContainerRef.current!,
      center: INITIAL_CENTER,
      zoom: INITIAL_ZOOM,
      style: 'mapbox://styles/mapbox/navigation-night-v1'
    });

    return () => {
      mapRef.current!.remove()
    }
  }, [])

  return (
    <>
      <div id='map-container' ref={mapContainerRef} />
    </>
  )
}
