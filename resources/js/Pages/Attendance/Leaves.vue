<template>
    <Head title="Riwayat Izin - Absensi Pengajar" />
    <div class="space-y-6">
        <!-- HEADER -->
        <div
            class="bg-gradient-to-r from-yellow-50 to-orange-50 p-6 rounded-xl shadow-sm border border-yellow-100"
        >
            <div
                class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4"
            >
                <div>
                    <h2
                        class="text-2xl font-bold text-gray-800 flex items-center gap-3"
                    >
                        <div class="bg-yellow-600 p-2 rounded-lg">
                            <svg
                                class="w-6 h-6 text-white"
                                fill="none"
                                stroke="currentColor"
                                viewBox="0 0 24 24"
                            >
                                <path
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    stroke-width="2"
                                    d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"
                                />
                            </svg>
                        </div>
                        Riwayat Izin Saya
                    </h2>
                    <p class="text-sm text-gray-600 mt-2">
                        Lihat status dan riwayat pengajuan izin Anda
                    </p>
                </div>
                <Link
                    href="/attendance"
                    class="inline-flex items-center gap-2 bg-yellow-600 text-white px-5 py-2.5 rounded-lg text-sm font-medium shadow-md hover:bg-yellow-700 hover:shadow-lg transition-all duration-200"
                >
                    <svg
                        class="w-5 h-5"
                        fill="none"
                        stroke="currentColor"
                        viewBox="0 0 24 24"
                    >
                        <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            stroke-width="2"
                            d="M12 4v16m8-8H4"
                        />
                    </svg>
                    Ajukan Izin Baru
                </Link>
            </div>
        </div>

        <!-- STATS CARDS -->
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
            <div
                class="bg-white p-5 rounded-xl shadow-sm border-l-4 border-blue-500"
            >
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-sm text-gray-600 font-medium">
                            Total Izin
                        </p>
                        <p class="text-2xl font-bold text-gray-900 mt-1">
                            {{ stats.total || 0 }}
                        </p>
                    </div>
                    <div class="bg-blue-100 p-3 rounded-lg">
                        <svg
                            class="w-6 h-6 text-blue-600"
                            fill="none"
                            stroke="currentColor"
                            viewBox="0 0 24 24"
                        >
                            <path
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                stroke-width="2"
                                d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"
                            />
                        </svg>
                    </div>
                </div>
            </div>

            <div
                class="bg-white p-5 rounded-xl shadow-sm border-l-4 border-yellow-500"
            >
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-sm text-gray-600 font-medium">
                            Menunggu
                        </p>
                        <p class="text-2xl font-bold text-gray-900 mt-1">
                            {{ stats.pending || 0 }}
                        </p>
                    </div>
                    <div class="bg-yellow-100 p-3 rounded-lg">
                        <svg
                            class="w-6 h-6 text-yellow-600"
                            fill="none"
                            stroke="currentColor"
                            viewBox="0 0 24 24"
                        >
                            <path
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                stroke-width="2"
                                d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"
                            />
                        </svg>
                    </div>
                </div>
            </div>

            <div
                class="bg-white p-5 rounded-xl shadow-sm border-l-4 border-green-500"
            >
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-sm text-gray-600 font-medium">
                            Disetujui
                        </p>
                        <p class="text-2xl font-bold text-gray-900 mt-1">
                            {{ stats.approved || 0 }}
                        </p>
                    </div>
                    <div class="bg-green-100 p-3 rounded-lg">
                        <svg
                            class="w-6 h-6 text-green-600"
                            fill="none"
                            stroke="currentColor"
                            viewBox="0 0 24 24"
                        >
                            <path
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                stroke-width="2"
                                d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"
                            />
                        </svg>
                    </div>
                </div>
            </div>

            <div
                class="bg-white p-5 rounded-xl shadow-sm border-l-4 border-red-500"
            >
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-sm text-gray-600 font-medium">Ditolak</p>
                        <p class="text-2xl font-bold text-gray-900 mt-1">
                            {{ stats.rejected || 0 }}
                        </p>
                    </div>
                    <div class="bg-red-100 p-3 rounded-lg">
                        <svg
                            class="w-6 h-6 text-red-600"
                            fill="none"
                            stroke="currentColor"
                            viewBox="0 0 24 24"
                        >
                            <path
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                stroke-width="2"
                                d="M6 18L18 6M6 6l12 12"
                            />
                        </svg>
                    </div>
                </div>
            </div>
        </div>

        <!-- LEAVES LIST -->
        <div class="bg-white rounded-xl shadow-sm border border-gray-200">
            <div class="p-6 border-b border-gray-200">
                <h3 class="text-lg font-semibold text-gray-900">
                    Daftar Pengajuan Izin
                </h3>
            </div>

            <!-- EMPTY STATE -->
            <div v-if="leaves.data.length === 0" class="text-center py-16">
                <div
                    class="bg-gray-100 w-20 h-20 rounded-full flex items-center justify-center mx-auto mb-4"
                >
                    <svg
                        class="w-10 h-10 text-gray-400"
                        fill="none"
                        stroke="currentColor"
                        viewBox="0 0 24 24"
                    >
                        <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            stroke-width="2"
                            d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"
                        />
                    </svg>
                </div>
                <h3 class="text-lg font-semibold text-gray-900 mb-2">
                    Belum ada pengajuan izin
                </h3>
                <p class="text-sm text-gray-500 mb-4">
                    Anda belum mengajukan izin apapun
                </p>
                <Link
                    href="/attendance"
                    class="inline-flex items-center gap-2 bg-yellow-600 text-white px-4 py-2 rounded-lg text-sm font-medium hover:bg-yellow-700 transition-colors"
                >
                    <svg
                        class="w-5 h-5"
                        fill="none"
                        stroke="currentColor"
                        viewBox="0 0 24 24"
                    >
                        <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            stroke-width="2"
                            d="M12 4v16m8-8H4"
                        />
                    </svg>
                    Ajukan Izin Sekarang
                </Link>
            </div>

            <!-- LEAVES CARDS -->
            <div v-else class="divide-y divide-gray-200">
                <div
                    v-for="leave in leaves.data"
                    :key="leave.id"
                    class="p-6 hover:bg-gray-50 transition-colors"
                >
                    <div
                        class="flex flex-col lg:flex-row lg:items-start lg:justify-between gap-4"
                    >
                        <!-- LEFT SECTION -->
                        <div class="flex-1">
                            <div class="flex items-start gap-4">
                                <div class="flex-shrink-0">
                                    <div
                                        class="w-12 h-12 rounded-xl flex items-center justify-center"
                                        :class="
                                            getLeaveTypeColor(leave.leave_type)
                                        "
                                    >
                                        <span class="text-2xl">{{
                                            getLeaveTypeIcon(leave.leave_type)
                                        }}</span>
                                    </div>
                                </div>
                                <div class="flex-1 min-w-0">
                                    <div class="flex items-center gap-2 mb-2">
                                        <h4
                                            class="text-lg font-semibold text-gray-900"
                                        >
                                            {{
                                                getLeaveTypeName(
                                                    leave.leave_type
                                                )
                                            }}
                                        </h4>
                                        <span
                                            class="px-3 py-1 text-xs font-bold rounded-full"
                                            :class="
                                                getStatusClass(leave.status)
                                            "
                                        >
                                            {{ getStatusText(leave.status) }}
                                        </span>
                                    </div>
                                    <div class="space-y-2 text-sm">
                                        <div
                                            class="flex items-center gap-2 text-gray-600"
                                        >
                                            <svg
                                                class="w-4 h-4"
                                                fill="none"
                                                stroke="currentColor"
                                                viewBox="0 0 24 24"
                                            >
                                                <path
                                                    stroke-linecap="round"
                                                    stroke-linejoin="round"
                                                    stroke-width="2"
                                                    d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"
                                                />
                                            </svg>
                                            <span class="font-medium">{{
                                                formatDate(leave.leave_date)
                                            }}</span>
                                        </div>
                                        <div
                                            v-if="leave.schedule"
                                            class="flex items-center gap-2 text-gray-600"
                                        >
                                            <svg
                                                class="w-4 h-4"
                                                fill="none"
                                                stroke="currentColor"
                                                viewBox="0 0 24 24"
                                            >
                                                <path
                                                    stroke-linecap="round"
                                                    stroke-linejoin="round"
                                                    stroke-width="2"
                                                    d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"
                                                />
                                            </svg>
                                            <span
                                                >{{ leave.schedule.subject }} -
                                                {{ leave.schedule.class }}</span
                                            >
                                        </div>
                                        <p class="text-gray-700 mt-2">
                                            {{ leave.reason }}
                                        </p>

                                        <!-- Admin Note -->
                                        <div
                                            v-if="leave.admin_note"
                                            class="mt-3 p-3 bg-blue-50 border-l-4 border-blue-500 rounded"
                                        >
                                            <p
                                                class="text-xs font-semibold text-blue-900 mb-1"
                                            >
                                                Catatan Admin:
                                            </p>
                                            <p class="text-sm text-blue-800">
                                                {{ leave.admin_note }}
                                            </p>
                                        </div>
                                        
                                        <!-- Attendance Status Note -->
                                        <div
                                            v-if="leave.status === 'approved'"
                                            class="mt-3 p-3 bg-green-50 border-l-4 border-green-500 rounded"
                                        >
                                            <p
                                                class="text-xs font-semibold text-green-900 mb-1"
                                            >
                                                Status Presensi:
                                            </p>
                                            <p class="text-sm text-green-800">
                                                Izin Anda telah disetujui dan status presensi untuk tanggal ini telah diubah menjadi "Izin".
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- RIGHT SECTION -->
                        <div class="flex flex-col items-end gap-3">
                            <div class="text-right text-xs text-gray-500">
                                Diajukan {{ formatDateTime(leave.created_at) }}
                            </div>
                            <div v-if="leave.attachment" class="flex gap-2">
                                <a
                                    :href="`/storage/${leave.attachment}`"
                                    target="_blank"
                                    class="inline-flex items-center gap-2 px-3 py-2 bg-gray-100 hover:bg-gray-200 text-gray-700 rounded-lg text-xs font-medium transition-colors"
                                >
                                    <svg
                                        class="w-4 h-4"
                                        fill="none"
                                        stroke="currentColor"
                                        viewBox="0 0 24 24"
                                    >
                                        <path
                                            stroke-linecap="round"
                                            stroke-linejoin="round"
                                            stroke-width="2"
                                            d="M15.172 7l-6.586 6.586a2 2 0 102.828 2.828l6.414-6.586a4 4 0 00-5.656-5.656l-6.415 6.585a6 6 0 108.486 8.486L20.5 13"
                                        />
                                    </svg>
                                    Lihat Lampiran
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- PAGINATION -->
            <div
                v-if="leaves.links && leaves.links.length > 3"
                class="p-6 border-t border-gray-200"
            >
                <div class="flex justify-center items-center gap-3">
                    <button
                        :disabled="!leaves.prev_page_url"
                        class="px-4 py-2 rounded-lg border border-gray-300 bg-white hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed text-sm font-medium text-gray-700 transition-all"
                        @click="goToPage(leaves.current_page - 1)"
                    >
                        <span class="flex items-center gap-2">
                            <svg
                                class="w-4 h-4"
                                fill="none"
                                stroke="currentColor"
                                viewBox="0 0 24 24"
                            >
                                <path
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    stroke-width="2"
                                    d="M15 19l-7-7 7-7"
                                />
                            </svg>
                            Sebelumnya
                        </span>
                    </button>

                    <span
                        class="text-sm font-medium text-gray-700 bg-gray-100 px-4 py-2 rounded-lg"
                    >
                        {{ leaves.current_page }} / {{ leaves.last_page }}
                    </span>

                    <button
                        :disabled="!leaves.next_page_url"
                        class="px-4 py-2 rounded-lg border border-gray-300 bg-white hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed text-sm font-medium text-gray-700 transition-all"
                        @click="goToPage(leaves.current_page + 1)"
                    >
                        <span class="flex items-center gap-2">
                            Selanjutnya
                            <svg
                                class="w-4 h-4"
                                fill="none"
                                stroke="currentColor"
                                viewBox="0 0 24 24"
                            >
                                <path
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    stroke-width="2"
                                    d="M9 5l7 7-7 7"
                                />
                            </svg>
                        </span>
                    </button>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { router, Link, Head } from "@inertiajs/vue3";
