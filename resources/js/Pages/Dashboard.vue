<template>
    <Head title="Dashboard - Absensi Pengajar" />
    <div class="space-y-8">
        <!-- Header -->
        <div class="md:flex md:items-center md:justify-between">
            <div class="min-w-0 flex-1">
                <h2
                    class="text-xl sm:text-2xl font-bold leading-7 text-gray-900 sm:truncate sm:text-3xl sm:tracking-tight"
                >
                    Dashboard
                </h2>
                <p class="mt-1 text-sm text-gray-500">
                    Selamat datang, {{ $page.props.auth?.user?.name }}! Berikut
                    ringkasan presensi Anda.
                </p>
            </div>
            <div class="mt-4 flex md:ml-4 md:mt-0">
                <Link
                    href="/attendance"
                    class="inline-flex items-center rounded-md bg-blue-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-blue-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-blue-600"
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
                            d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"
                        ></path>
                    </svg>
                    <span class="hidden sm:inline">Presensi Hari Ini</span>
                    <span class="sm:hidden">Presensi</span>
                </Link>
            </div>
        </div>

        <!-- Stats Cards -->
        <div
            class="grid grid-cols-2 gap-3 sm:gap-5 sm:grid-cols-2 lg:grid-cols-5"
        >
            <div
                class="relative overflow-hidden rounded-lg bg-white px-3 py-4 shadow sm:px-6 sm:py-5"
            >
                <dt>
                    <div class="absolute rounded-md bg-green-500 p-2 sm:p-3">
                        <svg
                            class="h-5 w-5 sm:h-6 sm:w-6 text-white"
                            fill="none"
                            stroke="currentColor"
                            viewBox="0 0 24 24"
                        >
                            <path
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                stroke-width="2"
                                d="M5 13l4 4L19 7"
                            ></path>
                        </svg>
                    </div>
                    <p
                        class="ml-12 sm:ml-16 truncate text-xs sm:text-sm font-medium text-gray-500"
                    >
                        Hadir
                    </p>
                </dt>
                <dd class="ml-12 sm:ml-16 flex items-baseline">
                    <p class="text-lg sm:text-2xl font-semibold text-gray-900">
                        {{ stats.hadir || 0 }}
                    </p>
                </dd>
            </div>

            <div
                class="relative overflow-hidden rounded-lg bg-white px-3 py-4 shadow sm:px-6 sm:py-5"
            >
                <dt>
                    <div class="absolute rounded-md bg-yellow-500 p-2 sm:p-3">
                        <svg
                            class="h-5 w-5 sm:h-6 sm:w-6 text-white"
                            fill="none"
                            stroke="currentColor"
                            viewBox="0 0 24 24"
                        >
                            <path
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                stroke-width="2"
                                d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"
                            ></path>
                        </svg>
                    </div>
                    <p
                        class="ml-12 sm:ml-16 truncate text-xs sm:text-sm font-medium text-gray-500"
                    >
                        Terlambat
                    </p>
                </dt>
                <dd class="ml-12 sm:ml-16 flex items-baseline">
                    <p class="text-lg sm:text-2xl font-semibold text-gray-900">
                        {{ stats.terlambat || 0 }}
                    </p>
                </dd>
            </div>

            <div
                class="relative overflow-hidden rounded-lg bg-white px-3 py-4 shadow sm:px-6 sm:py-5"
            >
                <dt>
                    <div class="absolute rounded-md bg-blue-500 p-2 sm:p-3">
                        <svg
                            class="h-5 w-5 sm:h-6 sm:w-6 text-white"
                            fill="none"
                            stroke="currentColor"
                            viewBox="0 0 24 24"
                        >
                            <path
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                stroke-width="2"
                                d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"
                            ></path>
                        </svg>
                    </div>
                    <p
                        class="ml-12 sm:ml-16 truncate text-xs sm:text-sm font-medium text-gray-500"
                    >
                        Izin
                    </p>
                </dt>
                <dd class="ml-12 sm:ml-16 flex items-baseline">
                    <p class="text-lg sm:text-2xl font-semibold text-gray-900">
                        {{ stats.izin || 0 }}
                    </p>
                </dd>
            </div>

            <div
                class="relative overflow-hidden rounded-lg bg-white px-3 py-4 shadow sm:px-6 sm:py-5"
            >
                <dt>
                    <div class="absolute rounded-md bg-red-500 p-2 sm:p-3">
                        <svg
                            class="h-5 w-5 sm:h-6 sm:w-6 text-white"
                            fill="none"
                            stroke="currentColor"
                            viewBox="0 0 24 24"
                        >
                            <path
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                stroke-width="2"
                                d="M6 18L18 6M6 6l12 12"
                            ></path>
                        </svg>
                    </div>
                    <p
                        class="ml-12 sm:ml-16 truncate text-xs sm:text-sm font-medium text-gray-500"
                    >
                        Alpha
                    </p>
                </dt>
                <dd class="ml-12 sm:ml-16 flex items-baseline">
                    <p class="text-lg sm:text-2xl font-semibold text-gray-900">
                        {{ stats.alpha || 0 }}
                    </p>
                </dd>
            </div>

            <div
                class="relative overflow-hidden rounded-lg bg-white px-3 py-4 shadow sm:px-6 sm:py-5"
            >
                <dt>
                    <div class="absolute rounded-md bg-gray-500 p-2 sm:p-3">
                        <svg
                            class="h-5 w-5 sm:h-6 sm:w-6 text-white"
                            fill="none"
                            stroke="currentColor"
                            viewBox="0 0 24 24"
                        >
                            <path
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                stroke-width="2"
                                d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"
                            ></path>
                        </svg>
                    </div>
                    <p
                        class="ml-12 sm:ml-16 truncate text-xs sm:text-sm font-medium text-gray-500"
                    >
                        Total
                    </p>
                </dt>
                <dd class="ml-12 sm:ml-16 flex items-baseline">
                    <p class="text-lg sm:text-2xl font-semibold text-gray-900">
                        {{ stats.total || 0 }}
                    </p>
                </dd>
            </div>
        </div>

        <!-- Jadwal Hari Ini -->
        <div class="bg-white shadow rounded-lg">
            <div class="px-4 py-5 sm:p-6">
                <h3 class="text-lg leading-6 font-medium text-gray-900 mb-4">
                    📅 Jadwal Hari Ini
                </h3>
                <div
                    v-if="todaySchedules.length === 0"
                    class="text-center py-8"
                >
                    <svg
                        class="mx-auto h-12 w-12 text-gray-400"
                        fill="none"
                        stroke="currentColor"
                        viewBox="0 0 24 24"
                    >
                        <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            stroke-width="2"
                            d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"
                        ></path>
                    </svg>
                    <h3 class="mt-2 text-sm font-medium text-gray-900">
                        Tidak ada jadwal
                    </h3>
                    <p class="mt-1 text-sm text-gray-500">
                        Tidak ada jadwal aktif untuk hari ini.
                    </p>
                </div>
                <div v-else class="space-y-3">
                    <div
                        v-for="schedule in todaySchedules"
                        :key="schedule.id"
                        class="flex items-center justify-between p-4 border border-gray-200 rounded-lg hover:bg-gray-50 transition-colors duration-200"
                    >
                        <div class="flex-1">
                            <div class="flex items-center">
                                <h4 class="text-sm font-medium text-gray-900">
                                    {{ schedule.subject || "Mata Pelajaran" }}
                                </h4>
                                <span
                                    class="ml-2 inline-flex items-center rounded-full bg-blue-100 px-2.5 py-0.5 text-xs font-medium text-blue-800"
                                >
                                    {{ schedule.class || "Kelas" }}
                                </span>
                            </div>
                            <div
                                class="mt-1 flex items-center text-sm text-gray-500"
                            >
                                <svg
                                    class="mr-1.5 h-4 w-4"
                                    fill="none"
                                    stroke="currentColor"
                                    viewBox="0 0 24 24"
                                >
                                    <path
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        stroke-width="2"
                                        d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"
                                    ></path>
                                </svg>
                                {{ schedule.start_time }} -
                                {{ schedule.end_time }}
                            </div>
                            <div
                                class="mt-1 flex items-center text-sm text-gray-500"
                            >
                                <svg
                                    class="mr-1.5 h-4 w-4"
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
                                {{ schedule.location?.name || "Lokasi" }}
                            </div>
                        </div>
                        <div class="ml-4">
                            <span
                                class="inline-flex items-center rounded-full px-2.5 py-0.5 text-xs font-medium"
                                :class="
                                    schedule.attendances &&
                                    schedule.attendances.length
                                        ? 'bg-green-100 text-green-800'
                                        : 'bg-gray-100 text-gray-800'
                                "
                            >
                                {{
                                    schedule.attendances &&
                                    schedule.attendances.length
                                        ? "Sudah Presensi"
                                        : "Belum Presensi"
                                }}
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Presensi Terakhir -->
        <div class="bg-white shadow rounded-lg">
            <div class="px-4 py-5 sm:p-6">
                <h3 class="text-lg leading-6 font-medium text-gray-900 mb-4">
                    📋 Presensi Terakhir
                </h3>
                <div
                    v-if="recentAttendances.length === 0"
                    class="text-center py-8"
                >
                    <svg
                        class="mx-auto h-12 w-12 text-gray-400"
                        fill="none"
                        stroke="currentColor"
                        viewBox="0 0 24 24"
                    >
                        <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            stroke-width="2"
                            d="M9 5H7a2 2 0 00-2 2v10a2 2 0 002 2h8a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"
                        ></path>
                    </svg>
                    <h3 class="mt-2 text-sm font-medium text-gray-900">
                        Belum ada data presensi
                    </h3>
                    <p class="mt-1 text-sm text-gray-500">
                        Mulai lakukan presensi untuk melihat riwayat di sini.
                    </p>
                </div>
                <div v-else class="space-y-3">
                    <div
                        v-for="item in recentAttendances"
                        :key="item.id"
                        class="flex items-center justify-between p-4 border border-gray-200 rounded-lg"
                    >
                        <div class="flex-1">
                            <div class="flex items-center">
                                <h4 class="text-sm font-medium text-gray-900">
                                    {{ formatDate(item.date) }}
                                </h4>
                                <span
                                    class="ml-2 inline-flex items-center rounded-full px-2.5 py-0.5 text-xs font-medium"
                                    :class="getStatusClass(item.status)"
                                >
                                    {{ getStatusText(item.status) }}
                                </span>
                            </div>
                            <div class="mt-1 text-sm text-gray-500">
                                {{ item.schedule?.location?.name || "Lokasi" }}
                            </div>
                            <div
                                class="mt-1 flex items-center text-sm text-gray-500"
                            >
                                <span v-if="item.check_in_time">
                                    <svg
                                        class="mr-1 h-4 w-4 inline"
                                        fill="none"
                                        stroke="currentColor"
                                        viewBox="0 0 24 24"
                                    >
                                        <path
                                            stroke-linecap="round"
                                            stroke-linejoin="round"
                                            stroke-width="2"
                                            d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"
                                        ></path>
                                    </svg>
                                    Masuk: {{ item.check_in_time }}
                                </span>
                                <span v-if="item.check_out_time" class="ml-4">
                                    <svg
                                        class="mr-1 h-4 w-4 inline"
                                        fill="none"
                                        stroke="currentColor"
                                        viewBox="0 0 24 24"
                                    >
                                        <path
                                            stroke-linecap="round"
                                            stroke-linejoin="round"
                                            stroke-width="2"
                                            d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"
                                        ></path>
                                    </svg>
                                    Pulang: {{ item.check_out_time }}
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { Link, Head } from "@inertiajs/vue3";
import AppLayout from "@/Layouts/AppLayout.vue";

const props = defineProps({
    stats: { type: Object, required: true },
    todaySchedules: { type: Array, required: true },
    recentAttendances: { type: Array, required: true },
});

defineOptions({ layout: AppLayout });

function formatDate(dateString) {
    const date = new Date(dateString);
    return date.toLocaleDateString("id-ID", {
        weekday: "long",
        year: "numeric",
        month: "long",
        day: "numeric",
    });
}

function getStatusClass(status) {
    const classes = {
        hadir: "bg-green-100 text-green-800",
        terlambat: "bg-yellow-100 text-yellow-800",
        izin: "bg-blue-100 text-blue-800",
        alpha: "bg-red-100 text-red-800",
    };
    return classes[status] || "bg-gray-100 text-gray-800";
}

function getStatusText(status) {
    const texts = {
        hadir: "Hadir",
        terlambat: "Terlambat",
        izin: "Izin",
        alpha: "Alpha",
    };
    return texts[status] || status;
}
</script>
