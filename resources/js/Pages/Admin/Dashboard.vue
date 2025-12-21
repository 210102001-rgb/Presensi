<template>
    <Head title="Admin Dashboard - Absensi Pengajar" />
    <AppLayout>
        <div class="space-y-8">
        <!-- Header -->
        <div class="md:flex md:items-center md:justify-between">
            <div class="min-w-0 flex-1">
                <h2 class="text-xl sm:text-2xl font-bold leading-7 text-gray-900 sm:truncate sm:text-3xl sm:tracking-tight">
                    Admin Dashboard
                </h2>
                <p class="mt-1 text-sm text-gray-500">
                    Kelola semua data sistem presensi pengajar.
                </p>
            </div>
        </div>

        <!-- Stats Cards -->
        <div class="grid grid-cols-2 gap-3 sm:gap-5 sm:grid-cols-2 lg:grid-cols-6">
            <div class="relative overflow-hidden rounded-lg bg-white px-3 py-4 shadow sm:px-6 sm:py-5">
                <dt>
                    <div class="absolute rounded-md bg-blue-500 p-2 sm:p-3">
                        <svg class="h-5 w-5 sm:h-6 sm:w-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197m13.5-9a2.5 2.5 0 11-5 0 2.5 2.5 0 015 0z"></path>
                        </svg>
                    </div>
                    <p class="ml-12 sm:ml-16 truncate text-xs sm:text-sm font-medium text-gray-500">Total Pengajar</p>
                </dt>
                <dd class="ml-12 sm:ml-16 flex items-baseline">
                    <p class="text-lg sm:text-2xl font-semibold text-gray-900">{{ stats.total_teachers || 0 }}</p>
                </dd>
            </div>

            <div class="relative overflow-hidden rounded-lg bg-white px-3 py-4 shadow sm:px-6 sm:py-5">
                <dt>
                    <div class="absolute rounded-md bg-green-500 p-2 sm:p-3">
                        <svg class="h-5 w-5 sm:h-6 sm:w-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                        </svg>
                    </div>
                    <p class="ml-12 sm:ml-16 truncate text-xs sm:text-sm font-medium text-gray-500">Aktif</p>
                </dt>
                <dd class="ml-12 sm:ml-16 flex items-baseline">
                    <p class="text-lg sm:text-2xl font-semibold text-gray-900">{{ stats.active_teachers || 0 }}</p>
                </dd>
            </div>

            <div class="relative overflow-hidden rounded-lg bg-white px-3 py-4 shadow sm:px-6 sm:py-5">
                <dt>
                    <div class="absolute rounded-md bg-purple-500 p-2 sm:p-3">
                        <svg class="h-5 w-5 sm:h-6 sm:w-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                        </svg>
                    </div>
                    <p class="ml-12 sm:ml-16 truncate text-xs sm:text-sm font-medium text-gray-500">Jadwal</p>
                </dt>
                <dd class="ml-12 sm:ml-16 flex items-baseline">
                    <p class="text-lg sm:text-2xl font-semibold text-gray-900">{{ stats.total_schedules || 0 }}</p>
                </dd>
            </div>

            <div class="relative overflow-hidden rounded-lg bg-white px-3 py-4 shadow sm:px-6 sm:py-5">
                <dt>
                    <div class="absolute rounded-md bg-yellow-500 p-2 sm:p-3">
                        <svg class="h-5 w-5 sm:h-6 sm:w-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
                        </svg>
                    </div>
                    <p class="ml-12 sm:ml-16 truncate text-xs sm:text-sm font-medium text-gray-500">Lokasi</p>
                </dt>
                <dd class="ml-12 sm:ml-16 flex items-baseline">
                    <p class="text-lg sm:text-2xl font-semibold text-gray-900">{{ stats.total_locations || 0 }}</p>
                </dd>
            </div>

            <div class="relative overflow-hidden rounded-lg bg-white px-3 py-4 shadow sm:px-6 sm:py-5">
                <dt>
                    <div class="absolute rounded-md bg-indigo-500 p-2 sm:p-3">
                        <svg class="h-5 w-5 sm:h-6 sm:w-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                        </svg>
                    </div>
                    <p class="ml-12 sm:ml-16 truncate text-xs sm:text-sm font-medium text-gray-500">Hari Ini</p>
                </dt>
                <dd class="ml-12 sm:ml-16 flex items-baseline">
                    <p class="text-lg sm:text-2xl font-semibold text-gray-900">{{ stats.today_attendances || 0 }}</p>
                </dd>
            </div>

            <div class="relative overflow-hidden rounded-lg bg-white px-3 py-4 shadow sm:px-6 sm:py-5">
                <dt>
                    <div class="absolute rounded-md bg-gray-500 p-2 sm:p-3">
                        <svg class="h-5 w-5 sm:h-6 sm:w-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"></path>
                        </svg>
                    </div>
                    <p class="ml-12 sm:ml-16 truncate text-xs sm:text-sm font-medium text-gray-500">Bulan Ini</p>
                </dt>
                <dd class="ml-12 sm:ml-16 flex items-baseline">
                    <p class="text-lg sm:text-2xl font-semibold text-gray-900">{{ stats.this_month_attendances || 0 }}</p>
                </dd>
            </div>
        </div>

        <!-- Quick Actions -->
        <div class="bg-white shadow rounded-lg">
            <div class="px-4 py-5 sm:p-6">
                <h3 class="text-lg leading-6 font-medium text-gray-900 mb-4">
                    🚀 Quick Actions
                </h3>
                <div class="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-4">
                    <Link
                        href="/admin/users/create"
                        class="relative group bg-white p-6 focus-within:ring-2 focus-within:ring-inset focus-within:ring-blue-500 rounded-lg border border-gray-200 hover:border-blue-300 transition-colors duration-200"
                    >
                        <div>
                            <span class="rounded-lg inline-flex p-3 bg-blue-50 text-blue-700 ring-4 ring-white">
                                <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                                </svg>
                            </span>
                        </div>
                        <div class="mt-4">
                            <h3 class="text-lg font-medium">
                                <span class="absolute inset-0" aria-hidden="true"></span>
                                Tambah Pengajar
                            </h3>
                            <p class="mt-2 text-sm text-gray-500">
                                Tambahkan pengajar baru ke sistem
                            </p>
                        </div>
                    </Link>

                    <Link
                        href="/admin/schedules/create"
                        class="relative group bg-white p-6 focus-within:ring-2 focus-within:ring-inset focus-within:ring-purple-500 rounded-lg border border-gray-200 hover:border-purple-300 transition-colors duration-200"
                    >
                        <div>
                            <span class="rounded-lg inline-flex p-3 bg-purple-50 text-purple-700 ring-4 ring-white">
                                <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                                </svg>
                            </span>
                        </div>
                        <div class="mt-4">
                            <h3 class="text-lg font-medium">
                                <span class="absolute inset-0" aria-hidden="true"></span>
                                Buat Jadwal
                            </h3>
                            <p class="mt-2 text-sm text-gray-500">
                                Buat jadwal mengajar baru
                            </p>
                        </div>
                    </Link>

                    <Link
                        href="/admin/locations/create"
                        class="relative group bg-white p-6 focus-within:ring-2 focus-within:ring-inset focus-within:ring-yellow-500 rounded-lg border border-gray-200 hover:border-yellow-300 transition-colors duration-200"
                    >
                        <div>
                            <span class="rounded-lg inline-flex p-3 bg-yellow-50 text-yellow-700 ring-4 ring-white">
                                <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
                                </svg>
                            </span>
                        </div>
                        <div class="mt-4">
                            <h3 class="text-lg font-medium">
                                <span class="absolute inset-0" aria-hidden="true"></span>
                                Tambah Lokasi
                            </h3>
                            <p class="mt-2 text-sm text-gray-500">
                                Tambahkan lokasi baru untuk presensi
                            </p>
                        </div>
                    </Link>

                    <Link
                        href="/admin/attendances"
                        class="relative group bg-white p-6 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-500 rounded-lg border border-gray-200 hover:border-indigo-300 transition-colors duration-200"
                    >
                        <div>
                            <span class="rounded-lg inline-flex p-3 bg-indigo-50 text-indigo-700 ring-4 ring-white">
                                <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v10a2 2 0 002 2h8a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"></path>
                                </svg>
                            </span>
                        </div>
                        <div class="mt-4">
                            <h3 class="text-lg font-medium">
                                <span class="absolute inset-0" aria-hidden="true"></span>
                                Kelola Presensi
                            </h3>
                            <p class="mt-2 text-sm text-gray-500">
                                Lihat dan kelola data presensi
                            </p>
                        </div>
                    </Link>
                </div>
            </div>
        </div>

        <!-- Recent Activities -->
        <div class="grid grid-cols-1 gap-8 lg:grid-cols-2">
            <!-- Recent Attendances -->
            <div class="bg-white shadow rounded-lg">
                <div class="px-4 py-5 sm:p-6">
                    <h3 class="text-lg leading-6 font-medium text-gray-900 mb-4">
                        📊 Presensi Terbaru
                    </h3>
                    <div v-if="recentAttendances.length === 0" class="text-center py-6">
                        <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v10a2 2 0 002 2h8a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"></path>
                        </svg>
                        <h3 class="mt-2 text-sm font-medium text-gray-900">Belum ada presensi</h3>
                        <p class="mt-1 text-sm text-gray-500">Data presensi akan muncul di sini.</p>
                    </div>
                    <div v-else class="space-y-3">
                        <div v-for="attendance in recentAttendances" :key="attendance.id" class="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
                            <div class="flex items-center space-x-3">
                                <div class="flex-shrink-0">
                                    <div class="h-8 w-8 rounded-full bg-blue-100 flex items-center justify-center">
                                        <span class="text-xs font-medium text-blue-600">
                                            {{ attendance.teacher?.name?.charAt(0) }}
                                        </span>
                                    </div>
                                </div>
                                <div class="min-w-0 flex-1">
                                    <p class="text-sm font-medium text-gray-900 truncate">
                                        {{ attendance.teacher?.name }}
                                    </p>
                                    <p class="text-xs text-gray-500">
                                        {{ attendance.schedule?.subject }} - {{ attendance.schedule?.class }}
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
                                <span class="text-xs text-gray-500">
                                    {{ new Date(attendance.date).toLocaleDateString('id-ID') }}
                                </span>
                            </div>
                        </div>
                    </div>
                    <div v-if="recentAttendances.length > 0" class="mt-4">
                        <Link
                            href="/admin/attendances"
                            class="text-sm text-blue-600 hover:text-blue-500 font-medium"
                        >
                            Lihat semua presensi →
                        </Link>
                    </div>
                </div>
            </div>

            <!-- Top Teachers -->
            <div class="bg-white shadow rounded-lg">
                <div class="px-4 py-5 sm:p-6">
                    <h3 class="text-lg leading-6 font-medium text-gray-900 mb-4">
                        🏆 Pengajar Teraktif
                    </h3>
                    <div v-if="topTeachers.length === 0" class="text-center py-6">
                        <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197m13.5-9a2.5 2.5 0 11-5 0 2.5 2.5 0 015 0z"></path>
                        </svg>
                        <h3 class="mt-2 text-sm font-medium text-gray-900">Belum ada data</h3>
                        <p class="mt-1 text-sm text-gray-500">Data pengajar teraktif akan muncul di sini.</p>
                    </div>
                    <div v-else class="space-y-3">
                        <div v-for="(teacher, index) in topTeachers" :key="teacher.id" class="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
                            <div class="flex items-center space-x-3">
                                <div class="flex-shrink-0">
                                    <div class="h-8 w-8 rounded-full bg-purple-100 flex items-center justify-center">
                                        <span class="text-xs font-medium text-purple-600">
                                            {{ index + 1 }}
                                        </span>
                                    </div>
                                </div>
                                <div class="min-w-0 flex-1">
                                    <p class="text-sm font-medium text-gray-900 truncate">
                                        {{ teacher.name }}
                                    </p>
                                    <p class="text-xs text-gray-500">
                                        {{ teacher.subject || 'Mata Pelajaran' }}
                                    </p>
                                </div>
                            </div>
                            <div class="flex items-center space-x-2">
                                <span class="text-sm font-medium text-gray-900">
                                    {{ teacher.attendances_count }} presensi
                                </span>
                            </div>
                        </div>
                    </div>
                    <div v-if="topTeachers.length > 0" class="mt-4">
                        <Link
                            href="/admin/users"
                            class="text-sm text-purple-600 hover:text-purple-500 font-medium"
                        >
                            Lihat semua pengajar →
                        </Link>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </AppLayout>
</template>

<script setup>
import { Link, Head } from '@inertiajs/vue3'
import AppLayout from '@/Layouts/AppLayout.vue'

defineProps({
    stats: Object,
    recentAttendances: Array,
    topTeachers: Array,
})
</script>
