<template>
    <AppLayout>
        <div class="space-y-8">
        <!-- Header -->
        <div class="md:flex md:items-center md:justify-between">
            <div class="min-w-0 flex-1">
                <h2 class="text-xl sm:text-2xl font-bold leading-7 text-gray-900 sm:truncate sm:text-3xl sm:tracking-tight">
                    Detail Pengajar
                </h2>
                <p class="mt-1 text-sm text-gray-500">
                    Informasi lengkap {{ user.name }}.
                </p>
            </div>
            <div class="mt-4 flex space-x-3 md:ml-4 md:mt-0">
                <Link
                    :href="`/admin/users/${user.id}/edit`"
                    class="inline-flex items-center rounded-md bg-blue-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-blue-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-blue-600"
                >
                    <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
                    </svg>
                    Edit
                </Link>
                <Link
                    href="/admin/users"
                    class="inline-flex items-center rounded-md bg-white px-3 py-2 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50"
                >
                    <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path>
                    </svg>
                    Kembali
                </Link>
            </div>
        </div>

        <!-- User Info -->
        <div class="bg-white shadow rounded-lg overflow-hidden">
            <div class="px-4 py-5 sm:p-6">
                <div class="flex items-center space-x-4 mb-6">
                    <div class="flex-shrink-0 h-16 w-16">
                        <div class="h-16 w-16 rounded-full bg-blue-100 flex items-center justify-center">
                            <span class="text-2xl font-medium text-blue-600">
                                {{ user.name.charAt(0) }}
                            </span>
                        </div>
                    </div>
                    <div class="flex-1 min-w-0">
                        <h3 class="text-lg font-medium text-gray-900">{{ user.name }}</h3>
                        <div class="flex items-center space-x-4 mt-1">
                            <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium"
                                :class="{
                                    'bg-purple-100 text-purple-800': user.role === 'admin',
                                    'bg-blue-100 text-blue-800': user.role === 'pengajar'
                                }">
                                {{ user.role === 'admin' ? 'Admin' : 'Pengajar' }}
                            </span>
                            <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium"
                                :class="{
                                    'bg-green-100 text-green-800': user.is_active,
                                    'bg-red-100 text-red-800': !user.is_active
                                }">
                                {{ user.is_active ? 'Aktif' : 'Nonaktif' }}
                            </span>
                        </div>
                    </div>
                </div>

                <div class="grid grid-cols-1 gap-6 sm:grid-cols-2">
                    <div>
                        <dt class="text-sm font-medium text-gray-500">NIP</dt>
                        <dd class="mt-1 text-sm text-gray-900">{{ user.nip }}</dd>
                    </div>
                    <div>
                        <dt class="text-sm font-medium text-gray-500">Email</dt>
                        <dd class="mt-1 text-sm text-gray-900">{{ user.email }}</dd>
                    </div>
                    <div>
                        <dt class="text-sm font-medium text-gray-500">Nomor Telepon</dt>
                        <dd class="mt-1 text-sm text-gray-900">{{ user.phone || '-' }}</dd>
                    </div>
                    <div>
                        <dt class="text-sm font-medium text-gray-500">Mata Pelajaran</dt>
                        <dd class="mt-1 text-sm text-gray-900">{{ user.subject || '-' }}</dd>
                    </div>
                    <div class="sm:col-span-2">
                        <dt class="text-sm font-medium text-gray-500">Alamat</dt>
                        <dd class="mt-1 text-sm text-gray-900">{{ user.address || '-' }}</dd>
                    </div>
                </div>
            </div>
        </div>

        <!-- Schedules -->
        <div class="bg-white shadow rounded-lg">
            <div class="px-4 py-5 sm:p-6">
                <h3 class="text-lg leading-6 font-medium text-gray-900 mb-4">
                    📅 Jadwal Mengajar
                </h3>
                <div v-if="user.schedules && user.schedules.length === 0" class="text-center py-6">
                    <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                    </svg>
                    <h3 class="mt-2 text-sm font-medium text-gray-900">Belum ada jadwal</h3>
                    <p class="mt-1 text-sm text-gray-500">Pengajar ini belum memiliki jadwal mengajar.</p>
                </div>
                <div v-else class="space-y-3">
                    <div v-for="schedule in user.schedules" :key="schedule.id" class="border border-gray-200 rounded-lg p-4">
                        <div class="flex items-center justify-between">
                            <div class="flex-1">
                                <h4 class="text-sm font-medium text-gray-900">{{ schedule.subject }}</h4>
                                <p class="text-sm text-gray-500">{{ schedule.class }}</p>
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
                                    <span class="flex items-center">
                                        <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                                        </svg>
                                        {{ schedule.location?.name || 'Lokasi' }}
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Recent Attendances -->
        <div class="bg-white shadow rounded-lg">
            <div class="px-4 py-5 sm:p-6">
                <h3 class="text-lg leading-6 font-medium text-gray-900 mb-4">
                    📊 Presensi Terbaru
                </h3>
                <div v-if="user.attendances && user.attendances.length === 0" class="text-center py-6">
                    <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v10a2 2 0 002 2h8a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"></path>
                    </svg>
                    <h3 class="mt-2 text-sm font-medium text-gray-900">Belum ada presensi</h3>
                    <p class="mt-1 text-sm text-gray-500">Pengajar ini belum melakukan presensi.</p>
                </div>
                <div v-else class="space-y-3">
                    <div v-for="attendance in user.attendances.slice(0, 5)" :key="attendance.id" class="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
                        <div class="flex items-center space-x-3">
                            <div class="flex-shrink-0">
                                <div class="h-8 w-8 rounded-full bg-blue-100 flex items-center justify-center">
                                    <span class="text-xs font-medium text-blue-600">
                                        {{ new Date(attendance.date).getDate() }}
                                    </span>
                                </div>
                            </div>
                            <div class="min-w-0 flex-1">
                                <p class="text-sm font-medium text-gray-900">
                                    {{ attendance.schedule?.subject || 'Mata Pelajaran' }}
                                </p>
                                <p class="text-xs text-gray-500">
                                    {{ new Date(attendance.date).toLocaleDateString('id-ID') }}
                                </p>
                            </div>
                        </div>
                        <div class="flex items-center space-x-2">
                            <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium"
                                :class="{
                                    'bg-green-100 text-green-800': attendance.status === 'hadir',
                                    'bg-yellow-100 text-yellow-800': attendance.status === 'terlambat',
                                    'bg-blue-100 text-blue-800': attendance.status === 'izin',
                                    'bg-red-100 text-red-800': attendance.status === 'alpha'
                                }">
                                {{ attendance.status }}
                            </span>
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
    user: Object
})

function getDayName(dayOfWeek) {
    const days = {
        'monday': 'Senin',
        'tuesday': 'Selasa',
        'wednesday': 'Rabu',
        'thursday': 'Kamis',
        'friday': 'Jumat',
        'saturday': 'Sabtu',
        'sunday': 'Minggu'
    }
    return days[dayOfWeek] || dayOfWeek
}
</script>
