<template>
    <div class="relative">
        <div
            ref="mapContainer"
            class="w-full h-96 rounded-lg border-2 border-gray-300 shadow-lg"
        ></div>

        <!-- Legend -->
        <div
            class="absolute top-4 right-4 bg-white rounded-lg shadow-lg p-3 z-[1000]"
        >
            <h4 class="text-xs font-bold text-gray-900 mb-2">Keterangan:</h4>
            <div class="space-y-1.5 text-xs">
                <div class="flex items-center gap-2">
                    <div
                        class="w-3 h-3 bg-blue-500 rounded-full border-2 border-white shadow"
                    ></div>
                    <span class="text-gray-700">Lokasi Anda</span>
                </div>
                <div class="flex items-center gap-2">
                    <div
                        class="w-3 h-3 bg-red-500 rounded-full border-2 border-white shadow"
                    ></div>
                    <span class="text-gray-700">Lokasi Seharusnya</span>
                </div>
                <div class="flex items-center gap-2">
                    <div
                        class="w-3 h-3 bg-red-200 rounded-full border border-red-400"
                    ></div>
                    <span class="text-gray-700">Radius {{ radius }}m</span>
                </div>
            </div>

            <!-- Distance Info -->
            <div
                v-if="distance !== null"
                class="mt-3 pt-3 border-t border-gray-200"
            >
                <div class="flex items-center gap-1.5">
                    <svg
                        class="w-3 h-3"
                        :class="isInRadius ? 'text-green-600' : 'text-red-600'"
                        fill="currentColor"
                        viewBox="0 0 20 20"
                    >
                        <path
                            v-if="isInRadius"
                            fill-rule="evenodd"
                            d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                            clip-rule="evenodd"
                        />
                        <path
                            v-else
                            fill-rule="evenodd"
                            d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z"
                            clip-rule="evenodd"
                        />
                    </svg>
                    <span
                        class="text-xs font-semibold"
                        :class="isInRadius ? 'text-green-600' : 'text-red-600'"
                    >
                        {{ distance.toFixed(0) }}m dari lokasi
                    </span>
                </div>
                <p v-if="!isInRadius" class="text-xs text-red-600 mt-1">
                    Anda di luar radius
                </p>
            </div>
        </div>

        <!-- Loading Overlay -->
        <div
            v-if="loading"
            class="absolute inset-0 bg-white bg-opacity-75 flex items-center justify-center rounded-lg z-[1001]"
        >
            <div class="text-center">
                <svg
                    class="animate-spin h-10 w-10 text-blue-600 mx-auto mb-2"
                    fill="none"
                    viewBox="0 0 24 24"
                >
                    <circle
                        class="opacity-25"
                        cx="12"
                        cy="12"
                        r="10"
                        stroke="currentColor"
                        stroke-width="4"
                    ></circle>
                    <path
                        class="opacity-75"
                        fill="currentColor"
                        d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"
                    ></path>
                </svg>
                <p class="text-sm font-medium text-gray-700">Memuat peta...</p>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref, onMounted, onBeforeUnmount, watch, computed } from "vue";
import L from "leaflet";
import "leaflet/dist/leaflet.css";

const props = defineProps({
    targetLatitude: { type: Number, required: true },
    targetLongitude: { type: Number, required: true },
    radius: { type: Number, default: 100 },
    locationName: { type: String, default: "Lokasi Target" },
});

const emit = defineEmits(["locationUpdate"]);

const mapContainer = ref(null);
const loading = ref(true);
const map = ref(null);
const userMarker = ref(null);
const targetMarker = ref(null);
const radiusCircle = ref(null);
const distance = ref(null);

const isInRadius = computed(() => {
    return distance.value !== null && distance.value <= props.radius;
});

// Fix Leaflet default marker icons
delete L.Icon.Default.prototype._getIconUrl;
L.Icon.Default.mergeOptions({
    iconRetinaUrl:
        "https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.9.4/images/marker-icon-2x.png",
    iconUrl:
        "https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.9.4/images/marker-icon.png",
    shadowUrl:
        "https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.9.4/images/marker-shadow.png",
});

function calculateDistance(lat1, lon1, lat2, lon2) {
    const R = 6371e3; // Earth radius in meters
    const φ1 = (lat1 * Math.PI) / 180;
    const φ2 = (lat2 * Math.PI) / 180;
    const Δφ = ((lat2 - lat1) * Math.PI) / 180;
    const Δλ = ((lon2 - lon1) * Math.PI) / 180;

    const a =
        Math.sin(Δφ / 2) * Math.sin(Δφ / 2) +
        Math.cos(φ1) * Math.cos(φ2) * Math.sin(Δλ / 2) * Math.sin(Δλ / 2);
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));

    return R * c; // Distance in meters
}

