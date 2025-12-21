<template>
    <AppLayout>
        <div class="space-y-8">
            <!-- Header -->
            <div class="md:flex md:items-center md:justify-between">
                <div class="min-w-0 flex-1">
                    <h2 class="text-xl sm:text-2xl font-bold leading-7 text-gray-900 sm:truncate sm:text-3xl sm:tracking-tight">
                        Detail Presensi
                    </h2>
                    <p class="mt-1 text-sm text-gray-500">
                        Detail informasi presensi pengajar.
                    </p>
                </div>
                <div class="mt-4 flex md:ml-4 md:mt-0 space-x-3">
                    <Link
                        href="/admin/attendances"
                        class="inline-flex items-center rounded-md bg-white px-3 py-2 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50"
                    >
                        <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path>
                        </svg>
                        Kembali
                    </Link>
                    <Link
                        :href="`/admin/attendances/${attendance.id}/edit`"
                        class="inline-flex items-center rounded-md bg-blue-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-blue-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-blue-600"
                    >
                        <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
                        </svg>
                        Edit
                    </Link>
                </div>
            </div>

            <!-- Attendance Details -->
            <div class="bg-white shadow rounded-lg overflow-hidden">
                <div class="px-4 py-5 sm:p-6">
                    <div class="grid grid-cols-1 gap-6 sm:grid-cols-2">
                        <!-- Teacher Info -->
                        <div class="sm:col-span-2">
                            <h3 class="text-lg font-medium text-gray-900 mb-4">Informasi Pengajar</h3>
                            <div class="flex items-center space-x-4">
                                <div class="flex-shrink-0 h-16 w-16">
                                    <div class="h-16 w-16 rounded-full bg-blue-100 flex items-center justify-center">
                                        <span class="text-xl font-medium text-blue-600">
                                            {{ attendance.teacher?.name?.charAt(0) }}
                                        </span>
                                    </div>
                                </div>
                                <div>
                                    <h4 class="text-lg font-medium text-gray-900">{{ attendance.teacher?.name }}</h4>
                                    <p class="text-sm text-gray-500">NIP: {{ attendance.teacher?.nip }}</p>
                                    <p class="text-sm text-gray-500">Email: {{ attendance.teacher?.email }}</p>
                                    <p class="text-sm text-gray-500">Phone: {{ attendance.teacher?.phone || '-' }}</p>
                                </div>
                            </div>
                        </div>

                        <!-- Attendance Info -->
                        <div>
                            <h3 class="text-lg font-medium text-gray-900 mb-4">Informasi Presensi</h3>
                            <dl class="space-y-3">
                                <div>
                                    <dt class="text-sm font-medium text-gray-500">Tanggal</dt>
                                    <dd class="text-sm text-gray-900">{{ new Date(attendance.date).toLocaleDateString('id-ID') }}</dd>
                                </div>
                                <div>
                                    <dt class="text-sm font-medium text-gray-500">Status</dt>
                                    <dd class="text-sm">
                                        <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium"
                                            :class="{
                                                'bg-green-100 text-green-800': attendance.status === 'hadir',
                                                'bg-yellow-100 text-yellow-800': attendance.status === 'terlambat',
                                                'bg-blue-100 text-blue-800': attendance.status === 'izin',
                                                'bg-red-100 text-red-800': attendance.status === 'alpha'
                                            }">
                                            {{ attendance.status }}
                                        </span>
                                    </dd>
                                </div>
                                <div>
                                    <dt class="text-sm font-medium text-gray-500">Check In</dt>
                                    <dd class="text-sm text-gray-900">{{ attendance.check_in_time || '-' }}</dd>
                                </div>
                                <div>
                                    <dt class="text-sm font-medium text-gray-500">Check Out</dt>
                                    <dd class="text-sm text-gray-900">{{ attendance.check_out_time || '-' }}</dd>
                                </div>
                                <div v-if="attendance.notes">
                                    <dt class="text-sm font-medium text-gray-500">Catatan</dt>
                                    <dd class="text-sm text-gray-900">{{ attendance.notes }}</dd>
                                </div>
                            </dl>
                        </div>

                        <!-- Schedule Info -->
                        <div>
                            <h3 class="text-lg font-medium text-gray-900 mb-4">Informasi Jadwal</h3>
                            <dl class="space-y-3">
                                <div>
                                    <dt class="text-sm font-medium text-gray-500">Mata Pelajaran</dt>
                                    <dd class="text-sm text-gray-900">{{ attendance.schedule?.subject }}</dd>
                                </div>
                                <div>
                                    <dt class="text-sm font-medium text-gray-500">Kelas</dt>
                                    <dd class="text-sm text-gray-900">{{ attendance.schedule?.class }}</dd>
                                </div>
                                <div>
                                    <dt class="text-sm font-medium text-gray-500">Hari</dt>
                                    <dd class="text-sm text-gray-900">{{ getDayName(attendance.schedule?.day) }}</dd>
                                </div>
                                <div>
                                    <dt class="text-sm font-medium text-gray-500">Waktu</dt>
                                    <dd class="text-sm text-gray-900">{{ attendance.schedule?.start_time }} - {{ attendance.schedule?.end_time }}</dd>
                                </div>
                                <div>
                                    <dt class="text-sm font-medium text-gray-500">Lokasi</dt>
                                    <dd class="text-sm text-gray-900">{{ attendance.schedule?.location?.name || '-' }}</dd>
                                </div>
                            </dl>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Location Info -->
            <div v-if="attendance.schedule?.location" class="bg-white shadow rounded-lg">
                <div class="px-4 py-5 sm:p-6">
                    <h3 class="text-lg font-medium text-gray-900 mb-4">Informasi Lokasi</h3>
                    <dl class="space-y-3">
                        <div>
                            <dt class="text-sm font-medium text-gray-500">Nama Lokasi</dt>
                            <dd class="text-sm text-gray-900">{{ attendance.schedule.location.name }}</dd>
                        </div>
                        <div>
                            <dt class="text-sm font-medium text-gray-500">Alamat</dt>
                            <dd class="text-sm text-gray-900">{{ attendance.schedule.location.address }}</dd>
                        </div>
                        <div>
                            <dt class="text-sm font-medium text-gray-500">Koordinat</dt>
                            <dd class="text-sm text-gray-900">
                                {{ attendance.schedule.location.latitude }}, {{ attendance.schedule.location.longitude }}
                            </dd>
                        </div>
                        <div>
                            <dt class="text-sm font-medium text-gray-500">Radius</dt>
                            <dd class="text-sm text-gray-900">{{ attendance.schedule.location.radius }} meter</dd>
                        </div>
                        <div>
                            <dt class="text-sm font-medium text-gray-500">Google Maps</dt>
                            <dd class="text-sm">
                                <a 
                                    :href="`https://www.google.com/maps?q=${attendance.schedule.location.latitude},${attendance.schedule.location.longitude}`"
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
    </AppLayout>
</template>

<script setup>
import { Link } from '@inertiajs/vue3'
import AppLayout from '@/Layouts/AppLayout.vue'

defineProps({
    attendance: Object
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
