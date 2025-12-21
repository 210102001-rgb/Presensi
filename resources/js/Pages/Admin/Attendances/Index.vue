<template>
    <AppLayout>
        <div class="space-y-8">
            <!-- Header -->
            <div class="md:flex md:items-center md:justify-between">
                <div class="min-w-0 flex-1">
                    <h2
                        class="text-xl sm:text-2xl font-bold leading-7 text-gray-900 sm:truncate sm:text-3xl sm:tracking-tight"
                    >
                        Kelola Presensi
                    </h2>
                    <p class="mt-1 text-sm text-gray-500">
                        Kelola data presensi pengajar.
                    </p>
                </div>
                <div class="mt-4 flex md:ml-4 md:mt-0">
                    <Link
                        href="/admin/attendances/create"
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
                        <span class="hidden sm:inline">Tambah Presensi</span>
                        <span class="sm:hidden">Tambah</span>
                    </Link>
                </div>
            </div>

            <!-- Attendances Table -->
            <div class="bg-white shadow rounded-lg overflow-hidden">
                <div
                    v-if="attendances.data.length === 0"
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
                            d="M9 5H7a2 2 0 00-2 2v10a2 2 0 002 2h8a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"
                        ></path>
                    </svg>
                    <h3 class="mt-2 text-sm font-medium text-gray-900">
                        Belum ada presensi
                    </h3>
                    <p class="mt-1 text-sm text-gray-500">
                        Data presensi akan muncul di sini.
                    </p>
                    <div class="mt-6">
                        <Link
                            href="/admin/attendances/create"
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
                            Tambah Presensi
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
                                        Jadwal
                                    </th>
                                    <th
                                        class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                                    >
                                        Tanggal
                                    </th>
                                    <th
                                        class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                                    >
                                        Status
                                    </th>
                                    <th
                                        class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                                    >
                                        Persetujuan
                                    </th>
                                    <th
                                        class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                                    >
                                        Check In
                                    </th>
                                    <th
                                        class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                                    >
                                        Check Out
                                    </th>
                                    <th class="relative px-6 py-3">
                                        <span class="sr-only">Actions</span>
                                    </th>
                                </tr>
                            </thead>
                            <tbody class="bg-white divide-y divide-gray-200">
                                <tr
                                    v-for="attendance in attendances.data"
                                    :key="attendance.id"
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
                                                            attendance.teacher?.name?.charAt(
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
                                                    {{
                                                        attendance.teacher?.name
                                                    }}
                                                </div>
                                                <div
                                                    class="text-sm text-gray-500"
                                                >
                                                    {{
                                                        attendance.teacher?.nip
                                                    }}
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <div class="text-sm text-gray-900">
                                            {{ attendance.schedule?.subject }}
                                        </div>
                                        <div class="text-sm text-gray-500">
                                            {{ attendance.schedule?.class }}
                                        </div>
                                    </td>
                                    <td
                                        class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"
                                    >
                                        {{
                                            new Date(
                                                attendance.date
                                            ).toLocaleDateString("id-ID")
                                        }}
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <span
                                            class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium"
                                            :class="{
                                                'bg-green-100 text-green-800':
                                                    attendance.status ===
                                                    'hadir',
                                                'bg-yellow-100 text-yellow-800':
                                                    attendance.status ===
                                                    'terlambat',
                                                'bg-blue-100 text-blue-800':
                                                    attendance.status ===
                                                    'izin',
                                                'bg-red-100 text-red-800':
                                                    attendance.status ===
                                                    'alpha',
                                            }"
                                        >
                                            {{ attendance.status }}
                                        </span>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <div class="flex flex-col space-y-1">
                                            <span
                                                class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium w-fit"
                                                :class="{
                                                    'bg-yellow-100 text-yellow-800':
                                                        attendance.approval_status ===
                                                        'pending',
                                                    'bg-green-100 text-green-800':
                                                        attendance.approval_status ===
                                                        'approved',
                                                    'bg-red-100 text-red-800':
                                                        attendance.approval_status ===
                                                        'rejected',
                                                }"
                                            >
                                                {{
                                                    attendance.approval_status ===
                                                    "pending"
                                                        ? "Menunggu"
                                                        : attendance.approval_status ===
                                                          "approved"
                                                        ? "Disetujui"
                                                        : "Ditolak"
                                                }}
                                            </span>
                                            <div
                                                v-if="
                                                    attendance.approval_status ===
                                                    'pending'
                                                "
                                                class="flex gap-1"
                                            >
                                                <button
                                                    @click="
                                                        confirmApproval(
                                                            attendance
                                                        )
                                                    "
                                                    class="inline-flex items-center px-2 py-1 text-xs font-medium text-green-700 bg-green-50 rounded hover:bg-green-100"
                                                    title="Setujui"
                                                >
                                                    <svg
                                                        class="w-3 h-3"
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
                                                </button>
                                                <button
                                                    @click="
                                                        confirmRejection(
                                                            attendance
                                                        )
                                                    "
                                                    class="inline-flex items-center px-2 py-1 text-xs font-medium text-red-700 bg-red-50 rounded hover:bg-red-100"
                                                    title="Tolak"
                                                >
                                                    <svg
                                                        class="w-3 h-3"
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
                                                </button>
                                            </div>
                                        </div>
                                    </td>
                                    <td
                                        class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"
                                    >
                                        {{ attendance.check_in_time || "-" }}
                                    </td>
                                    <td
                                        class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"
                                    >
                                        {{ attendance.check_out_time || "-" }}
                                    </td>
                                    <td
                                        class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium"
                                    >
                                        <div
                                            class="flex items-center space-x-2"
                                        >
                                            <Link
                                                :href="`/admin/attendances/${attendance.id}`"
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
                                                :href="`/admin/attendances/${attendance.id}/edit`"
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
                                                    confirmAttendanceDeletion(
                                                        attendance
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
                            v-for="attendance in attendances.data"
                            :key="attendance.id"
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
                                                    attendance.teacher?.name?.charAt(
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
                                            {{ attendance.teacher?.name }}
                                        </p>
                                        <p
                                            class="text-xs text-gray-500 truncate"
                                        >
                                            {{ attendance.schedule?.subject }} -
                                            {{ attendance.schedule?.class }}
                                        </p>
                                        <div
                                            class="flex items-center space-x-2 mt-1"
                                        >
                                            <span
                                                class="text-xs text-gray-500"
                                                >{{
                                                    new Date(
                                                        attendance.date
                                                    ).toLocaleDateString(
                                                        "id-ID"
                                                    )
                                                }}</span
                                            >
                                            <span
                                                class="inline-flex items-center px-2 py-0.5 rounded text-xs font-medium"
                                                :class="{
                                                    'bg-green-100 text-green-800':
                                                        attendance.status ===
                                                        'hadir',
                                                    'bg-yellow-100 text-yellow-800':
                                                        attendance.status ===
                                                        'terlambat',
                                                    'bg-blue-100 text-blue-800':
                                                        attendance.status ===
                                                        'izin',
                                                    'bg-red-100 text-red-800':
                                                        attendance.status ===
                                                        'alpha',
                                                }"
                                            >
                                                {{ attendance.status }}
                                            </span>
                                            <span
                                                class="inline-flex items-center px-2 py-0.5 rounded text-xs font-medium"
                                                :class="{
                                                    'bg-yellow-100 text-yellow-800':
                                                        attendance.approval_status ===
                                                        'pending',
                                                    'bg-green-100 text-green-800':
                                                        attendance.approval_status ===
                                                        'approved',
                                                    'bg-red-100 text-red-800':
                                                        attendance.approval_status ===
                                                        'rejected',
                                                }"
                                            >
                                                {{
                                                    attendance.approval_status ===
                                                    "pending"
                                                        ? "Menunggu"
                                                        : attendance.approval_status ===
                                                          "approved"
                                                        ? "Disetujui"
                                                        : "Ditolak"
                                                }}
                                            </span>
                                        </div>
                                        <div
                                            v-if="
                                                attendance.approval_status ===
                                                'pending'
                                            "
                                            class="flex gap-1 mt-2"
                                        >
                                            <button
                                                @click="
                                                    confirmApproval(attendance)
                                                "
                                                class="inline-flex items-center px-2 py-1 text-xs font-medium text-green-700 bg-green-50 rounded hover:bg-green-100"
                                            >
                                                <svg
                                                    class="w-3 h-3 mr-1"
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
                                                Setujui
                                            </button>
                                            <button
                                                @click="
                                                    confirmRejection(attendance)
                                                "
                                                class="inline-flex items-center px-2 py-1 text-xs font-medium text-red-700 bg-red-50 rounded hover:bg-red-100"
                                            >
                                                <svg
                                                    class="w-3 h-3 mr-1"
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
                                                Tolak
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="flex items-center space-x-2">
                                    <Link
                                        :href="`/admin/attendances/${attendance.id}`"
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
                                        :href="`/admin/attendances/${attendance.id}/edit`"
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
                                            confirmAttendanceDeletion(
                                                attendance
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
                            </div>
                        </div>
                    </div>

                    <!-- Pagination -->
                    <div
                        v-if="attendances.links"
                        class="bg-white px-4 py-3 border-t border-gray-200 sm:px-6"
                    >
                        <div class="flex items-center justify-between">
                            <div class="flex-1 flex justify-between sm:hidden">
                                <Link
                                    v-if="attendances.prev_page_url"
                                    :href="attendances.prev_page_url"
                                    class="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50"
                                >
                                    Sebelumnya
                                </Link>
                                <Link
                                    v-if="attendances.next_page_url"
                                    :href="attendances.next_page_url"
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
                                            attendances.from
                                        }}</span>
                                        sampai
                                        <span class="font-medium">{{
                                            attendances.to
                                        }}</span>
                                        dari
                                        <span class="font-medium">{{
                                            attendances.total
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
                                            v-for="link in attendances.links"
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
            :show="confirmingAttendanceDeletion"
            @close="closeModal"
        >
            <template #title>
                <h3 class="text-lg font-medium text-gray-900">
                    Hapus Presensi
                </h3>
            </template>

            <template #content>
                <p class="text-sm text-gray-500">
                    Apakah Anda yakin ingin menghapus presensi ini?
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
                    @click="deleteAttendance"
                    class="px-4 py-2 ml-3 text-white bg-red-600 rounded-md hover:bg-red-500"
                >
                    Hapus Presensi
                </button>
            </template>
        </NewConfirmationModal>

        <!-- Approval Modal -->
        <NewConfirmationModal
            :show="confirmingApproval"
            @close="closeApprovalModal"
        >
            <template #title>
                <h3 class="text-lg font-medium text-gray-900">
                    Setujui Presensi
                </h3>
            </template>

            <template #content>
                <p class="text-sm text-gray-500 mb-4">
                    Apakah Anda yakin ingin menyetujui presensi ini?
                </p>
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">
                        Catatan (Opsional)
                    </label>
                    <textarea
                        v-model="approvalNote"
                        rows="3"
                        class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                        placeholder="Tambahkan catatan persetujuan..."
                    ></textarea>
                </div>
            </template>

            <template #footer>
                <button
                    @click="closeApprovalModal"
                    class="px-4 py-2 text-gray-600 rounded-md hover:bg-gray-100"
                >
                    Batal
                </button>
                <button
                    @click="approveAttendance"
                    class="px-4 py-2 ml-3 text-white bg-green-600 rounded-md hover:bg-green-500"
                >
                    Setujui
                </button>
            </template>
        </NewConfirmationModal>

        <!-- Rejection Modal -->
        <NewConfirmationModal
            :show="confirmingRejection"
            @close="closeRejectionModal"
        >
            <template #title>
                <h3 class="text-lg font-medium text-gray-900">
                    Tolak Presensi
                </h3>
            </template>

            <template #content>
                <p class="text-sm text-gray-500 mb-4">
                    Apakah Anda yakin ingin menolak presensi ini?
                </p>
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">
                        Alasan Penolakan <span class="text-red-500">*</span>
                    </label>
                    <textarea
                        v-model="rejectionNote"
                        rows="3"
                        class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                        placeholder="Jelaskan alasan penolakan..."
                        required
                    ></textarea>
                    <p v-if="rejectionError" class="mt-1 text-sm text-red-600">
                        {{ rejectionError }}
                    </p>
                </div>
            </template>

            <template #footer>
                <button
                    @click="closeRejectionModal"
                    class="px-4 py-2 text-gray-600 rounded-md hover:bg-gray-100"
                >
                    Batal
                </button>
                <button
                    @click="rejectAttendance"
                    class="px-4 py-2 ml-3 text-white bg-red-600 rounded-md hover:bg-red-500"
                >
                    Tolak
                </button>
            </template>
        </NewConfirmationModal>
    </AppLayout>
</template>

<script setup>
import { Link, router } from "@inertiajs/vue3";
import AppLayout from "@/Layouts/AppLayout.vue";
import { ref } from "vue";
import NewConfirmationModal from "@/Components/NewConfirmationModal.vue";

const confirmingAttendanceDeletion = ref(false);
const attendanceToDelete = ref(null);
const confirmingApproval = ref(false);
const confirmingRejection = ref(false);
const attendanceToProcess = ref(null);
const approvalNote = ref("");
const rejectionNote = ref("");
const rejectionError = ref("");

defineProps({
    attendances: Object,
});

const confirmAttendanceDeletion = (attendance) => {
    attendanceToDelete.value = attendance;
    confirmingAttendanceDeletion.value = true;
};

const closeModal = () => {
    confirmingAttendanceDeletion.value = false;
    attendanceToDelete.value = null;
};

const deleteAttendance = () => {
    if (attendanceToDelete.value) {
        router.delete(`/admin/attendances/${attendanceToDelete.value.id}`, {
            preserveScroll: true,
            onSuccess: () => {
                closeModal();
                router.reload({ only: ["attendances"] });
            },
            onError: () => {
                closeModal();
            },
        });
    }
};

const confirmApproval = (attendance) => {
    attendanceToProcess.value = attendance;
    approvalNote.value = "";
    confirmingApproval.value = true;
};

const closeApprovalModal = () => {
    confirmingApproval.value = false;
    attendanceToProcess.value = null;
    approvalNote.value = "";
};

const approveAttendance = () => {
    if (attendanceToProcess.value) {
        router.post(
            `/admin/attendances/${attendanceToProcess.value.id}/approve`,
            {
                approval_note: approvalNote.value,
            },
            {
                preserveScroll: true,
                onSuccess: () => {
                    closeApprovalModal();
                },
                onError: () => {
                    closeApprovalModal();
                },
            }
        );
    }
};

const confirmRejection = (attendance) => {
    attendanceToProcess.value = attendance;
    rejectionNote.value = "";
    rejectionError.value = "";
    confirmingRejection.value = true;
};

const closeRejectionModal = () => {
    confirmingRejection.value = false;
    attendanceToProcess.value = null;
    rejectionNote.value = "";
    rejectionError.value = "";
};

const rejectAttendance = () => {
    if (!rejectionNote.value.trim()) {
        rejectionError.value = "Alasan penolakan wajib diisi.";
        return;
    }

    if (attendanceToProcess.value) {
        router.post(
            `/admin/attendances/${attendanceToProcess.value.id}/reject`,
            {
                approval_note: rejectionNote.value,
            },
            {
                preserveScroll: true,
                onSuccess: () => {
                    closeRejectionModal();
                },
                onError: () => {
                    closeRejectionModal();
                },
            }
        );
    }
};
</script>
