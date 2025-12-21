<template>
    <AppLayout>
        <div class="space-y-8">
            <!-- Header -->
            <div class="md:flex md:items-center md:justify-between">
                <div class="min-w-0 flex-1">
                    <h2
                        class="text-xl sm:text-2xl font-bold leading-7 text-gray-900 sm:truncate sm:text-3xl sm:tracking-tight"
                    >
                        Edit Lokasi
                    </h2>
                    <p class="mt-1 text-sm text-gray-500">
                        Edit informasi lokasi.
                    </p>
                </div>
                <div class="mt-4 flex md:ml-4 md:mt-0">
                    <Link
                        href="/admin/locations"
                        class="inline-flex items-center rounded-md bg-white px-3 py-2 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50"
                    >
                        <svg
                            class="w-4 h-4 mr-2"
                            fill="none"
                            stroke="currentColor"
                            viewBox="0 0 24 24"
                        >
                            <path
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                stroke-width="2"
                                d="M10 19l-7-7m0 0l7-7m-7 7h18"
                            ></path>
                        </svg>
                        Kembali
                    </Link>
                </div>
            </div>

            <!-- Form -->
            <div class="bg-white shadow rounded-lg">
                <form @submit.prevent="submit" class="px-4 py-5 sm:p-6">
                    <div class="grid grid-cols-1 gap-6 sm:grid-cols-2">
                        <!-- Name -->
                        <div class="sm:col-span-2">
                            <label
                                for="name"
                                class="block text-sm font-medium text-gray-700"
                            >
                                Nama Lokasi <span class="text-red-500">*</span>
                            </label>
                            <input
                                type="text"
                                id="name"
                                v-model="form.name"
                                class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 px-3 py-2 text-sm"
                                :class="{
                                    'border-red-300 focus:border-red-500 focus:ring-red-500':
                                        errors.name,
                                }"
                                placeholder="Contoh: Ruang Kelas 1A, Laboratorium Komputer"
                            />
                            <p
                                v-if="errors.name"
                                class="mt-1 text-sm text-red-600"
                            >
                                {{ errors.name }}
                            </p>
                        </div>

                        <!-- Address -->
                        <div class="sm:col-span-2">
                            <label
                                for="address"
                                class="block text-sm font-medium text-gray-700"
                            >
                                Alamat Lengkap
                                <span class="text-red-500">*</span>
                            </label>
                            <textarea
                                id="address"
                                v-model="form.address"
                                rows="3"
                                class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 px-3 py-2 text-sm"
                                :class="{
                                    'border-red-300 focus:border-red-500 focus:ring-red-500':
                                        errors.address,
                                }"
                                placeholder="Masukkan alamat lengkap lokasi"
                            ></textarea>
                            <p
                                v-if="errors.address"
                                class="mt-1 text-sm text-red-600"
                            >
                                {{ errors.address }}
                            </p>
                        </div>

                        <!-- Latitude & Longitude Section -->
                        <div class="sm:col-span-2">
                            <label
                                class="block text-sm font-medium text-gray-700 mb-2"
                            >
                                Koordinat Lokasi
                                <span class="text-red-500">*</span>
                            </label>

                            <!-- Manual Input Fields -->
                            <div
                                class="grid grid-cols-1 gap-4 sm:grid-cols-2 mb-4"
                            >
                                <div>
                                    <label
                                        for="latitude"
                                        class="block text-sm font-medium text-gray-700"
                                    >
                                        Latitude
                                        <span class="text-red-500">*</span>
                                    </label>
                                    <input
                                        type="number"
                                        step="any"
                                        id="latitude"
                                        v-model="form.latitude"
                                        class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 px-3 py-2 text-sm"
                                        :class="{
                                            'border-red-300 focus:border-red-500 focus:ring-red-500':
                                                errors.latitude,
                                        }"
                                        placeholder="-6.200000"
                                    />
                                    <p
                                        v-if="errors.latitude"
                                        class="mt-1 text-sm text-red-600"
                                    >
                                        {{ errors.latitude }}
                                    </p>
                                    <p class="mt-1 text-sm text-gray-500">
                                        Koordinat lintang (contoh: -6.200000)
                                    </p>
                                </div>

                                <div>
                                    <label
                                        for="longitude"
                                        class="block text-sm font-medium text-gray-700"
                                    >
                                        Longitude
                                        <span class="text-red-500">*</span>
                                    </label>
                                    <input
                                        type="number"
                                        step="any"
                                        id="longitude"
                                        v-model="form.longitude"
                                        class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 px-3 py-2 text-sm"
                                        :class="{
                                            'border-red-300 focus:border-red-500 focus:ring-red-500':
                                                errors.longitude,
                                        }"
                                        placeholder="106.816666"
                                    />
                                    <p
                                        v-if="errors.longitude"
                                        class="mt-1 text-sm text-red-600"
                                    >
                                        {{ errors.longitude }}
                                    </p>
                                    <p class="mt-1 text-sm text-gray-500">
                                        Koordinat bujur (contoh: 106.816666)
                                    </p>
                                </div>
                            </div>

                            <!-- Map Selector -->
                            <div class="mt-4">
                                <div
                                    class="mb-2 flex items-center justify-between"
                                >
                                    <span
                                        class="text-sm font-medium text-gray-700"
                                    >
                                        Pilih dari Peta
                                    </span>
                                    <button
                                        type="button"
                                        @click="getCurrentLocation"
                                        class="inline-flex items-center rounded-md bg-gray-100 px-2.5 py-1.5 text-xs font-semibold text-gray-900 shadow-sm hover:bg-gray-200 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-600"
                                    >
                                        <svg
                                            class="mr-1 h-3.5 w-3.5"
                                            fill="none"
                                            stroke="currentColor"
                                            viewBox="0 0 24 24"
                                        >
                                            <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="2"
                                                d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"
                                            ></path>
                                            <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="2"
                                                d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"
                                            ></path>
                                        </svg>
                                        Lokasi Saat Ini
                                    </button>
                                </div>

                                <div
                                    class="bg-gray-100 rounded-lg overflow-hidden"
                                >
                                    <div
                                        ref="mapContainer"
                                        class="w-full h-80"
                                    ></div>
                                </div>

                                <p class="mt-2 text-sm text-gray-500">
                                    Klik pada peta untuk memilih lokasi atau
                                    gunakan tombol "Lokasi Saat Ini" untuk
                                    mendapatkan posisi Anda.
                                </p>
                            </div>
                        </div>

                        <!-- Radius -->
                        <div>
                            <label
                                for="radius"
                                class="block text-sm font-medium text-gray-700"
                            >
                                Radius (meter)
                                <span class="text-red-500">*</span>
                            </label>
                            <input
                                type="number"
                                min="1"
                                max="1000"
                                id="radius"
                                v-model="form.radius"
                                class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 px-3 py-2 text-sm"
                                :class="{
                                    'border-red-300 focus:border-red-500 focus:ring-red-500':
                                        errors.radius,
                                }"
                                placeholder="50"
                            />
                            <p
                                v-if="errors.radius"
                                class="mt-1 text-sm text-red-600"
                            >
                                {{ errors.radius }}
                            </p>
                            <p class="mt-1 text-sm text-gray-500">
                                Jarak maksimal untuk presensi (1-1000 meter)
                            </p>
                        </div>

                        <!-- Description -->
                        <div>
                            <label
                                for="description"
                                class="block text-sm font-medium text-gray-700"
                            >
                                Deskripsi
                            </label>
                            <textarea
                                id="description"
                                v-model="form.description"
                                rows="3"
                                class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 px-3 py-2 text-sm"
                                placeholder="Deskripsi tambahan tentang lokasi"
                            ></textarea>
                        </div>
                    </div>

                    <!-- Map Preview -->
                    <div class="mt-6">
                        <label
                            class="block text-sm font-medium text-gray-700 mb-2"
                        >
                            Preview Koordinat
                        </label>
                        <div class="bg-gray-100 rounded-lg p-4 text-center">
                            <div
                                v-if="form.latitude && form.longitude"
                                class="text-sm text-gray-600"
                            >
                                <p>
                                    <strong>Latitude:</strong>
                                    {{ form.latitude }}
                                </p>
                                <p>
                                    <strong>Longitude:</strong>
                                    {{ form.longitude }}
                                </p>
                                <p>
                                    <strong>Radius:</strong>
                                    {{ form.radius || 0 }} meter
                                </p>
                                <div class="mt-2">
                                    <a
                                        :href="`https://www.google.com/maps?q=${form.latitude},${form.longitude}`"
                                        target="_blank"
                                        class="inline-flex items-center text-blue-600 hover:text-blue-500 text-sm"
                                    >
                                        <svg
                                            class="w-4 h-4 mr-1"
                                            fill="none"
                                            stroke="currentColor"
                                            viewBox="0 0 24 24"
                                        >
                                            <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="2"
                                                d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14"
                                            ></path>
                                        </svg>
                                        Lihat di Google Maps
                                    </a>
                                </div>
                            </div>
                            <div v-else class="text-sm text-gray-500">
                                Masukkan koordinat untuk melihat preview
                            </div>
                        </div>
                    </div>

                    <!-- Form Actions -->
                    <div class="mt-6 flex items-center justify-end space-x-3">
                        <Link
                            href="/admin/locations"
                            class="inline-flex items-center rounded-md bg-white px-3 py-2 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50"
                        >
                            Batal
                        </Link>
                        <button
                            type="submit"
                            :disabled="processing"
                            class="inline-flex items-center rounded-md bg-blue-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-blue-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-blue-600 disabled:opacity-50 disabled:cursor-not-allowed"
                        >
                            <svg
                                v-if="processing"
                                class="animate-spin -ml-1 mr-2 h-4 w-4 text-white"
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
                            {{
                                processing ? "Menyimpan..." : "Simpan Perubahan"
                            }}
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </AppLayout>
</template>

