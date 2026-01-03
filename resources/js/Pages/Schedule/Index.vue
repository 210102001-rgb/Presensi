<template>
    <Head title="Jadwal Mengajar - Absensi Pengajar" />
    <div class="space-y-8">
        <!-- Header -->
        <div class="md:flex md:items-center md:justify-between">
            <div class="min-w-0 flex-1">
                <h2
                    class="text-xl sm:text-2xl font-bold leading-7 text-gray-900 sm:truncate sm:text-3xl sm:tracking-tight"
                >
                    Jadwal Mengajar
                </h2>
                <p class="mt-1 text-sm text-gray-500">
                    Jadwal mengajar tetap Anda untuk setiap hari dalam seminggu.
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

        <!-- Schedules by Day -->
        <div
            v-if="Object.keys(schedules).length === 0"
            class="text-center py-12"
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
                Belum ada jadwal mengajar yang diatur untuk Anda.
            </p>
        </div>

        <div v-else class="space-y-6">
            <div
                v-for="(list, day) in schedules"
                :key="day"
                class="bg-white shadow rounded-lg"
            >
                <div class="px-4 py-5 sm:p-6">
                    <div class="flex items-center mb-4">
                        <div class="flex-shrink-0">
                            <div
                                class="w-8 h-8 bg-blue-100 rounded-full flex items-center justify-center"
                            >
                                <span
                                    class="text-blue-600 font-semibold text-sm"
                                    >{{ getDayInitial(day) }}</span
                                >
                            </div>
                        </div>
                        <div class="ml-3">
                            <h3 class="text-lg font-medium text-gray-900">
                                {{ getDayName(day) }}
                            </h3>
                            <p class="text-sm text-gray-500">
                                {{ list.length }} jadwal
                            </p>
                        </div>
                    </div>

                    <div v-if="list.length === 0" class="text-center py-4">
                        <p class="text-sm text-gray-500">
                            Tidak ada jadwal untuk hari ini
                        </p>
                    </div>

                    <div v-else class="space-y-3">
                        <div
                            v-for="item in list"
                            :key="item.id"
                            class="flex items-center justify-between p-4 border border-gray-200 rounded-lg hover:bg-gray-50 transition-colors duration-200"
                        >
                            <div class="flex-1">
                                <div class="flex items-center">
                                    <h4
                                        class="text-sm font-medium text-gray-900"
                                    >
                                        {{ item.subject || "Mata Pelajaran" }}
                                    </h4>
                                    <span
                                        class="ml-3 inline-flex items-center rounded-full bg-blue-100 px-2.5 py-0.5 text-xs font-medium text-blue-800"
                                    >
                                        {{ item.class || "Kelas" }}
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
                                    {{ item.start_time }} - {{ item.end_time }}
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
                                    {{ item.location?.name || "Lokasi" }}
                                </div>
                            </div>
                            <div class="ml-4">
                                <span
                                    class="inline-flex items-center rounded-full px-2.5 py-0.5 text-xs font-medium"
                                    :class="
                                        item.is_active
                                            ? 'bg-green-100 text-green-800'
                                            : 'bg-gray-100 text-gray-800'
                                    "
                                >
                                    {{
                                        item.is_active ? "Aktif" : "Tidak Aktif"
                                    }}
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
    schedules: { type: Object, required: true },
});

defineOptions({ layout: AppLayout });

function getDayName(day) {
    const dayNames = {
        Monday: "Senin",
        Tuesday: "Selasa",
        Wednesday: "Rabu",
        Thursday: "Kamis",
        Friday: "Jumat",
        Saturday: "Sabtu",
        Sunday: "Minggu",
    };
    return dayNames[day] || day;
}

function getDayInitial(day) {
    const initials = {
        Monday: "S",
        Tuesday: "S",
        Wednesday: "R",
        Thursday: "K",
        Friday: "J",
        Saturday: "S",
        Sunday: "M",
    };
    return initials[day] || day.charAt(0);
}
</script>
