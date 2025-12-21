<template>
    <Head title="Kelola Jadwal - Admin" />
    <AppLayout>
        <div class="space-y-8">
            <!-- Header -->
            <div class="md:flex md:items-center md:justify-between">
                <div class="min-w-0 flex-1">
                    <h2
                        class="text-xl sm:text-2xl font-bold leading-7 text-gray-900 sm:truncate sm:text-3xl sm:tracking-tight"
                    >
                        Kelola Jadwal
                    </h2>
                    <p class="mt-1 text-sm text-gray-500">
                        Kelola jadwal mengajar pengajar.
                    </p>
                </div>
                <div class="mt-4 flex md:ml-4 md:mt-0">
                    <Link
                        href="/admin/schedules/create"
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
                                d="M12 6v6m0 0v6m0-6h6m-6 0H6"
                            ></path>
                        </svg>
                        <span class="hidden sm:inline">Tambah Jadwal</span>
                        <span class="sm:hidden">Tambah</span>
                    </Link>
                </div>
            </div>

            <!-- Schedules Table -->
            <div class="bg-white shadow rounded-lg overflow-hidden">
                <div
                    v-if="schedules.data.length === 0"
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
                        Belum ada jadwal
                    </h3>
                    <p class="mt-1 text-sm text-gray-500">
                        Mulai dengan menambahkan jadwal pertama.
                    </p>
                    <div class="mt-6">
                        <Link
                            href="/admin/schedules/create"
                            class="inline-flex items-center rounded-md bg-blue-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-blue-500"
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
                                    d="M12 6v6m0 0v6m0-6h6m-6 0H6"
                                ></path>
                            </svg>
                            Tambah Jadwal
                        </Link>
                    </div>
                </div>

                <div v-else>
                    <!-- Desktop Table -->
                    <div class="hidden md:block overflow-x-auto">
                        <table class="min-w-full divide-y divide-gray-200">
                            <thead class="bg-gray-50">
                                <tr>
                                    <th
                                        class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                                    >
                                        Pengajar
                                    </th>
                                    <th
                                        class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                                    >
                                        Mata Pelajaran
                                    </th>
                                    <th
                                        class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                                    >
                                        Kelas
                                    </th>
                                    <th
                                        class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                                    >
                                        Hari
                                    </th>
                                    <th
                                        class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                                    >
                                        Waktu
                                    </th>
                                    <th
                                        class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                                    >
                                        Lokasi
                                    </th>
                                    <th class="relative px-6 py-3">
                                        <span class="sr-only">Actions</span>
                                    </th>
                                </tr>
                            </thead>
                            <tbody class="bg-white divide-y divide-gray-200">
                                <tr
                                    v-for="schedule in schedules.data"
                                    :key="schedule.id"
                                    class="hover:bg-gray-50"
                                >
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <div class="flex items-center">
                                            <div
                                                class="flex-shrink-0 h-10 w-10"
                                            >
                                                <div
                                                    class="h-10 w-10 rounded-full bg-blue-100 flex items-center justify-center"
                                                >
                                                    <span
                                                        class="text-sm font-medium text-blue-600"
                                                    >
                                                        {{
                                                            schedule.teacher?.name?.charAt(
                                                                0
                                                            )
                                                        }}
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="ml-4">
                                                <div
                                                    class="text-sm font-medium text-gray-900"
                                                >
                                                    {{ schedule.teacher?.name }}
                                                </div>
                                                <div
                                                    class="text-sm text-gray-500"
                                                >
                                                    {{ schedule.teacher?.nip }}
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td
                                        class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"
                                    >
                                        {{ schedule.subject }}
                                    </td>
                                    <td
                                        class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"
                                    >
                                        {{ schedule.class }}
                                    </td>
                                    <td
                                        class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"
                                    >
                                        {{ getDayName(schedule.day) }}
                                    </td>
                                    <td
                                        class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"
                                    >
                                        {{ schedule.start_time }} -
                                        {{ schedule.end_time }}
                                    </td>
                                    <td
                                        class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"
                                    >
                                        {{ schedule.location?.name || "-" }}
                                    </td>
                                    <td
                                        class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium"
                                    >
                                        <div
                                            class="flex items-center space-x-2"
                                        >
                                            <Link
                                                :href="`/admin/schedules/${schedule.id}`"
                                                class="text-blue-600 hover:text-blue-900"
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
                                                        d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"
                                                    ></path>
                                                    <path
                                                        stroke-linecap="round"
                                                        stroke-linejoin="round"
                                                        stroke-width="2"
                                                        d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"
                                                    ></path>
                                                </svg>
                                            </Link>
                                            <Link
                                                :href="`/admin/schedules/${schedule.id}/edit`"
                                                class="text-indigo-600 hover:text-indigo-900"
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
                                                        d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"
                                                    ></path>
                                                </svg>
                                            </Link>
                                            <button
                                                @click="
                                                    confirmScheduleDeletion(
                                                        schedule
                                                    )
                                                "
                                                class="text-red-600 hover:text-red-900"
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
                                                        d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"
                                                    ></path>
                                                </svg>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- Mobile Cards -->
                    <div class="md:hidden divide-y divide-gray-200">
                        <div
                            v-for="schedule in schedules.data"
                            :key="schedule.id"
                            class="p-4"
                        >
                            <div class="flex items-center justify-between">
                                <div class="flex items-center space-x-3">
                                    <div class="flex-shrink-0 h-10 w-10">
                                        <div
                                            class="h-10 w-10 rounded-full bg-blue-100 flex items-center justify-center"
                                        >
                                            <span
                                                class="text-sm font-medium text-blue-600"
                                            >
                                                {{
                                                    schedule.teacher?.name?.charAt(
                                                        0
                                                    )
                                                }}
                                            </span>
                                        </div>
                                    </div>
                                    <div class="min-w-0 flex-1">
                                        <p
                                            class="text-sm font-medium text-gray-900 truncate"
                                        >
                                            {{ schedule.teacher?.name }}
                                        </p>
                                        <p
                                            class="text-xs text-gray-500 truncate"
                                        >
                                            {{ schedule.subject }} -
                                            {{ schedule.class }}
                                        </p>
                                        <div
                                            class="flex items-center space-x-2 mt-1"
                                        >
                                            <span
                                                class="text-xs text-gray-500"
                                                >{{
                                                    getDayName(schedule.day)
                                                }}</span
                                            >
                                            <span class="text-xs text-gray-500"
                                                >• {{ schedule.start_time }} -
                                                {{ schedule.end_time }}</span
                                            >
                                            <span class="text-xs text-gray-500"
                                                >•
                                                {{
                                                    schedule.location?.name ||
                                                    "Lokasi"
                                                }}</span
                                            >
                                        </div>
                                    </div>
                                </div>
                                <div class="flex items-center space-x-2">
                                    <Link
                                        :href="`/admin/schedules/${schedule.id}`"
                                        class="text-blue-600 hover:text-blue-900"
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
                                                d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"
                                            ></path>
                                            <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="2"
                                                d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"
                                            ></path>
                                        </svg>
                                    </Link>
                                    <Link
                                        :href="`/admin/schedules/${schedule.id}/edit`"
                                        class="text-indigo-600 hover:text-indigo-900"
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
                                                d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"
                                            ></path>
                                        </svg>
                                    </Link>
                                    <button
                                        @click="
                                            confirmScheduleDeletion(schedule)
                                        "
                                        class="text-red-600 hover:text-red-900"
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
                                                d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"
                                            ></path>
                                        </svg>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Pagination -->
                    <div
                        v-if="schedules.links"
                        class="bg-white px-4 py-3 border-t border-gray-200 sm:px-6"
                    >
                        <div class="flex items-center justify-between">
                            <div class="flex-1 flex justify-between sm:hidden">
                                <Link
                                    v-if="schedules.prev_page_url"
                                    :href="schedules.prev_page_url"
                                    class="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50"
                                >
                                    Sebelumnya
                                </Link>
                                <Link
                                    v-if="schedules.next_page_url"
                                    :href="schedules.next_page_url"
                                    class="ml-3 relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50"
                                >
                                    Selanjutnya
                                </Link>
                            </div>
                            <div
                                class="hidden sm:flex-1 sm:flex sm:items-center sm:justify-between"
                            >
                                <div>
                                    <p class="text-sm text-gray-700">
                                        Menampilkan
                                        <span class="font-medium">{{
                                            schedules.from
                                        }}</span>
                                        sampai
                                        <span class="font-medium">{{
                                            schedules.to
                                        }}</span>
                                        dari
                                        <span class="font-medium">{{
                                            schedules.total
                                        }}</span>
                                        hasil
                                    </p>
                                </div>
                                <div>
                                    <nav
                                        class="relative z-0 inline-flex rounded-md shadow-sm -space-x-px"
                                        aria-label="Pagination"
                                    >
                                        <Link
                                            v-for="link in schedules.links"
                                            :key="link.label"
                                            :href="link.url || '#'"
                                            v-html="link.label"
                                            class="relative inline-flex items-center px-4 py-2 border text-sm font-medium"
                                            :class="{
                                                'z-10 bg-blue-50 border-blue-500 text-blue-600':
                                                    link.active,
                                                'bg-white border-gray-300 text-gray-500 hover:bg-gray-50':
                                                    !link.active && link.url,
                                                'bg-white border-gray-300 text-gray-300 cursor-not-allowed':
                                                    !link.url,
                                            }"
                                        />
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <NewConfirmationModal
            :show="confirmingScheduleDeletion"
            @close="closeModal"
        >
            <template #title>
                <h3 class="text-lg font-medium text-gray-900">Hapus Jadwal</h3>
            </template>

            <template #content>
                <p class="text-sm text-gray-500">
                    Apakah Anda yakin ingin menghapus jadwal ini?
                </p>
            </template>

            <template #footer>
                <button
                    @click="closeModal"
                    class="px-4 py-2 text-gray-600 rounded-md hover:bg-gray-100"
                >
                    Batal
                </button>
                <button
                    @click="deleteSchedule"
                    class="px-4 py-2 ml-3 text-white bg-red-600 rounded-md hover:bg-red-500"
                >
                    Hapus Jadwal
                </button>
            </template>
        </NewConfirmationModal>
    </AppLayout>
