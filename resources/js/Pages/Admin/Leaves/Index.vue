<template>
    <Head title="Manajemen Izin - Admin" />
    <div class="space-y-6">
        <!-- HEADER -->
        <div
            class="bg-gradient-to-r from-purple-50 to-pink-50 p-6 rounded-xl shadow-sm border border-purple-100"
        >
            <div
                class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4"
            >
                <div>
                    <h2
                        class="text-2xl font-bold text-gray-800 flex items-center gap-3"
                    >
                        <div class="bg-purple-600 p-2 rounded-lg">
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
                        Manajemen Izin
                    </h2>
                    <p class="text-sm text-gray-600 mt-2">
                        Kelola dan approve pengajuan izin dari pengajar
                    </p>
                </div>
            </div>
        </div>

        <!-- STATS CARDS -->
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
            <div
                class="bg-white p-5 rounded-xl shadow-sm border-l-4 border-blue-500 hover:shadow-md transition-shadow"
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
                class="bg-white p-5 rounded-xl shadow-sm border-l-4 border-yellow-500 hover:shadow-md transition-shadow cursor-pointer"
                @click="filterByStatus('pending')"
            >
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-sm text-gray-600 font-medium">
                            Menunggu Persetujuan
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
                class="bg-white p-5 rounded-xl shadow-sm border-l-4 border-green-500 hover:shadow-md transition-shadow cursor-pointer"
                @click="filterByStatus('approved')"
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
                class="bg-white p-5 rounded-xl shadow-sm border-l-4 border-red-500 hover:shadow-md transition-shadow cursor-pointer"
                @click="filterByStatus('rejected')"
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

        <!-- FILTERS -->
        <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
            <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
                <!-- Search -->
                <div class="md:col-span-2">
                    <label
                        class="block text-sm font-semibold text-gray-700 mb-2"
                        >Cari Pengajar</label
                    >
                    <input
                        v-model="form.search"
                        @input="applyFilters"
                        type="text"
                        placeholder="Nama pengajar..."
                        class="w-full rounded-lg border-gray-300 shadow-sm focus:border-purple-500 focus:ring-2 focus:ring-purple-200 px-4 py-2.5"
                    />
                </div>

                <!-- Status Filter -->
                <div>
                    <label
                        class="block text-sm font-semibold text-gray-700 mb-2"
                        >Status</label
                    >
                    <select
                        v-model="form.status"
                        @change="applyFilters"
                        class="w-full rounded-lg border-gray-300 shadow-sm focus:border-purple-500 focus:ring-2 focus:ring-purple-200 px-4 py-2.5"
                    >
                        <option value="">Semua Status</option>
                        <option value="pending">Menunggu</option>
                        <option value="approved">Disetujui</option>
                        <option value="rejected">Ditolak</option>
                    </select>
                </div>

                <!-- Leave Type Filter -->
                <div>
                    <label
                        class="block text-sm font-semibold text-gray-700 mb-2"
                        >Jenis Izin</label
                    >
                    <select
                        v-model="form.leave_type"
                        @change="applyFilters"
                        class="w-full rounded-lg border-gray-300 shadow-sm focus:border-purple-500 focus:ring-2 focus:ring-purple-200 px-4 py-2.5"
                    >
                        <option value="">Semua Jenis</option>
                        <option value="izin">Izin</option>
                        <option value="sakit">Sakit</option>
                        <option value="cuti">Cuti</option>
                    </select>
                </div>
            </div>

            <!-- Active Filters -->
            <div
                v-if="hasActiveFilters"
                class="flex items-center gap-2 mt-4 pt-4 border-t border-gray-200"
            >
                <span class="text-sm font-semibold text-gray-700"
                    >Filter aktif:</span
                >
                <button
                    v-if="form.search"
                    @click="clearFilter('search')"
                    class="inline-flex items-center gap-1 px-3 py-1 bg-purple-100 text-purple-700 rounded-full text-xs font-medium hover:bg-purple-200 transition-colors"
                >
                    {{ form.search }}
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
                        />
                    </svg>
                </button>
                <button
                    v-if="form.status"
                    @click="clearFilter('status')"
                    class="inline-flex items-center gap-1 px-3 py-1 bg-purple-100 text-purple-700 rounded-full text-xs font-medium hover:bg-purple-200 transition-colors"
                >
                    Status: {{ getStatusText(form.status) }}
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
                        />
                    </svg>
                </button>
                <button
                    v-if="form.leave_type"
                    @click="clearFilter('leave_type')"
                    class="inline-flex items-center gap-1 px-3 py-1 bg-purple-100 text-purple-700 rounded-full text-xs font-medium hover:bg-purple-200 transition-colors"
                >
                    {{ getLeaveTypeName(form.leave_type) }}
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
                        />
                    </svg>
                </button>
                <button
                    @click="resetFilters"
                    class="ml-auto text-sm text-purple-600 hover:text-purple-700 font-medium"
                >
                    Reset Semua
                </button>
            </div>
        </div>

        <!-- LEAVES TABLE -->
        <div
            class="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden"
        >
            <!-- Empty State -->
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
                    Tidak ada data izin
                </h3>
                <p class="text-sm text-gray-500">
                    Belum ada pengajuan izin dari pengajar
                </p>
            </div>

            <!-- Table -->
            <div v-else class="overflow-x-auto">
                <table class="min-w-full divide-y divide-gray-200">
                    <thead class="bg-gray-50">
                        <tr>
                            <th
                                class="px-6 py-4 text-left text-xs font-bold text-gray-700 uppercase tracking-wider"
                            >
                                Pengajar
                            </th>
                            <th
                                class="px-6 py-4 text-left text-xs font-bold text-gray-700 uppercase tracking-wider"
                            >
                                Tanggal
                            </th>
                            <th
                                class="px-6 py-4 text-left text-xs font-bold text-gray-700 uppercase tracking-wider"
                            >
                                Jenis
                            </th>
                            <th
                                class="px-6 py-4 text-left text-xs font-bold text-gray-700 uppercase tracking-wider"
                            >
                                Jadwal
                            </th>
                            <th
                                class="px-6 py-4 text-left text-xs font-bold text-gray-700 uppercase tracking-wider"
                            >
                                Alasan
                            </th>
                            <th
                                class="px-6 py-4 text-left text-xs font-bold text-gray-700 uppercase tracking-wider"
                            >
                                Status
                            </th>
                            <th
                                class="px-6 py-4 text-center text-xs font-bold text-gray-700 uppercase tracking-wider w-40"
                            >
                                Aksi
                            </th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                        <tr
                            v-for="leave in leaves.data"
                            :key="leave.id"
                            class="hover:bg-gray-50 transition-colors"
                        >
                            <!-- Pengajar -->
                            <td class="px-6 py-4 whitespace-nowrap">
                                <div class="flex items-center">
                                    <div
                                        class="flex-shrink-0 w-10 h-10 bg-purple-100 rounded-full flex items-center justify-center"
                                    >
                                        <span
                                            class="text-purple-600 font-bold text-sm"
                                            >{{
                                                getInitials(leave.user?.name)
                                            }}</span
                                        >
                                    </div>
                                    <div class="ml-3">
                                        <div
                                            class="text-sm font-medium text-gray-900"
                                        >
                                            {{ leave.user?.name }}
                                        </div>
                                        <div class="text-xs text-gray-500">
                                            {{ leave.user?.email }}
                                        </div>
                                    </div>
                                </div>
                            </td>

                            <!-- Tanggal -->
                            <td class="px-6 py-4 whitespace-nowrap">
                                <div class="text-sm text-gray-900 font-medium">
                                    {{ formatDate(leave.leave_date) }}
                                </div>
                                <div class="text-xs text-gray-500">
                                    {{ formatDateTime(leave.created_at) }}
                                </div>
                            </td>

                            <!-- Jenis -->
                            <td class="px-6 py-4 whitespace-nowrap">
                                <span
                                    class="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-lg text-xs font-bold"
                                    :class="getLeaveTypeClass(leave.leave_type)"
                                >
                                    <span>{{
                                        getLeaveTypeIcon(leave.leave_type)
                                    }}</span>
                                    {{ getLeaveTypeName(leave.leave_type) }}
                                </span>
                            </td>

                            <!-- Jadwal -->
                            <td class="px-6 py-4">
                                <div
                                    v-if="leave.schedule"
                                    class="text-sm text-gray-900"
                                >
                                    {{ leave.schedule.subject }}
                                    <div class="text-xs text-gray-500">
                                        {{ leave.schedule.class }}
                                    </div>
                                </div>
                                <span
                                    v-else
                                    class="text-sm text-gray-400 italic"
                                    >Tidak ada</span
                                >
                            </td>

                            <!-- Alasan -->
                            <td class="px-6 py-4">
                                <div
                                    class="text-sm text-gray-900 max-w-xs truncate"
                                    :title="leave.reason"
                                >
                                    {{ leave.reason }}
                                </div>
                                <a
                                    v-if="leave.attachment"
                                    :href="`/storage/${leave.attachment}`"
                                    target="_blank"
                                    class="inline-flex items-center gap-1 text-xs text-purple-600 hover:text-purple-700 mt-1"
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
                                            d="M15.172 7l-6.586 6.586a2 2 0 102.828 2.828l6.414-6.586a4 4 0 00-5.656-5.656l-6.415 6.585a6 6 0 108.486 8.486L20.5 13"
                                        />
                                    </svg>
                                    Lampiran
                                </a>
                            </td>

                            <!-- Status -->
                            <td class="px-6 py-4 whitespace-nowrap">
                                <span
                                    class="inline-flex items-center px-3 py-1.5 rounded-full text-xs font-bold"
                                    :class="getStatusClass(leave.status)"
                                >
                                    {{ getStatusText(leave.status) }}
                                </span>
                                <div
                                    v-if="leave.admin_note"
                                    class="text-xs text-gray-500 mt-1 max-w-xs truncate"
                                    :title="leave.admin_note"
                                >
                                    {{ leave.admin_note }}
                                </div>
                            </td>

                            <!-- Aksi -->
                            <td class="px-6 py-4 whitespace-nowrap text-center">
                                <div
                                    class="flex items-center justify-center gap-2"
                                >
                                    <button
                                        v-if="leave.status === 'pending'"
                                        @click="openApproveModal(leave)"
                                        class="p-2 text-green-600 hover:bg-green-50 rounded-lg transition-colors"
                                        title="Setujui"
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
                                                d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"
                                            />
                                        </svg>
                                    </button>
                                    <button
                                        v-if="leave.status === 'pending'"
                                        @click="openRejectModal(leave)"
                                        class="p-2 text-red-600 hover:bg-red-50 rounded-lg transition-colors"
                                        title="Tolak"
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
                                                d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z"
                                            />
                                        </svg>
                                    </button>
                                    <button
                                        @click="confirmDelete(leave)"
                                        class="p-2 text-gray-600 hover:bg-gray-100 rounded-lg transition-colors"
                                        title="Hapus"
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
                                                d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"
                                            />
                                        </svg>
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Pagination -->
            <div
                v-if="leaves.links && leaves.links.length > 3"
                class="px-6 py-4 border-t border-gray-200 bg-gray-50"
            >
                <div class="flex items-center justify-between">
                    <div class="text-sm text-gray-700">
                        Menampilkan
                        <span class="font-medium">{{ leaves.from }}</span> -
                        <span class="font-medium">{{ leaves.to }}</span> dari
                        <span class="font-medium">{{ leaves.total }}</span> data
                    </div>
                    <div class="flex gap-2">
                        <button
                            :disabled="!leaves.prev_page_url"
                            class="px-4 py-2 rounded-lg border border-gray-300 bg-white hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed text-sm font-medium text-gray-700 transition-all"
                            @click="goToPage(leaves.current_page - 1)"
                        >
                            Sebelumnya
                        </button>
                        <button
                            :disabled="!leaves.next_page_url"
                            class="px-4 py-2 rounded-lg border border-gray-300 bg-white hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed text-sm font-medium text-gray-700 transition-all"
                            @click="goToPage(leaves.current_page + 1)"
                        >
                            Selanjutnya
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- APPROVE MODAL -->
        <Transition
            enter-active-class="transition ease-out duration-200"
            enter-from-class="opacity-0"
            enter-to-class="opacity-100"
            leave-active-class="transition ease-in duration-150"
            leave-from-class="opacity-100"
            leave-to-class="opacity-0"
        >
            <div
                v-if="showApproveModal"
                class="fixed inset-0 z-50 overflow-y-auto"
                @click.self="closeApproveModal"
            >
                <div
                    class="fixed inset-0 bg-black bg-opacity-50 backdrop-blur-sm"
                ></div>
                <div class="flex min-h-screen items-center justify-center p-4">
                    <div
                        class="relative bg-white rounded-2xl shadow-2xl max-w-lg w-full p-6"
                    >
                        <div class="text-center">
                            <div
                                class="mx-auto w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mb-4"
                            >
                                <svg
                                    class="w-8 h-8 text-green-600"
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
                            <h3 class="text-lg font-bold text-gray-900 mb-2">
                                Setujui Pengajuan Izin?
                            </h3>
                            <p class="text-sm text-gray-600 mb-6">
                                Izin dari
                                <strong>{{ selectedLeave?.user?.name }}</strong>
                                akan disetujui
                            </p>
                        </div>

                        <div class="mb-6">
                            <label
                                class="block text-sm font-semibold text-gray-700 mb-2"
                                >Catatan (Opsional)</label
                            >
                            <textarea
                                v-model="approveForm.admin_note"
                                rows="3"
                                class="w-full rounded-lg border-gray-300 shadow-sm focus:border-green-500 focus:ring-2 focus:ring-green-200 px-4 py-3"
                                placeholder="Tambahkan catatan jika diperlukan..."
                            ></textarea>
                        </div>

                        <div class="flex gap-3">
                            <button
                                @click="closeApproveModal"
                                class="flex-1 px-6 py-3 bg-gray-100 hover:bg-gray-200 text-gray-700 font-semibold rounded-lg transition-colors"
                            >
                                Batal
                            </button>
                            <button
                                @click="approveLeave"
                                :disabled="isSubmitting"
                                class="flex-1 px-6 py-3 bg-green-600 hover:bg-green-700 text-white font-semibold rounded-lg shadow-md hover:shadow-lg transition-all disabled:opacity-50"
                            >
                                <span v-if="isSubmitting">Memproses...</span>
                                <span v-else>Setujui</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </Transition>

        <!-- REJECT MODAL -->
        <Transition
            enter-active-class="transition ease-out duration-200"
            enter-from-class="opacity-0"
            enter-to-class="opacity-100"
            leave-active-class="transition ease-in duration-150"
            leave-from-class="opacity-100"
            leave-to-class="opacity-0"
        >
            <div
                v-if="showRejectModal"
                class="fixed inset-0 z-50 overflow-y-auto"
                @click.self="closeRejectModal"
            >
                <div
                    class="fixed inset-0 bg-black bg-opacity-50 backdrop-blur-sm"
                ></div>
                <div class="flex min-h-screen items-center justify-center p-4">
                    <div
                        class="relative bg-white rounded-2xl shadow-2xl max-w-lg w-full p-6"
                    >
                        <div class="text-center">
                            <div
                                class="mx-auto w-16 h-16 bg-red-100 rounded-full flex items-center justify-center mb-4"
                            >
                                <svg
                                    class="w-8 h-8 text-red-600"
                                    fill="none"
                                    stroke="currentColor"
                                    viewBox="0 0 24 24"
                                >
                                    <path
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        stroke-width="2"
                                        d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z"
                                    />
                                </svg>
                            </div>
                            <h3 class="text-lg font-bold text-gray-900 mb-2">
                                Tolak Pengajuan Izin?
                            </h3>
                            <p class="text-sm text-gray-600 mb-6">
                                Izin dari
                                <strong>{{ selectedLeave?.user?.name }}</strong>
                                akan ditolak
                            </p>
                        </div>

                        <div class="mb-6">
                            <label
                                class="block text-sm font-semibold text-gray-700 mb-2"
                                >Alasan Penolakan
                                <span class="text-red-500">*</span></label
                            >
                            <textarea
                                v-model="rejectForm.admin_note"
                                rows="3"
                                required
                                class="w-full rounded-lg border-gray-300 shadow-sm focus:border-red-500 focus:ring-2 focus:ring-red-200 px-4 py-3"
                                placeholder="Jelaskan alasan penolakan..."
                            ></textarea>
                        </div>

                        <div class="flex gap-3">
                            <button
                                @click="closeRejectModal"
                                class="flex-1 px-6 py-3 bg-gray-100 hover:bg-gray-200 text-gray-700 font-semibold rounded-lg transition-colors"
                            >
                                Batal
                            </button>
                            <button
                                @click="rejectLeave"
                                :disabled="
                                    isSubmitting || !rejectForm.admin_note
                                "
                                class="flex-1 px-6 py-3 bg-red-600 hover:bg-red-700 text-white font-semibold rounded-lg shadow-md hover:shadow-lg transition-all disabled:opacity-50"
                            >
                                <span v-if="isSubmitting">Memproses...</span>
                                <span v-else>Tolak</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </Transition>

        <!-- DELETE CONFIRMATION MODAL -->
        <NewConfirmationModal :show="showDeleteModal" @close="closeDeleteModal">
            <template #title>Hapus Data Izin?</template>
            <template #content>
                <p class="text-sm text-gray-600">
                    Data izin dari
                    <strong class="text-gray-900">{{
                        selectedLeave?.user?.name
                    }}</strong>
                    akan dihapus permanen dan tidak dapat dikembalikan.
                </p>
            </template>
            <template #footer>
                <button
                    @click="closeDeleteModal"
                    class="px-6 py-2.5 bg-gray-100 hover:bg-gray-200 text-gray-700 font-semibold rounded-lg transition-colors"
                >
                    Batal
                </button>
                <button
                    @click="deleteLeave"
                    class="px-6 py-2.5 bg-red-600 hover:bg-red-700 text-white font-semibold rounded-lg shadow-md hover:shadow-lg transition-all"
                >
                    Hapus
                </button>
            </template>
        </NewConfirmationModal>
    </div>
