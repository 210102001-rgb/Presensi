<template>
    <Head title="Kelola Pengajar - Admin" />
    <AppLayout>
        <div class="space-y-8">
            <!-- Header -->
            <div class="md:flex md:items-center md:justify-between">
                <div class="min-w-0 flex-1">
                    <h2
                        class="text-xl sm:text-2xl font-bold leading-7 text-gray-900 sm:truncate sm:text-3xl sm:tracking-tight"
                    >
                        Kelola Pengajar
                    </h2>
                    <p class="mt-1 text-sm text-gray-500">
                        Kelola data pengajar dan admin sistem.
                    </p>
                </div>
                <div class="mt-4 flex md:ml-4 md:mt-0">
                    <Link
                        href="/admin/users/create"
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
                        <span class="hidden sm:inline">Tambah Pengajar</span>
                        <span class="sm:hidden">Tambah</span>
                    </Link>
                </div>
            </div>

            <!-- Users Table -->
            <div class="bg-white shadow rounded-lg overflow-hidden">
                <div v-if="users.data.length === 0" class="text-center py-12">
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
                            d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197m13.5-9a2.5 2.5 0 11-5 0 2.5 2.5 0 015 0z"
                        ></path>
                    </svg>
                    <h3 class="mt-2 text-sm font-medium text-gray-900">
                        Belum ada pengajar
                    </h3>
                    <p class="mt-1 text-sm text-gray-500">
                        Mulai dengan menambahkan pengajar pertama.
                    </p>
                    <div class="mt-6">
                        <Link
                            href="/admin/users/create"
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
                            Tambah Pengajar
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
                                        NIP
                                    </th>
                                    <th
                                        class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                                    >
                                        Email
                                    </th>
                                    <th
                                        class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                                    >
                                        Role
                                    </th>
                                    <th
                                        class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                                    >
                                        Status
                                    </th>
                                    <th
                                        class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                                    >
                                        Mata Pelajaran
                                    </th>
                                    <th class="relative px-6 py-3">
                                        <span class="sr-only">Actions</span>
                                    </th>
                                </tr>
                            </thead>
                            <tbody class="bg-white divide-y divide-gray-200">
                                <tr
                                    v-for="user in users.data"
                                    :key="user.id"
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
                                                            user.name.charAt(0)
                                                        }}
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="ml-4">
                                                <div
                                                    class="text-sm font-medium text-gray-900"
                                                >
                                                    {{ user.name }}
                                                </div>
                                                <div
                                                    class="text-sm text-gray-500"
                                                >
                                                    {{ user.phone || "-" }}
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td
                                        class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"
                                    >
                                        {{ user.nip }}
                                    </td>
                                    <td
                                        class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"
                                    >
                                        {{ user.email }}
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <span
                                            class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium"
                                            :class="{
                                                'bg-purple-100 text-purple-800':
                                                    user.role === 'admin',
                                                'bg-blue-100 text-blue-800':
                                                    user.role === 'pengajar',
                                            }"
                                        >
                                            {{
                                                user.role === "admin"
                                                    ? "Admin"
                                                    : "Pengajar"
                                            }}
                                        </span>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <span
                                            class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium"
                                            :class="{
                                                'bg-green-100 text-green-800':
                                                    user.is_active,
                                                'bg-red-100 text-red-800':
                                                    !user.is_active,
                                            }"
                                        >
                                            {{
                                                user.is_active
                                                    ? "Aktif"
                                                    : "Nonaktif"
                                            }}
                                        </span>
                                    </td>
                                    <td
                                        class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"
                                    >
                                        {{ user.subject || "-" }}
                                    </td>
                                    <td
                                        class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium"
                                    >
                                        <div
                                            class="flex items-center space-x-2"
                                        >
                                            <Link
                                                :href="`/admin/users/${user.id}`"
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
                                                :href="`/admin/users/${user.id}/edit`"
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
                                                    confirmUserDeletion(user)
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
                            v-for="user in users.data"
                            :key="user.id"
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
                                                {{ user.name.charAt(0) }}
                                            </span>
                                        </div>
                                    </div>
                                    <div class="min-w-0 flex-1">
                                        <p
                                            class="text-sm font-medium text-gray-900 truncate"
                                        >
                                            {{ user.name }}
                                        </p>
                                        <p class="text-xs text-gray-500">
                                            {{ user.nip }} • {{ user.email }}
                                        </p>
                                        <div
                                            class="flex items-center space-x-2 mt-1"
                                        >
                                            <span
                                                class="inline-flex items-center px-2 py-0.5 rounded text-xs font-medium"
                                                :class="{
                                                    'bg-purple-100 text-purple-800':
                                                        user.role === 'admin',
                                                    'bg-blue-100 text-blue-800':
                                                        user.role ===
                                                        'pengajar',
                                                }"
                                            >
                                                {{
                                                    user.role === "admin"
                                                        ? "Admin"
                                                        : "Pengajar"
                                                }}
                                            </span>
                                            <span
                                                class="inline-flex items-center px-2 py-0.5 rounded text-xs font-medium"
                                                :class="{
                                                    'bg-green-100 text-green-800':
                                                        user.is_active,
                                                    'bg-red-100 text-red-800':
                                                        !user.is_active,
                                                }"
                                            >
                                                {{
                                                    user.is_active
                                                        ? "Aktif"
                                                        : "Nonaktif"
                                                }}
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="flex items-center space-x-2">
                                    <Link
                                        :href="`/admin/users/${user.id}`"
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
                                        :href="`/admin/users/${user.id}/edit`"
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
                                        @click="confirmUserDeletion(user)"
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
                        v-if="users.links"
                        class="bg-white px-4 py-3 border-t border-gray-200 sm:px-6"
                    >
                        <div class="flex items-center justify-between">
                            <div class="flex-1 flex justify-between sm:hidden">
                                <Link
                                    v-if="users.prev_page_url"
                                    :href="users.prev_page_url"
                                    class="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50"
                                >
                                    Sebelumnya
                                </Link>
                                <Link
                                    v-if="users.next_page_url"
                                    :href="users.next_page_url"
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
                                            users.from
                                        }}</span>
                                        sampai
                                        <span class="font-medium">{{
                                            users.to
                                        }}</span>
                                        dari
                                        <span class="font-medium">{{
                                            users.total
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
                                            v-for="link in users.links"
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
            :show="confirmingUserDeletion"
            @close="closeModal"
        >
            <template #title>
                <h3 class="text-lg font-medium text-gray-900">
                    Hapus Pengguna
                </h3>
            </template>

            <template #content>
                <p class="text-sm text-gray-500">
                    Apakah Anda yakin ingin menghapus pengguna ini?
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
                    @click="deleteUser"
                    class="px-4 py-2 ml-3 text-white bg-red-600 rounded-md hover:bg-red-500"
                >
                    Hapus Pengguna
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

const confirmingUserDeletion = ref(false);
const userToDelete = ref(null);

const confirmUserDeletion = (user) => {
    userToDelete.value = user;
    confirmingUserDeletion.value = true;
};

const closeModal = () => {
    confirmingUserDeletion.value = false;
    userToDelete.value = null;
};

const deleteUser = () => {
    if (userToDelete.value) {
        router.delete(`/admin/users/${userToDelete.value.id}`, {
            preserveScroll: true,
            onSuccess: () => {
                closeModal();
                router.reload({ only: ["users"] });
            },
            onError: () => {
                closeModal();
            },
        });
    }
};

defineProps({
    users: Object,
});
</script>
