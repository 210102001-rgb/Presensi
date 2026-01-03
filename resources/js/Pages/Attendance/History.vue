<template>
    <Head title="Riwayat Presensi - Absensi Pengajar" />
    <div class="space-y-6">
        <!-- HEADER -->
        <div
            class="bg-gradient-to-r from-blue-50 to-indigo-50 p-6 rounded-xl shadow-sm border border-blue-100"
        >
            <div
                class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4"
            >
                <div>
                    <h2
                        class="text-2xl font-bold text-gray-800 flex items-center gap-3"
                    >
                        <div class="bg-blue-600 p-2 rounded-lg">
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
                                    d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"
                                />
                            </svg>
                        </div>
                        Riwayat Presensi
                    </h2>
                    <p class="text-sm text-gray-600 mt-2">
                        Lihat dan kelola riwayat kehadiran Anda dengan mudah
                    </p>
                </div>
                <Link
                    href="/attendance"
                    class="inline-flex items-center gap-2 bg-blue-600 text-white px-5 py-2.5 rounded-lg text-sm font-medium shadow-md hover:bg-blue-700 hover:shadow-lg transition-all duration-200"
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
                            d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"
                        />
                    </svg>
                    Presensi Hari Ini
                </Link>
            </div>
        </div>

        <!-- FILTERS -->
        <div
            class="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden"
        >
            <div
                class="bg-gradient-to-r from-blue-50 to-indigo-50 px-6 py-4 border-b border-blue-100"
            >
                <div class="flex items-center gap-3">
                    <div class="bg-blue-600 p-2.5 rounded-lg shadow-sm">
                        <svg
                            class="w-5 h-5 text-white"
                            fill="none"
                            stroke="currentColor"
                            viewBox="0 0 24 24"
                        >
                            <path
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                stroke-width="2"
                                d="M3 4a1 1 0 011-1h16a1 1 0 011 1v2.586a1 1 0 01-.293.707l-6.414 6.414a1 1 0 00-.293.707V17l-4 4v-6.586a1 1 0 00-.293-.707L3.293 7.293A1 1 0 013 6.586V4z"
                            />
                        </svg>
                    </div>
                    <div>
                        <h3 class="text-lg font-semibold text-gray-900">
                            Filter & Pencarian
                        </h3>
                        <p class="text-xs text-gray-600 mt-0.5">
                            Cari riwayat presensi berdasarkan periode dan status
                        </p>
                    </div>
                </div>
            </div>

            <form @submit.prevent="applyFilters" class="p-6">
                <div
                    class="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-4 gap-5"
                >
                    <!-- Bulan Filter -->
                    <div class="space-y-2">
                        <label
                            class="flex items-center gap-2 text-sm font-semibold text-gray-700"
                        >
                            <svg
                                class="w-4 h-4 text-blue-600"
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
                            Bulan
                        </label>
                        <div class="relative">
                            <select
                                v-model.number="filters.month"
                                class="w-full rounded-lg border-gray-300 shadow-sm focus:border-blue-500 focus:ring-2 focus:ring-blue-200 text-sm pl-4 pr-10 py-3 appearance-none bg-white transition-all hover:border-blue-400"
                            >
                                <option value="">Semua Bulan</option>
                                <option
                                    v-for="(b, i) in months"
                                    :key="i"
                                    :value="i + 1"
                                >
                                    {{ b }}
                                </option>
                            </select>
                            <div
                                class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-3 text-gray-500"
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
                                        d="M19 9l-7 7-7-7"
                                    />
                                </svg>
                            </div>
                        </div>
                    </div>

                    <!-- Tahun Filter -->
                    <div class="space-y-2">
                        <label
                            class="flex items-center gap-2 text-sm font-semibold text-gray-700"
                        >
                            <svg
                                class="w-4 h-4 text-blue-600"
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
                            Tahun
                        </label>
                        <input
                            v-model.number="filters.year"
                            type="number"
                            min="2020"
                            max="2030"
                            class="w-full rounded-lg border-gray-300 shadow-sm focus:border-blue-500 focus:ring-2 focus:ring-blue-200 text-sm px-4 py-3 transition-all hover:border-blue-400"
                            placeholder="Pilih tahun (2025)"
                        />
                    </div>

                    <!-- Status Filter -->
                    <div class="space-y-2">
                        <label
                            class="flex items-center gap-2 text-sm font-semibold text-gray-700"
                        >
                            <svg
                                class="w-4 h-4 text-blue-600"
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
                            Status Kehadiran
                        </label>
                        <div class="relative">
                            <select
                                v-model="filters.status"
                                class="w-full rounded-lg border-gray-300 shadow-sm focus:border-blue-500 focus:ring-2 focus:ring-blue-200 text-sm pl-4 pr-10 py-3 appearance-none bg-white transition-all hover:border-blue-400"
                            >
                                <option value="">Semua Status</option>
                                <option value="hadir">✅ Hadir</option>
                                <option value="terlambat">⏰ Terlambat</option>
                                <option value="izin">📄 Izin</option>
                                <option value="alpha">❌ Alpha</option>
                            </select>
                            <div
                                class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-3 text-gray-500"
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
                                        d="M19 9l-7 7-7-7"
                                    />
                                </svg>
                            </div>
                        </div>
                    </div>

                    <!-- Action Buttons -->
                    <div class="space-y-2">
                        <label
                            class="block text-sm font-semibold text-gray-700 opacity-0 pointer-events-none"
                        >
                            Action
                        </label>
                        <div class="flex gap-2">
                            <button
                                type="submit"
                                class="flex-1 bg-gradient-to-r from-blue-600 to-blue-700 hover:from-blue-700 hover:to-blue-800 text-white font-semibold rounded-lg px-4 py-3 text-sm shadow-md hover:shadow-lg transition-all duration-200 flex items-center justify-center gap-2"
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
                                        d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
                                    />
                                </svg>
                                Cari
                            </button>
                            <button
                                type="button"
                                @click="resetFilters"
                                class="px-4 py-3 bg-gray-100 hover:bg-gray-200 text-gray-700 font-medium rounded-lg text-sm transition-all duration-200 flex items-center justify-center"
                                title="Reset Filter"
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
                                        d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"
                                    />
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Active Filters Display -->
                <div
                    v-if="hasActiveFilters"
                    class="mt-4 pt-4 border-t border-gray-200"
                >
                    <div class="flex flex-wrap items-center gap-2">
                        <span class="text-xs font-medium text-gray-600"
                            >Filter aktif:</span
                        >
                        <span
                            v-if="filters.month"
                            class="inline-flex items-center gap-1 px-2.5 py-1 bg-blue-100 text-blue-800 text-xs font-medium rounded-full"
                        >
                            {{ months[filters.month - 1] }}
                            <button
                                @click="filters.month = ''"
                                class="hover:text-blue-900"
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
                                    />
                                </svg>
                            </button>
                        </span>
                        <span
                            v-if="filters.year"
                            class="inline-flex items-center gap-1 px-2.5 py-1 bg-blue-100 text-blue-800 text-xs font-medium rounded-full"
                        >
                            {{ filters.year }}
                            <button
                                @click="filters.year = ''"
                                class="hover:text-blue-900"
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
                                    />
                                </svg>
                            </button>
                        </span>
                        <span
                            v-if="filters.status"
                            class="inline-flex items-center gap-1 px-2.5 py-1 bg-blue-100 text-blue-800 text-xs font-medium rounded-full"
                        >
                            {{ getStatusText(filters.status) }}
                            <button
                                @click="filters.status = ''"
                                class="hover:text-blue-900"
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
                                    />
                                </svg>
                            </button>
                        </span>
                    </div>
                </div>
            </form>
        </div>

        <!-- DATA PRESENSI -->
        <div class="bg-white p-6 rounded-xl shadow-sm border border-gray-200">
            <div class="flex items-center justify-between mb-6">
                <div class="flex items-center gap-3">
                    <div class="bg-green-100 p-2 rounded-lg">
                        <svg
                            class="w-5 h-5 text-green-600"
                            fill="none"
                            stroke="currentColor"
                            viewBox="0 0 24 24"
                        >
                            <path
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                stroke-width="2"
                                d="M9 5H7a2 2 0 00-2 2v10a2 2 0 002 2h8a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-6 9l2 2 4-4"
                            />
                        </svg>
                    </div>
                    <h3 class="text-lg font-semibold text-gray-800">
                        Data Presensi
                    </h3>
                </div>
                <span
                    class="text-sm font-medium text-gray-600 bg-gray-100 px-3 py-1.5 rounded-full"
                >
                    Total: {{ attendances.total || 0 }} data
                </span>
            </div>

            <!-- EMPTY STATE -->
            <div v-if="attendances.data.length === 0" class="text-center py-16">
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
                            d="M9 5H7a2 2 0 00-2 2v10a2 2 0 002 2h8a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"
                        />
                    </svg>
                </div>
                <h3 class="text-lg font-semibold text-gray-900 mb-2">
                    Tidak ada data ditemukan
                </h3>
                <p class="text-sm text-gray-500">
                    Coba ubah filter atau pilih periode yang berbeda.
                </p>
            </div>

            <!-- ATTENDANCE LIST -->
            <div v-else class="space-y-4">
                <div
                    v-for="item in attendances.data"
                    :key="item.id"
                    class="border border-gray-200 rounded-xl p-5 hover:shadow-lg hover:border-blue-200 transition-all duration-200 bg-white"
                >
                    <!-- HEADER INFO -->
                    <div
                        class="flex flex-col sm:flex-row sm:justify-between sm:items-start gap-4 mb-4"
                    >
                        <div class="flex-1">
                            <div class="flex items-center gap-2 mb-2">
                                <h4
                                    class="text-base font-semibold text-gray-900"
                                >
                                    {{ formatDate(item.date) }}
                                </h4>
                                <span
                                    :class="getStatusClass(item.status)"
                                    class="px-3 py-1 text-xs rounded-full font-semibold"
                                >
                                    {{ getStatusText(item.status) }}
                                </span>
                                <span
                                    v-if="item.approval_status"
                                    :class="
                                        getApprovalClass(item.approval_status)
                                    "
                                    class="px-3 py-1 text-xs rounded-full font-semibold"
                                >
                                    {{ getApprovalText(item.approval_status) }}
                                </span>
                            </div>

                            <div class="space-y-1.5">
                                <p class="text-sm text-gray-700 font-medium">
                                    {{
                                        item.schedule?.subject ||
                                        "Mata Pelajaran"
                                    }}
                                </p>
                                <p class="text-sm text-gray-600">
                                    Kelas: {{ item.schedule?.class || "-" }}
                                </p>
                                <p
                                    class="text-sm text-gray-600 flex items-center gap-1.5"
                                >
                                    <svg
                                        class="w-4 h-4 text-gray-400"
                                        fill="none"
                                        stroke="currentColor"
                                        viewBox="0 0 24 24"
                                    >
                                        <path
                                            stroke-linecap="round"
                                            stroke-linejoin="round"
                                            stroke-width="2"
                                            d="M17.657 16.657L13.414 20.9a2 2 0 01-2.828 0l-4.243-4.243a8 8 0 1111.314 0z"
                                        />
                                        <path
                                            stroke-linecap="round"
                                            stroke-linejoin="round"
                                            stroke-width="2"
                                            d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"
                                        />
                                    </svg>
                                    {{
                                        item.schedule?.location?.name ||
                                        "Lokasi tidak tersedia"
                                    }}
                                </p>
                            </div>
                        </div>

                        <!-- TIME INFO -->
                        <div class="flex flex-col gap-2 text-sm">
                            <div
                                v-if="item.check_in_time"
                                class="flex items-center gap-2 bg-green-50 px-3 py-2 rounded-lg"
                            >
                                <svg
                                    class="w-4 h-4 text-green-600"
                                    fill="none"
                                    stroke="currentColor"
                                    viewBox="0 0 24 24"
                                >
                                    <path
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        stroke-width="2"
                                        d="M11 16l-4-4m0 0l4-4m-4 4h14m-5 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h7a3 3 0 013 3v1"
                                    />
                                </svg>
                                <span class="text-green-800">
                                    <span class="font-medium">Masuk:</span>
                                    {{ item.check_in_time }}
                                </span>
                            </div>
                            <div
                                v-if="item.check_out_time"
                                class="flex items-center gap-2 bg-blue-50 px-3 py-2 rounded-lg"
                            >
                                <svg
                                    class="w-4 h-4 text-blue-600"
                                    fill="none"
                                    stroke="currentColor"
                                    viewBox="0 0 24 24"
                                >
                                    <path
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        stroke-width="2"
                                        d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"
                                    />
                                </svg>
                                <span class="text-blue-800">
                                    <span class="font-medium">Pulang:</span>
                                    {{ item.check_out_time }}
                                </span>
                            </div>
                            <div
                                v-if="
                                    item.status === 'izin' &&
                                    item.notes &&
                                    item.notes.startsWith('Izin disetujui:')
                                "
                                class="flex items-center gap-2 bg-yellow-50 px-3 py-2 rounded-lg"
                            >
                                <svg
                                    class="w-4 h-4 text-yellow-600"
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
                                <span class="text-yellow-800">
                                    <span class="font-medium">Alasan:</span>
                                    {{
                                        item.notes.replace(
                                            "Izin disetujui: ",
                                            ""
                                        )
                                    }}
                                </span>
                            </div>
                            <div
                                v-if="item.approval_note"
                                class="flex items-center gap-2 px-3 py-2 rounded-lg"
                                :class="{
                                    'bg-green-50':
                                        item.approval_status === 'approved',
                                    'bg-red-50':
                                        item.approval_status === 'rejected',
                                    'bg-gray-50':
                                        item.approval_status === 'pending',
                                }"
                            >
                                <svg
                                    class="w-4 h-4"
                                    :class="{
                                        'text-green-600':
                                            item.approval_status === 'approved',
                                        'text-red-600':
                                            item.approval_status === 'rejected',
                                        'text-gray-600':
                                            item.approval_status === 'pending',
                                    }"
                                    fill="none"
                                    stroke="currentColor"
                                    viewBox="0 0 24 24"
                                >
                                    <path
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        stroke-width="2"
                                        d="M7 8h10M7 12h4m1 8l-4-4H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-3l-4 4z"
                                    />
                                </svg>
                                <span
                                    :class="{
                                        'text-green-800':
                                            item.approval_status === 'approved',
                                        'text-red-800':
                                            item.approval_status === 'rejected',
                                        'text-gray-800':
                                            item.approval_status === 'pending',
                                    }"
                                >
                                    <span class="font-medium"
                                        >Catatan Admin:</span
                                    >
                                    {{ item.approval_note }}
                                </span>
                            </div>
                        </div>
                    </div>

                    <!-- PHOTOS SECTION -->
                    <div
                        v-if="item.check_in_selfie || item.check_out_selfie"
                        class="border-t border-gray-200 pt-4"
                    >
                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                            <!-- Check In Photo -->
                            <div
                                v-if="item.check_in_selfie"
                                class="group relative bg-gradient-to-br from-green-50 to-emerald-50 rounded-xl p-4 border border-green-200 hover:shadow-md transition-all duration-200 cursor-pointer"
                                @click="
                                    showImageModal(
                                        `/storage/${item.check_in_selfie}`,
                                        'Foto Masuk',
                                        item.check_in_time
                                    )
                                "
                            >
                                <div class="flex items-center gap-2 mb-3">
                                    <div class="bg-green-600 p-1.5 rounded-lg">
                                        <svg
                                            class="w-4 h-4 text-white"
                                            fill="none"
                                            stroke="currentColor"
                                            viewBox="0 0 24 24"
                                        >
                                            <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="2"
                                                d="M3 9a2 2 0 012-2h.93a2 2 0 001.664-.89l.812-1.22A2 2 0 0110.07 4h3.86a2 2 0 011.664.89l.812 1.22A2 2 0 0018.07 7H19a2 2 0 012 2v9a2 2 0 01-2 2H5a2 2 0 01-2-2V9z"
                                            />
                                            <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="2"
                                                d="M15 13a3 3 0 11-6 0 3 3 0 016 0z"
                                            />
                                        </svg>
                                    </div>
                                    <span
                                        class="text-sm font-semibold text-green-800"
                                        >Foto Masuk</span
                                    >
                                </div>

                                <div
                                    class="relative aspect-[3/4] w-full overflow-hidden rounded-lg bg-white shadow-sm"
                                >
                                    <img
                                        :src="`/storage/${item.check_in_selfie}`"
                                        alt="Foto Masuk"
                                        class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
                                        loading="lazy"
                                    />
                                    <div
                                        class="absolute inset-0 bg-black/0 group-hover:bg-black/10 transition-colors duration-200 flex items-center justify-center"
                                    >
                                        <div
                                            class="bg-white/90 rounded-full p-2 opacity-0 group-hover:opacity-100 transition-opacity duration-200"
                                        >
                                            <svg
                                                class="w-6 h-6 text-gray-800"
                                                fill="none"
                                                stroke="currentColor"
                                                viewBox="0 0 24 24"
                                            >
                                                <path
                                                    stroke-linecap="round"
                                                    stroke-linejoin="round"
                                                    stroke-width="2"
                                                    d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0zM10 7v3m0 0v3m0-3h3m-3 0H7"
                                                />
                                            </svg>
                                        </div>
                                    </div>
                                </div>

                                <p
                                    class="text-xs text-green-700 text-center mt-2 font-medium"
                                >
                                    Klik untuk memperbesar
                                </p>
                            </div>

                            <!-- Check Out Photo -->
                            <div
                                v-if="item.check_out_selfie"
                                class="group relative bg-gradient-to-br from-blue-50 to-indigo-50 rounded-xl p-4 border border-blue-200 hover:shadow-md transition-all duration-200 cursor-pointer"
                                @click="
                                    showImageModal(
                                        `/storage/${item.check_out_selfie}`,
                                        'Foto Pulang',
                                        item.check_out_time
                                    )
                                "
                            >
                                <div class="flex items-center gap-2 mb-3">
                                    <div class="bg-blue-600 p-1.5 rounded-lg">
                                        <svg
                                            class="w-4 h-4 text-white"
                                            fill="none"
                                            stroke="currentColor"
                                            viewBox="0 0 24 24"
                                        >
                                            <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="2"
                                                d="M3 9a2 2 0 012-2h.93a2 2 0 001.664-.89l.812-1.22A2 2 0 0110.07 4h3.86a2 2 0 011.664.89l.812 1.22A2 2 0 0018.07 7H19a2 2 0 012 2v9a2 2 0 01-2 2H5a2 2 0 01-2-2V9z"
                                            />
                                            <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="2"
                                                d="M15 13a3 3 0 11-6 0 3 3 0 016 0z"
                                            />
                                        </svg>
                                    </div>
                                    <span
                                        class="text-sm font-semibold text-blue-800"
                                        >Foto Pulang</span
                                    >
                                </div>

                                <div
                                    class="relative aspect-[3/4] w-full overflow-hidden rounded-lg bg-white shadow-sm"
                                >
                                    <img
                                        :src="`/storage/${item.check_out_selfie}`"
                                        alt="Foto Pulang"
                                        class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
                                        loading="lazy"
                                    />
                                    <div
                                        class="absolute inset-0 bg-black/0 group-hover:bg-black/10 transition-colors duration-200 flex items-center justify-center"
                                    >
                                        <div
                                            class="bg-white/90 rounded-full p-2 opacity-0 group-hover:opacity-100 transition-opacity duration-200"
                                        >
                                            <svg
                                                class="w-6 h-6 text-gray-800"
                                                fill="none"
                                                stroke="currentColor"
                                                viewBox="0 0 24 24"
                                            >
                                                <path
                                                    stroke-linecap="round"
                                                    stroke-linejoin="round"
                                                    stroke-width="2"
                                                    d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0zM10 7v3m0 0v3m0-3h3m-3 0H7"
                                                />
                                            </svg>
                                        </div>
                                    </div>
                                </div>

                                <p
                                    class="text-xs text-blue-700 text-center mt-2 font-medium"
                                >
                                    Klik untuk memperbesar
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- PAGINATION -->
            <div
                v-if="attendances.links && attendances.links.length > 3"
                class="pt-6 mt-6 border-t border-gray-200"
            >
                <div class="flex justify-center items-center gap-3">
                    <button
                        :disabled="!attendances.prev_page_url"
                        class="px-4 py-2 rounded-lg border border-gray-300 bg-white hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed text-sm font-medium text-gray-700 transition-all"
                        @click="go(attendances.current_page - 1)"
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
                        {{ attendances.current_page }} /
                        {{ attendances.last_page }}
                    </span>

                    <button
                        :disabled="!attendances.next_page_url"
                        class="px-4 py-2 rounded-lg border border-gray-300 bg-white hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed text-sm font-medium text-gray-700 transition-all"
                        @click="go(attendances.current_page + 1)"
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

    <!-- MODAL FOTO -->
    <Transition
        enter-active-class="transition ease-out duration-200"
        enter-from-class="opacity-0"
        enter-to-class="opacity-100"
        leave-active-class="transition ease-in duration-150"
        leave-from-class="opacity-100"
        leave-to-class="opacity-0"
    >
        <div
            v-if="isImageModalVisible"
            class="fixed inset-0 z-50 flex items-center justify-center bg-black/90 p-4 backdrop-blur-sm"
            @click="closeImageModal"
        >
            <div
                class="relative bg-white rounded-2xl shadow-2xl max-w-4xl w-full overflow-hidden"
                @click.stop
            >
                <!-- Modal Header -->
                <div
                    class="bg-gradient-to-r from-blue-600 to-indigo-600 px-6 py-4 flex items-center justify-between"
                >
                    <div>
                        <h3 class="text-lg font-semibold text-white">
                            {{ modalImageTitle }}
                        </h3>
                        <p
                            v-if="modalImageTime"
                            class="text-sm text-blue-100 mt-0.5"
                        >
                            Waktu: {{ modalImageTime }}
                        </p>
                    </div>
                    <button
                        @click="closeImageModal"
                        class="text-white hover:bg-white/20 rounded-lg p-2 transition-colors"
                    >
                        <svg
                            class="w-6 h-6"
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
                </div>

                <!-- Modal Body -->
                <div class="p-6 bg-gray-50">
                    <div class="bg-white rounded-xl p-4 shadow-inner">
                        <img
                            :src="modalImageUrl"
                            :alt="modalImageTitle"
                            class="max-h-[70vh] w-auto mx-auto rounded-lg object-contain"
                        />
                    </div>
                </div>
            </div>
        </div>
    </Transition>