<script setup>
import { reactive, ref, onMounted, onBeforeUnmount, watch } from "vue";
import { Link, router } from "@inertiajs/vue3";
import AppLayout from "@/Layouts/AppLayout.vue";
import L from "leaflet";
import "leaflet/dist/leaflet.css";

const processing = ref(false);
const mapContainer = ref(null);
const map = ref(null);
const marker = ref(null);
const radiusCircle = ref(null);

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

const props = defineProps({
    location: Object,
    errors: Object,
});

const form = reactive({
    name: props.location.name,
    address: props.location.address,
    latitude: props.location.latitude,
    longitude: props.location.longitude,
    radius: props.location.radius,
    description: props.location.description || "",
});

// Watch radius changes to update circle
watch(
    () => form.radius,
    (newRadius) => {
        if (radiusCircle.value && map.value) {
            radiusCircle.value.setRadius(parseFloat(newRadius) || 50);
        }
    }
);

function initMap() {
    // Parse coordinates or use default center (Jakarta)
    const lat = parseFloat(form.latitude) || -6.2088;
    const lng = parseFloat(form.longitude) || 106.8456;
    const center = [lat, lng];

    map.value = L.map(mapContainer.value).setView(center, 15);

    // Add OpenStreetMap tiles
    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
        attribution:
            '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
        maxZoom: 19,
    }).addTo(map.value);

    // Add click event to set marker
    map.value.on("click", (e) => {
        setMarker(e.latlng.lat, e.latlng.lng);
    });

    // Set initial marker
    setMarker(lat, lng);
}