</template>

<script setup>
import { Link, router, Head } from "@inertiajs/vue3";
import AppLayout from "@/Layouts/AppLayout.vue";
import { ref } from "vue";
import NewConfirmationModal from "@/Components/NewConfirmationModal.vue";

const confirmingScheduleDeletion = ref(false);
const scheduleToDelete = ref(null);

defineProps({
    schedules: Object,
});

const confirmScheduleDeletion = (schedule) => {
    scheduleToDelete.value = schedule;
    confirmingScheduleDeletion.value = true;
};

const closeModal = () => {
    confirmingScheduleDeletion.value = false;
    scheduleToDelete.value = null;
};

const deleteSchedule = () => {
    if (scheduleToDelete.value) {
        router.delete(`/admin/schedules/${scheduleToDelete.value.id}`, {
            preserveScroll: true,
            onSuccess: () => {
                closeModal();
                router.reload({ only: ["schedules"] });
            },
            onError: () => {
                closeModal();
            },
        });
    }
};

function getDayName(day) {
    const days = {
        monday: "Senin",
        tuesday: "Selasa",
        wednesday: "Rabu",
        thursday: "Kamis",
        friday: "Jumat",
        saturday: "Sabtu",
        sunday: "Minggu",
    };
    return days[day] || day;
}
</script>