</template>

<script setup>
import { ref, computed } from "vue";
import { router, Head } from "@inertiajs/vue3";
import AppLayout from "@/Layouts/AppLayout.vue";
import NewConfirmationModal from "@/Components/NewConfirmationModal.vue";
import axios from "axios";

defineOptions({ layout: AppLayout });

const props = defineProps({
    leaves: { type: Object, required: true },
    stats: { type: Object, required: true },
    filters: { type: Object, default: () => ({}) },
});

const form = ref({
    search: props.filters.search || "",
    status: props.filters.status || "",
    leave_type: props.filters.leave_type || "",
});

const showApproveModal = ref(false);
const showRejectModal = ref(false);
const showDeleteModal = ref(false);
const selectedLeave = ref(null);
const isSubmitting = ref(false);

const approveForm = ref({ admin_note: "" });
const rejectForm = ref({ admin_note: "" });

const hasActiveFilters = computed(() => {
    return form.value.search || form.value.status || form.value.leave_type;
});

function applyFilters() {
    router.get("/admin/leaves", form.value, {
        preserveState: true,
        replace: true,
    });
}

function filterByStatus(status) {
    form.value.status = status;
    applyFilters();
}

function clearFilter(key) {
    form.value[key] = "";
    applyFilters();
}

function resetFilters() {
    form.value = { search: "", status: "", leave_type: "" };
    applyFilters();
}