function initMap(userLat, userLon) {
    // Create map centered between user and target
    const centerLat = (userLat + props.targetLatitude) / 2;
    const centerLon = (userLon + props.targetLongitude) / 2;

    map.value = L.map(mapContainer.value, {
        zoomControl: true,
    }).setView([centerLat, centerLon], 15);

    // Add OpenStreetMap tiles
    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
        attribution:
            '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
        maxZoom: 19,
    }).addTo(map.value);

    // Add target location marker (red)
    const targetIcon = L.divIcon({
        className: "custom-marker",
        html: `<div class="w-8 h-8 bg-red-500 rounded-full border-4 border-white shadow-lg flex items-center justify-center">
                <svg class="w-4 h-4 text-white" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M5.05 4.05a7 7 0 119.9 9.9L10 18.9l-4.95-4.95a7 7 0 010-9.9zM10 11a2 2 0 100-4 2 2 0 000 4z" clip-rule="evenodd" />
                </svg>
            </div>`,
        iconSize: [32, 32],
        iconAnchor: [16, 16],
    });

    targetMarker.value = L.marker(
        [props.targetLatitude, props.targetLongitude],
        {
            icon: targetIcon,
        }
    )
        .addTo(map.value)
        .bindPopup(
            `<strong>${props.locationName}</strong><br/>Lokasi seharusnya`
        );

    // Add radius circle
    radiusCircle.value = L.circle(
        [props.targetLatitude, props.targetLongitude],
        {
            radius: props.radius,
            color: "#ef4444",
            fillColor: "#fca5a5",
            fillOpacity: 0.2,
            weight: 2,
        }
    ).addTo(map.value);

    // Add user location marker (blue)
    const userIcon = L.divIcon({
        className: "custom-marker",
        html: `<div class="w-8 h-8 bg-blue-500 rounded-full border-4 border-white shadow-lg animate-pulse flex items-center justify-center">
                <svg class="w-4 h-4 text-white" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" />
                </svg>
            </div>`,
        iconSize: [32, 32],
        iconAnchor: [16, 16],
    });

    userMarker.value = L.marker([userLat, userLon], {
        icon: userIcon,
    })
        .addTo(map.value)
        .bindPopup("<strong>Lokasi Anda</strong><br/>Posisi saat ini");

    // Calculate distance
    distance.value = calculateDistance(
        userLat,
        userLon,
        props.targetLatitude,
        props.targetLongitude
    );

    // Emit location update
    emit("locationUpdate", {
        latitude: userLat,
        longitude: userLon,
        distance: distance.value,
        isInRadius: distance.value <= props.radius,
    });

    // Fit map to show both markers and radius
    const group = L.featureGroup([
        userMarker.value,
        targetMarker.value,
        radiusCircle.value,
    ]);
    map.value.fitBounds(group.getBounds().pad(0.1));

    loading.value = false;
}

function updateUserLocation(userLat, userLon) {
    if (!map.value || !userMarker.value) return;

    // Update marker position
    userMarker.value.setLatLng([userLat, userLon]);

    // Recalculate distance
    distance.value = calculateDistance(
        userLat,
        userLon,
        props.targetLatitude,
        props.targetLongitude
    );

    // Emit location update
    emit("locationUpdate", {
        latitude: userLat,
        longitude: userLon,
        distance: distance.value,
        isInRadius: distance.value <= props.radius,
    });
}

let watchId = null;

onMounted(() => {
    if (navigator.geolocation) {
        // Get initial position
        navigator.geolocation.getCurrentPosition(
            (position) => {
                initMap(position.coords.latitude, position.coords.longitude);
            },
            (error) => {
                console.error("Error getting location:", error);
                loading.value = false;
                alert(
                    "Tidak dapat mengakses lokasi Anda. Pastikan GPS aktif dan izin lokasi diberikan."
                );
            },
            {
                enableHighAccuracy: true,
                timeout: 10000,
                maximumAge: 0,
            }
        );

        // Watch position changes
        watchId = navigator.geolocation.watchPosition(
            (position) => {
                updateUserLocation(
                    position.coords.latitude,
                    position.coords.longitude
                );
            },
            (error) => {
                console.error("Error watching location:", error);
            },
            {
                enableHighAccuracy: true,
                maximumAge: 5000,
            }
        );
    } else {
        loading.value = false;
        alert("Browser Anda tidak mendukung Geolocation.");
    }
});

onBeforeUnmount(() => {
    if (watchId) {
        navigator.geolocation.clearWatch(watchId);
    }
    if (map.value) {
        map.value.remove();
    }
});

// Watch for prop changes
watch(
    () => props.radius,
    (newRadius) => {
        if (radiusCircle.value) {
            radiusCircle.value.setRadius(newRadius);
        }
    }
);
</script>

<style scoped>
:deep(.leaflet-control-attribution) {
    font-size: 10px;
}

:deep(.custom-marker) {
    background: transparent;
    border: none;
}
</style>