import AppLayout from "@/Layouts/AppLayout.vue";

defineOptions({ layout: AppLayout });

const props = defineProps({
    leaves: { type: Object, required: true },
    stats: { type: Object, required: true },
});

function goToPage(page) {
    router.get(
        "/attendance/leaves",
        { page },
        {
            preserveState: true,
            replace: true,
        }
    );
}

function formatDate(dateString) {
    const date = new Date(dateString);
    return date.toLocaleDateString("id-ID", {
        weekday: "long",
        year: "numeric",
        month: "long",
        day: "numeric",
    });
}

function formatDateTime(dateString) {
    const date = new Date(dateString);
    return date.toLocaleDateString("id-ID", {
        year: "numeric",
        month: "short",
        day: "numeric",
        hour: "2-digit",
        minute: "2-digit",
    });
}

function getLeaveTypeName(type) {
    const types = {
        izin: "Izin",
        sakit: "Sakit",
        cuti: "Cuti",
    };
    return types[type] || type;
}

function getLeaveTypeIcon(type) {
    const icons = {
        izin: "📋",
        sakit: "🏥",
        cuti: "🏖️",
    };
    return icons[type] || "📋";
}

function getLeaveTypeColor(type) {
    const colors = {
        izin: "bg-blue-100",
        sakit: "bg-red-100",
        cuti: "bg-green-100",
    };
    return colors[type] || "bg-gray-100";
}

function getStatusClass(status) {
    const classes = {
        pending: "bg-yellow-100 text-yellow-800 border border-yellow-200",
        approved: "bg-green-100 text-green-800 border border-green-200",
        rejected: "bg-red-100 text-red-800 border border-red-200",
    };
    return (
        classes[status] || "bg-gray-100 text-gray-800 border border-gray-200"
    );
}

function getStatusText(status) {
    const texts = {
        pending: "Menunggu",
        approved: "Disetujui",
        rejected: "Ditolak",
    };
    return texts[status] || status;
}
</script>