function setMarker(lat, lng) {
    // Update form values
    form.latitude = lat.toFixed(6);
    form.longitude = lng.toFixed(6);

    // Remove existing marker
    if (marker.value) {
        map.value.removeLayer(marker.value);
    }

    // Remove existing circle
    if (radiusCircle.value) {
        map.value.removeLayer(radiusCircle.value);
    }

    // Add new marker
    marker.value = L.marker([lat, lng], {
        draggable: true,
    }).addTo(map.value);

    // Add radius circle
    const radius = parseFloat(form.radius) || 50;
    radiusCircle.value = L.circle([lat, lng], {
        radius: radius,
        color: "#3B82F6",
        fillColor: "#3B82F6",
        fillOpacity: 0.2,
        weight: 2,
    }).addTo(map.value);

    // Add drag event to update position
    marker.value.on("dragend", (e) => {
        const newPosition = e.target.getLatLng();
        form.latitude = newPosition.lat.toFixed(6);
        form.longitude = newPosition.lng.toFixed(6);

        // Update circle position
        if (radiusCircle.value) {
            radiusCircle.value.setLatLng(newPosition);
        }
    });

    // Center map on marker
    map.value.setView([lat, lng], 15);
}

function getCurrentLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(
            (position) => {
                setMarker(position.coords.latitude, position.coords.longitude);
            },
            (error) => {
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
    } else {
        alert("Browser Anda tidak mendukung Geolocation.");
    }
}

function submit() {
    processing.value = true;
    router.put(`/admin/locations/${props.location.id}`, form, {
        onFinish: () => {
            processing.value = false;
        },
    });
}

onMounted(() => {
    initMap();
});

onBeforeUnmount(() => {
    if (map.value) {
        map.value.remove();
    }
});
</script>