</template>

<script setup>
import { ref, computed } from "vue";
import { router, Link, Head } from "@inertiajs/vue3";
import AppLayout from "@/Layouts/AppLayout.vue";

defineOptions({ layout: AppLayout });

const props = defineProps({
    attendances: { type: Object, required: true },
    filters: { type: Object, required: true },
});

const months = [
    "Januari",
    "Februari",
    "Maret",
    "April",
    "Mei",
    "Juni",
    "Juli",
    "Agustus",
    "September",
    "Oktober",
    "November",
    "Desember",
];

const isImageModalVisible = ref(false);
const modalImageUrl = ref("");
const modalImageTitle = ref("");
const modalImageTime = ref("");

const hasActiveFilters = computed(() => {
    return props.filters.month || props.filters.year || props.filters.status;
});

function applyFilters() {
    router.get("/attendance/history", props.filters, {
        preserveState: true,
        replace: true,
    });
}

function resetFilters() {
    props.filters.month = "";
    props.filters.year = "";
    props.filters.status = "";
    applyFilters();
}

function go(page) {
    const params = { ...props.filters, page };
    router.get("/attendance/history", params, {
        preserveState: true,
        replace: true,
    });
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

function getStatusClass(status) {
    const classes = {
        hadir: "bg-green-100 text-green-800 border border-green-200",
        terlambat: "bg-yellow-100 text-yellow-800 border border-yellow-200",
        izin: "bg-yellow-100 text-yellow-800 border border-yellow-200",
        alpha: "bg-red-100 text-red-800 border border-red-200",
    };
    return (
        classes[status] || "bg-gray-100 text-gray-800 border border-gray-200"
    );
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

function getApprovalClass(approvalStatus) {
    const classes = {
        pending: "bg-yellow-100 text-yellow-800 border border-yellow-200",
        approved: "bg-green-100 text-green-800 border border-green-200",
        rejected: "bg-red-100 text-red-800 border border-red-200",
    };
    return (
        classes[approvalStatus] ||
        "bg-gray-100 text-gray-800 border border-gray-200"
    );
}

function getApprovalText(approvalStatus) {
    const texts = {
        pending: "⏳ Menunggu Persetujuan",
        approved: "✅ Disetujui",
        rejected: "❌ Ditolak",
    };
    return texts[approvalStatus] || approvalStatus;
}

function showImageModal(url, title, time = "") {
    modalImageUrl.value = url;
    modalImageTitle.value = title;
    modalImageTime.value = time;
    isImageModalVisible.value = true;
    document.body.style.overflow = "hidden";
}

function closeImageModal() {
    isImageModalVisible.value = false;
    modalImageUrl.value = "";
    modalImageTitle.value = "";
    modalImageTime.value = "";
    document.body.style.overflow = "auto";
}
</script>
