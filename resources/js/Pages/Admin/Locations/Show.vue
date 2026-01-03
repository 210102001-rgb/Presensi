<template>
    <AppLayout>
        <div class="space-y-8">
            <!-- Header -->
            <div class="md:flex md:items-center md:justify-between">
                <div class="min-w-0 flex-1">
                    <h2 class="text-xl sm:text-2xl font-bold leading-7 text-gray-900 sm:truncate sm:text-3xl sm:tracking-tight">
                        Detail Lokasi
                    </h2>
                    <p class="mt-1 text-sm text-gray-500">
                        Detail informasi lokasi presensi.
                    </p>
                </div>
                <div class="mt-4 flex md:ml-4 md:mt-0 space-x-3">
                    <Link
                        href="/admin/locations"
                        class="inline-flex items-center rounded-md bg-white px-3 py-2 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50"
                    >
                        <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path>
                        </svg>
                        Kembali
                    </Link>
                    <Link
                        :href="`/admin/locations/${location.id}/edit`"
                        class="inline-flex items-center rounded-md bg-blue-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-blue-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-blue-600"
                    >
                        <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
                        </svg>
                        Edit
                    </Link>
                </div>
            </div>

            <!-- Location Details -->
            <div class="bg-white shadow rounded-lg overflow-hidden">
                <div class="px-4 py-5 sm:p-6">
                    <div class="grid grid-cols-1 gap-6 sm:grid-cols-2">
                        <!-- Basic Info -->
                        <div>
                            <h3 class="text-lg font-medium text-gray-900 mb-4">Informasi Dasar</h3>
                            <dl class="space-y-3">
                                <div>
                                    <dt class="text-sm font-medium text-gray-500">Nama Lokasi</dt>
                                    <dd class="text-sm text-gray-900">{{ location.name }}</dd>
                                </div>
                                <div>
                                    <dt class="text-sm font-medium text-gray-500">Alamat</dt>
                                    <dd class="text-sm text-gray-900">{{ location.address }}</dd>
                                </div>
                                <div v-if="location.description">
                                    <dt class="text-sm font-medium text-gray-500">Deskripsi</dt>
                                    <dd class="text-sm text-gray-900">{{ location.description }}</dd>
                                </div>
                            </dl>
                        </div>

                        <!-- Coordinates Info -->
                        <div>
                            <h3 class="text-lg font-medium text-gray-900 mb-4">Koordinat & Radius</h3>
                            <dl class="space-y-3">
                                <div>
                                    <dt class="text-sm font-medium text-gray-500">Latitude</dt>
                                    <dd class="text-sm text-gray-900">{{ location.latitude }}</dd>
                                </div>
                                <div>
                                    <dt class="text-sm font-medium text-gray-500">Longitude</dt>
                                    <dd class="text-sm text-gray-900">{{ location.longitude }}</dd>
                                </div>
                                <div>
                                    <dt class="text-sm font-medium text-gray-500">Radius</dt>
                                    <dd class="text-sm text-gray-900">{{ location.radius }} meter</dd>
                                </div>
                                <div>
                                    <dt class="text-sm font-medium text-gray-500">Google Maps</dt>
                                    <dd class="text-sm">
                                        <a 
                                            :href="`https://www.google.com/maps?q=${location.latitude},${location.longitude}`"
                                            target="_blank"
                                            class="inline-flex items-center text-blue-600 hover:text-blue-500"
                                        >
                                            <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14"></path>
                                            </svg>
                                            Lihat di Google Maps
                                        </a>
                                    </dd>
                                </div>
                            </dl>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Schedules -->
            <div class="bg-white shadow rounded-lg">
                <div class="px-4 py-5 sm:p-6">
                    <h3 class="text-lg font-medium text-gray-900 mb-4">Jadwal di Lokasi Ini</h3>
                    <div v-if="location.schedules && location.schedules.length === 0" class="text-center py-6">
                        <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                        </svg>
                        <h3 class="mt-2 text-sm font-medium text-gray-900">Belum ada jadwal</h3>
                        <p class="mt-1 text-sm text-gray-500">Belum ada jadwal yang menggunakan lokasi ini.</p>
                    </div>
                    <div v-else class="space-y-3">
                        <div v-for="schedule in location.schedules" :key="schedule.id" class="border border-gray-200 rounded-lg p-4">
                            <div class="flex items-center justify-between">
                                <div class="flex-1">
                                    <h4 class="text-sm font-medium text-gray-900">{{ schedule.subject }} - {{ schedule.class }}</h4>
                                    <p class="text-sm text-gray-500">{{ schedule.teacher?.name }}</p>
                                    <div class="mt-2 flex items-center space-x-4 text-xs text-gray-500">
                                        <span class="flex items-center">
                                            <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                                            </svg>
                                            {{ getDayName(schedule.day) }}
                                        </span>
                                        <span class="flex items-center">
                                            <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                            </svg>
                                            {{ schedule.start_time }} - {{ schedule.end_time }}
                                        </span>
                                        <span class="inline-flex items-center px-2 py-0.5 rounded text-xs font-medium"
                                            :class="schedule.is_active ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'">
                                            {{ schedule.is_active ? 'Aktif' : 'Tidak Aktif' }}
                                        </span>
                                    </div>
                                </div>
                                <div class="flex items-center space-x-2">
                                    <Link
                                        :href="`/admin/schedules/${schedule.id}`"
                                        class="text-blue-600 hover:text-blue-900"
                                    >
                                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"></path>
                                        </svg>
                                    </Link>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </AppLayout>
</template>

<script setup>
import { Link } from '@inertiajs/vue3'
import AppLayout from '@/Layouts/AppLayout.vue'

defineProps({
    location: Object
})

function getDayName(day) {
    const days = {
        'monday': 'Senin',
        'tuesday': 'Selasa',
        'wednesday': 'Rabu',
        'thursday': 'Kamis',
        'friday': 'Jumat',
        'saturday': 'Sabtu',
        'sunday': 'Minggu'
    }
    return days[day] || day
}
</script>