function goToPage(page) {
    router.get(
        "/admin/leaves",
        { ...form.value, page },
        {
            preserveState: true,
            replace: true,
        }
    );
}

function openApproveModal(leave) {
    selectedLeave.value = leave;
    approveForm.value.admin_note = "";
    showApproveModal.value = true;
}

function closeApproveModal() {
    showApproveModal.value = false;
    selectedLeave.value = null;
}

async function approveLeave() {
    if (!selectedLeave.value) return;

    isSubmitting.value = true;
    try {
        const csrfToken = document
            .querySelector('meta[name="csrf-token"]')
            ?.getAttribute("content");

        await axios.post(
            `/admin/leaves/${selectedLeave.value.id}/approve`,
            approveForm.value,
            {
                headers: { "X-CSRF-TOKEN": csrfToken },
            }
        );

        closeApproveModal();
        router.reload({ only: ["leaves", "stats"] });
    } catch (error) {
        console.error("Error approving leave:", error);
        alert(error.response?.data?.error || "Gagal menyetujui izin");
    } finally {
        isSubmitting.value = false;
    }
}

function openRejectModal(leave) {
    selectedLeave.value = leave;
    rejectForm.value.admin_note = "";
    showRejectModal.value = true;
}

function closeRejectModal() {
    showRejectModal.value = false;
    selectedLeave.value = null;
}

async function rejectLeave() {
    if (!selectedLeave.value || !rejectForm.value.admin_note) return;

    isSubmitting.value = true;
    try {
        const csrfToken = document
            .querySelector('meta[name="csrf-token"]')
            ?.getAttribute("content");

        await axios.post(
            `/admin/leaves/${selectedLeave.value.id}/reject`,
            rejectForm.value,
            {
                headers: { "X-CSRF-TOKEN": csrfToken },
            }
        );

        closeRejectModal();
        router.reload({ only: ["leaves", "stats"] });
    } catch (error) {
        console.error("Error rejecting leave:", error);
        alert(error.response?.data?.error || "Gagal menolak izin");
    } finally {
        isSubmitting.value = false;
    }
}

function confirmDelete(leave) {
    selectedLeave.value = leave;
    showDeleteModal.value = true;
}

function closeDeleteModal() {
    showDeleteModal.value = false;
    selectedLeave.value = null;
}

function deleteLeave() {
    if (!selectedLeave.value) return;

    router.delete(`/admin/leaves/${selectedLeave.value.id}`, {
        onSuccess: () => closeDeleteModal(),
    });
}

function getInitials(name) {
    if (!name) return "?";
    return name
        .split(" ")
        .map((n) => n[0])
        .join("")
        .toUpperCase()
        .substring(0, 2);
}

function formatDate(dateString) {
    const date = new Date(dateString);
    return date.toLocaleDateString("id-ID", {
        day: "numeric",
        month: "short",
        year: "numeric",
    });
}

function formatDateTime(dateString) {
    const date = new Date(dateString);
    return date.toLocaleDateString("id-ID", {
        day: "numeric",
        month: "short",
        year: "numeric",
        hour: "2-digit",
        minute: "2-digit",
    });
}

function getLeaveTypeName(type) {
    const types = { izin: "Izin", sakit: "Sakit", cuti: "Cuti" };
    return types[type] || type;
}

function getLeaveTypeIcon(type) {
    const icons = { izin: "📋", sakit: "🏥", cuti: "🏖️" };
    return icons[type] || "📋";
}

function getLeaveTypeClass(type) {
    const classes = {
        izin: "bg-blue-100 text-blue-800 border border-blue-200",
        sakit: "bg-red-100 text-red-800 border border-red-200",
        cuti: "bg-green-100 text-green-800 border border-green-200",
    };
    return classes[type] || "bg-gray-100 text-gray-800 border border-gray-200";
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
