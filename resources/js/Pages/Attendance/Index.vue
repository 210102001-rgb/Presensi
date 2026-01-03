<template>
    <Head title="Presensi Hari Ini - Absensi Pengajar" />
    <div class="space-y-8">
        <!-- Header -->
        <div class="md:flex md:items-center md:justify-between">
            <div class="min-w-0 flex-1">
                <h2
                    class="text-xl sm:text-2xl font-bold leading-7 text-gray-900 sm:truncate sm:text-3xl sm:tracking-tight"
                >
                    Presensi Hari Ini
                </h2>
                <p class="mt-1 text-sm text-gray-500">
                    Lakukan check-in dan check-out untuk jadwal mengajar Anda
                    hari ini.
                </p>
            </div>
            <div class="mt-4 flex md:ml-4 md:mt-0 gap-2">
                <button
                    @click="showLeaveModal = true"
                    class="inline-flex items-center rounded-md bg-yellow-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-yellow-500"
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
                            d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"
                        ></path>
                    </svg>
                    <span class="hidden sm:inline">Ajukan Izin</span>
                    <span class="sm:hidden">Izin</span>
                </button>
                <Link
                    href="/attendance/leaves"
                    class="inline-flex items-center rounded-md bg-white px-3 py-2 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50"
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
                            d="M9 5H7a2 2 0 00-2 2v10a2 2 0 002 2h8a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"
                        ></path>
                    </svg>
                    <span class="hidden sm:inline">Riwayat Izin</span>
                    <span class="sm:hidden">Izin</span>
                </Link>
                <Link
                    href="/attendance/history"
                    class="inline-flex items-center rounded-md bg-white px-3 py-2 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50"
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
                            d="M9 5H7a2 2 0 00-2 2v10a2 2 0 002 2h8a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"
                        ></path>
                    </svg>
                    <span class="hidden sm:inline">Riwayat Presensi</span>
                    <span class="sm:hidden">Presensi</span>
                </Link>
            </div>
        </div>

        <!-- Schedules List -->
        <div v-if="schedules.length === 0" class="text-center py-12">
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

        <div v-else class="space-y-6">
            <div
                v-for="schedule in schedules"
                :key="schedule.id"
                class="bg-white shadow rounded-lg border border-gray-200"
            >
                <div class="px-6 py-4">
                    <div class="flex items-center justify-between">
                        <div class="flex-1">
                            <div class="flex items-center">
                                <h3 class="text-lg font-medium text-gray-900">
                                    {{ schedule.subject || "Mata Pelajaran" }}
                                </h3>
                                <span
                                    class="ml-3 inline-flex items-center rounded-full bg-blue-100 px-2.5 py-0.5 text-xs font-medium text-blue-800"
                                >
                                    {{ schedule.class || "Kelas" }}
                                </span>
                            </div>
                            <div
                                class="mt-2 flex items-center text-sm text-gray-500"
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

                        <div
                            class="ml-4 sm:ml-6 flex flex-col sm:flex-row items-stretch sm:items-center space-y-2 sm:space-y-0 sm:space-x-3"
                        >
                            <!-- Display status if it's leave or absence -->
                            <div v-if="isLeave(schedule)" class="flex items-center">
                                <span class="inline-flex items-center px-3 py-2 rounded-md bg-yellow-100 text-yellow-800 text-sm font-medium">
                                    <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                                    </svg>
                                    Izin Disetujui
                                </span>
                            </div>
                            
                            <div v-else-if="isAbsent(schedule)" class="flex items-center">
                                <span class="inline-flex items-center px-3 py-2 rounded-md bg-red-100 text-red-800 text-sm font-medium">
                                    <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                                    </svg>
                                    Tidak Hadir
                                </span>
                            </div>
                            
                            <div v-else>
                                <button
                                    class="inline-flex items-center justify-center rounded-md bg-green-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-green-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-green-600 disabled:opacity-50 disabled:cursor-not-allowed"
                                    :disabled="
                                        isCheckedIn(schedule) ||
                                        loadingStates[`checkin-${schedule.id}`]
                                    "
                                    @click="onCheckIn(schedule)"
                                >
                                    <svg
                                        v-if="
                                            loadingStates[`checkin-${schedule.id}`]
                                        "
                                        class="animate-spin -ml-1 mr-2 h-4 w-4 text-white"
                                        fill="none"
                                        viewBox="0 0 24 24"
                                    >
                                        <circle
                                            class="opacity-25"
                                            cx="12"
                                            cy="12"
                                            r="10"
                                            stroke="currentColor"
                                            stroke-width="4"
                                        ></circle>
                                        <path
                                            class="opacity-75"
                                            fill="currentColor"
                                            d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"
                                        ></path>
                                    </svg>
                                    <svg
                                        v-else
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
                                    <span class="hidden sm:inline">{{
                                        isCheckedIn(schedule)
                                            ? "Sudah Check-in"
                                            : "Check-in"
                                    }}</span>
                                    <span class="sm:hidden">{{
                                        isCheckedIn(schedule)
                                            ? "Sudah Masuk"
                                            : "Masuk"
                                    }}</span>
                                </button>

                                <button
                                    class="inline-flex items-center justify-center rounded-md bg-blue-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-blue-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-blue-600 disabled:opacity-50 disabled:cursor-not-allowed"
                                    :disabled="
                                        !isCheckedIn(schedule) ||
                                        isCheckedOut(schedule) ||
                                        loadingStates[`checkout-${schedule.id}`]
                                    "
                                    @click="onCheckOut(schedule)"
                                >
                                    <svg
                                        v-if="
                                            loadingStates[`checkout-${schedule.id}`]
                                        "
                                        class="animate-spin -ml-1 mr-2 h-4 w-4 text-white"
                                        fill="none"
                                        viewBox="0 0 24 24"
                                    >
                                        <circle
                                            class="opacity-25"
                                            cx="12"
                                            cy="12"
                                            r="10"
                                            stroke="currentColor"
                                            stroke-width="4"
                                        ></circle>
                                        <path
                                            class="opacity-75"
                                            fill="currentColor"
                                            d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"
                                        ></path>
                                    </svg>
                                    <svg
                                        v-else
                                        class="w-4 h-4 mr-2"
                                        fill="none"
                                        stroke="currentColor"
                                        viewBox="0 0 24 24"
                                    >
                                        <path
                                            stroke-linecap="round"
                                            stroke-linejoin="round"
                                            stroke-width="2"
                                            d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"
                                        ></path>
                                    </svg>
                                    <span class="hidden sm:inline">{{
                                        isCheckedOut(schedule)
                                            ? "Sudah Check-out"
                                            : "Check-out"
                                    }}</span>
                                    <span class="sm:hidden">{{
                                        isCheckedOut(schedule)
                                            ? "Sudah Pulang"
                                            : "Pulang"
                                    }}</span>
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Attendance Status -->
                    <div
                        v-if="isCheckedIn(schedule) || isCheckedOut(schedule) || isLeave(schedule) || isAbsent(schedule)"
                        class="mt-4 pt-4 border-t border-gray-200"
                    >
                        <div class="flex items-center text-sm text-gray-600">
                            <svg
                                class="mr-2 h-4 w-4"
                                fill="none"
                                stroke="currentColor"
                                viewBox="0 0 24 24"
                            >
                                <path
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    stroke-width="2"
                                    d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"
                                ></path>
                            </svg>
                            <span v-if="isLeave(schedule)" class="mr-4">
                                <strong>Status:</strong> Izin Disetujui
                            </span>
                            <span v-else-if="isAbsent(schedule)" class="mr-4">
                                <strong>Status:</strong> Tidak Hadir
                            </span>
                            <span v-else-if="isCheckedIn(schedule)" class="mr-4">
                                <strong>Masuk:</strong>
                                {{ getAttendance(schedule)?.check_in_time }}
                            </span>
                            <span v-if="isCheckedOut(schedule)">
                                <strong>Pulang:</strong>
                                {{ getAttendance(schedule)?.check_out_time }}
                            </span>
                        </div>
                        <div v-if="getAttendance(schedule)?.notes" class="mt-2 text-sm text-gray-500">
                            <strong>Catatan:</strong> {{ getAttendance(schedule)?.notes }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Leave Modal - MODERN VERSION -->
    <Transition
        enter-active-class="transition ease-out duration-300"
        enter-from-class="opacity-0"
        enter-to-class="opacity-100"
        leave-active-class="transition ease-in duration-200"
        leave-from-class="opacity-100"
        leave-to-class="opacity-0"
    >
        <div
            v-if="showLeaveModal"
            class="fixed inset-0 z-50 overflow-y-auto"
            @click.self="closeLeaveModal"
        >
            <!-- Backdrop with blur -->
            <div
                class="fixed inset-0 bg-gradient-to-br from-gray-900/80 via-blue-900/80 to-purple-900/80 backdrop-blur-sm"
            ></div>

            <!-- Modal Container -->
            <div class="flex min-h-screen items-center justify-center p-4">
                <Transition
                    enter-active-class="transition ease-out duration-300 delay-100"
                    enter-from-class="opacity-0 scale-95 translate-y-4"
                    enter-to-class="opacity-100 scale-100 translate-y-0"
                    leave-active-class="transition ease-in duration-200"
                    leave-from-class="opacity-100 scale-100 translate-y-0"
                    leave-to-class="opacity-0 scale-95 translate-y-4"
                >
                    <div
                        v-if="showLeaveModal"
                        class="relative bg-white rounded-2xl shadow-2xl max-w-2xl w-full max-h-[90vh] overflow-hidden"
                        @click.stop
                    >
                        <!-- Decorative Background Pattern -->
                        <div
                            class="absolute top-0 left-0 w-full h-48 bg-gradient-to-br from-yellow-400 via-orange-400 to-red-500 opacity-10"
                        >
                            <div
                                class="absolute inset-0"
                                style="
                                    background-image: radial-gradient(
                                        circle at 20% 50%,
                                        rgba(255, 255, 255, 0.2) 1px,
                                        transparent 1px
                                    );
                                    background-size: 30px 30px;
                                "
                            ></div>
                        </div>

                        <!-- Header -->
                        <div
                            class="relative bg-gradient-to-r from-yellow-500 via-orange-500 to-red-500 px-8 py-6"
                        >
                            <div class="flex items-start justify-between">
                                <div class="flex items-center gap-4">
                                    <div
                                        class="bg-white/20 backdrop-blur-sm p-3 rounded-2xl shadow-lg ring-2 ring-white/30"
                                    >
                                        <svg
                                            class="w-8 h-8 text-white drop-shadow-md"
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
                                    <div>
                                        <h3
                                            class="text-2xl font-bold text-white drop-shadow-md"
                                        >
                                            Pengajuan Izin
                                        </h3>
                                        <p
                                            class="text-sm text-white/90 mt-1 font-medium"
                                        >
                                            Lengkapi formulir di bawah ini
                                            dengan teliti
                                        </p>
                                    </div>
                                </div>
                                <button
                                    @click="closeLeaveModal"
                                    class="text-white/80 hover:text-white hover:bg-white/20 rounded-xl p-2.5 transition-all duration-200 hover:scale-110 hover:rotate-90"
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
                                            stroke-width="2.5"
                                            d="M6 18L18 6M6 6l12 12"
                                        ></path>
                                    </svg>
                                </button>
                            </div>
                        </div>

                        <!-- Form Content -->
                        <form
                            @submit.prevent="submitLeave"
                            class="relative overflow-y-auto max-h-[calc(90vh-180px)]"
                        >
                            <div class="p-8 space-y-6">
                                <!-- Date & Type Row -->
                                <div
                                    class="grid grid-cols-1 md:grid-cols-2 gap-6"
                                >
                                    <!-- Leave Date -->
                                    <div class="group">
                                        <label
                                            class="flex items-center gap-2 text-sm font-bold text-gray-700 mb-3"
                                        >
                                            <div
                                                class="bg-gradient-to-br from-yellow-400 to-orange-500 p-1.5 rounded-lg shadow-sm"
                                            >
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
                                                        d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"
                                                    />
                                                </svg>
                                            </div>
                                            Tanggal Izin
                                            <span class="text-red-500">*</span>
                                        </label>
                                        <div class="relative">
                                            <input
                                                v-model="leaveForm.leave_date"
                                                type="date"
                                                required
                                                class="w-full rounded-xl border-2 border-gray-200 shadow-sm focus:border-orange-400 focus:ring-4 focus:ring-orange-100 px-4 py-3.5 transition-all duration-200 hover:border-gray-300 font-medium"
                                            />
                                        </div>
                                    </div>

                                    <!-- Leave Type -->
                                    <div class="group">
                                        <label
                                            class="flex items-center gap-2 text-sm font-bold text-gray-700 mb-3"
                                        >
                                            <div
                                                class="bg-gradient-to-br from-purple-400 to-pink-500 p-1.5 rounded-lg shadow-sm"
                                            >
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
                                                        d="M7 7h.01M7 3h5c.512 0 1.024.195 1.414.586l7 7a2 2 0 010 2.828l-7 7a2 2 0 01-2.828 0l-7-7A1.994 1.994 0 013 12V7a4 4 0 014-4z"
                                                    />
                                                </svg>
                                            </div>
                                            Jenis Izin
                                            <span class="text-red-500">*</span>
                                        </label>
                                        <div class="relative">
                                            <select
                                                v-model="leaveForm.leave_type"
                                                required
                                                class="w-full rounded-xl border-2 border-gray-200 shadow-sm focus:border-orange-400 focus:ring-4 focus:ring-orange-100 px-4 py-3.5 pr-12 appearance-none transition-all duration-200 hover:border-gray-300 font-medium bg-white cursor-pointer"
                                            >
                                                <option value="izin">
                                                    📋 Izin
                                                </option>
                                                <option value="sakit">
                                                    🏥 Sakit
                                                </option>
                                                <option value="cuti">
                                                    🏖️ Cuti
                                                </option>
                                            </select>
                                            <div
                                                class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-4 text-gray-500"
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
                                                        d="M19 9l-7 7-7-7"
                                                    />
                                                </svg>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Schedule Selection -->
                                <div class="group">
                                    <label
                                        class="flex items-center gap-2 text-sm font-bold text-gray-700 mb-3"
                                    >
                                        <div
                                            class="bg-gradient-to-br from-blue-400 to-cyan-500 p-1.5 rounded-lg shadow-sm"
                                        >
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
                                                    d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"
                                                />
                                            </svg>
                                        </div>
                                        Jadwal Terkait
                                        <span
                                            class="text-xs text-gray-500 font-normal"
                                            >(Opsional)</span
                                        >
                                    </label>
                                    <div class="relative">
                                        <select
                                            v-model="leaveForm.schedule_id"
                                            class="w-full rounded-xl border-2 border-gray-200 shadow-sm focus:border-orange-400 focus:ring-4 focus:ring-orange-100 px-4 py-3.5 pr-12 appearance-none transition-all duration-200 hover:border-gray-300 font-medium bg-white cursor-pointer"
                                        >
                                            <option value="">
                                                Tidak terkait jadwal tertentu
                                            </option>
                                            <option
                                                v-for="schedule in schedules"
                                                :key="schedule.id"
                                                :value="schedule.id"
                                            >
                                                {{ schedule.subject }} -
                                                {{ schedule.class }} ({{
                                                    schedule.start_time
                                                }}
                                                - {{ schedule.end_time }})
                                            </option>
                                        </select>
                                        <div
                                            class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-4 text-gray-500"
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
                                                    d="M19 9l-7 7-7-7"
                                                />
                                            </svg>
                                        </div>
                                    </div>
                                </div>

                                <!-- Reason -->
                                <div class="group">
                                    <label
                                        class="flex items-center gap-2 text-sm font-bold text-gray-700 mb-3"
                                    >
                                        <div
                                            class="bg-gradient-to-br from-green-400 to-emerald-500 p-1.5 rounded-lg shadow-sm"
                                        >
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
                                                    d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"
                                                />
                                            </svg>
                                        </div>
                                        Alasan/Keterangan
                                        <span class="text-red-500">*</span>
                                    </label>
                                    <textarea
                                        v-model="leaveForm.reason"
                                        required
                                        rows="4"
                                        class="w-full rounded-xl border-2 border-gray-200 shadow-sm focus:border-orange-400 focus:ring-4 focus:ring-orange-100 px-4 py-3.5 transition-all duration-200 hover:border-gray-300 resize-none font-medium"
                                        placeholder="Jelaskan alasan pengajuan izin Anda dengan detail..."
                                    ></textarea>
                                    <div class="flex items-center gap-2 mt-2">
                                        <div
                                            class="flex-1 h-1 bg-gray-200 rounded-full overflow-hidden"
                                        >
                                            <div
                                                class="h-full bg-gradient-to-r from-green-400 to-emerald-500 transition-all duration-300"
                                                :style="{
                                                    width:
                                                        Math.min(
                                                            (leaveForm.reason
                                                                .length /
                                                                10) *
                                                                100,
                                                            100
                                                        ) + '%',
                                                }"
                                            ></div>
                                        </div>
                                        <span
                                            class="text-xs font-semibold"
                                            :class="
                                                leaveForm.reason.length >= 10
                                                    ? 'text-green-600'
                                                    : 'text-gray-400'
                                            "
                                        >
                                            {{ leaveForm.reason.length }}/10
                                        </span>
                                    </div>
                                </div>

                                <!-- File Attachment -->
                                <div class="group">
                                    <label
                                        class="flex items-center gap-2 text-sm font-bold text-gray-700 mb-3"
                                    >
                                        <div
                                            class="bg-gradient-to-br from-indigo-400 to-purple-500 p-1.5 rounded-lg shadow-sm"
                                        >
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
                                                    d="M15.172 7l-6.586 6.586a2 2 0 102.828 2.828l6.414-6.586a4 4 0 00-5.656-5.656l-6.415 6.585a6 6 0 108.486 8.486L20.5 13"
                                                />
                                            </svg>
                                        </div>
                                        Lampiran Dokumen
                                        <span
                                            class="text-xs text-gray-500 font-normal"
                                            >(Opsional - Maks 2MB)</span
                                        >
                                    </label>
                                    <div class="mt-2">
                                        <label
                                            class="group/upload relative flex flex-col items-center justify-center w-full h-40 border-2 border-dashed rounded-xl cursor-pointer transition-all duration-300"
                                            :class="
                                                leaveForm.attachment
                                                    ? 'border-green-400 bg-green-50 hover:bg-green-100'
                                                    : 'border-gray-300 bg-gradient-to-br from-gray-50 to-blue-50 hover:border-orange-400 hover:bg-orange-50'
                                            "
                                        >
                                            <div
                                                class="flex flex-col items-center justify-center pt-5 pb-6"
                                            >
                                                <div
                                                    v-if="!leaveForm.attachment"
                                                    class="text-center space-y-3"
                                                >
                                                    <div
                                                        class="bg-gradient-to-br from-blue-100 to-purple-100 rounded-full p-4 mx-auto w-fit group-hover/upload:scale-110 transition-transform duration-300"
                                                    >
                                                        <svg
                                                            class="w-10 h-10 text-blue-600"
                                                            fill="none"
                                                            stroke="currentColor"
                                                            viewBox="0 0 24 24"
                                                        >
                                                            <path
                                                                stroke-linecap="round"
                                                                stroke-linejoin="round"
                                                                stroke-width="2"
                                                                d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12"
                                                            ></path>
                                                        </svg>
                                                    </div>
                                                    <div>
                                                        <p
                                                            class="text-sm font-semibold text-gray-700"
                                                        >
                                                            <span
                                                                class="text-orange-600"
                                                                >Klik untuk
                                                                upload</span
                                                            >
                                                            atau drag & drop
                                                        </p>
                                                        <p
                                                            class="text-xs text-gray-500 mt-1"
                                                        >
                                                            PDF, JPG, PNG
                                                            (Maksimal 2MB)
                                                        </p>
                                                    </div>
                                                </div>
                                                <div
                                                    v-else
                                                    class="text-center space-y-3"
                                                >
                                                    <div
                                                        class="bg-green-100 rounded-full p-4 mx-auto w-fit"
                                                    >
                                                        <svg
                                                            class="w-10 h-10 text-green-600"
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
                                                    <div>
                                                        <p
                                                            class="text-sm font-bold text-gray-900"
                                                        >
                                                            {{
                                                                leaveForm
                                                                    .attachment
                                                                    .name
                                                            }}
                                                        </p>
                                                        <p
                                                            class="text-xs text-gray-500 mt-1"
                                                        >
                                                            {{
                                                                formatFileSize(
                                                                    leaveForm
                                                                        .attachment
                                                                        .size
                                                                )
                                                            }}
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <input
                                                @change="handleFileUpload"
                                                type="file"
                                                accept=".pdf,.jpg,.jpeg,.png"
                                                class="hidden"
                                            />
                                        </label>
                                    </div>
                                    <div
                                        class="flex items-start gap-2 mt-3 p-3 bg-blue-50 rounded-lg border border-blue-200"
                                    >
                                        <svg
                                            class="w-5 h-5 text-blue-600 flex-shrink-0 mt-0.5"
                                            fill="none"
                                            stroke="currentColor"
                                            viewBox="0 0 24 24"
                                        >
                                            <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="2"
                                                d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"
                                            />
                                        </svg>
                                        <p
                                            class="text-xs text-blue-700 font-medium"
                                        >
                                            Lampirkan surat keterangan dokter
                                            (untuk sakit) atau dokumen pendukung
                                            lainnya untuk mempercepat proses
                                            persetujuan.
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <!-- Action Buttons -->
                            <div
                                class="sticky bottom-0 bg-gradient-to-t from-white via-white to-transparent pt-6 pb-8 px-8"
                            >
                                <div class="flex gap-4">
                                    <button
                                        type="button"
                                        @click="closeLeaveModal"
                                        class="flex-1 px-6 py-4 bg-gray-100 hover:bg-gray-200 text-gray-700 font-bold rounded-xl transition-all duration-200 hover:scale-105 active:scale-95 shadow-md hover:shadow-lg"
                                    >
                                        <span
                                            class="flex items-center justify-center gap-2"
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
                                                    d="M6 18L18 6M6 6l12 12"
                                                />
                                            </svg>
                                            Batal
                                        </span>
                                    </button>
                                    <button
                                        type="submit"
                                        :disabled="isSubmittingLeave"
                                        class="flex-1 px-6 py-4 bg-gradient-to-r from-yellow-500 via-orange-500 to-red-500 hover:from-yellow-600 hover:via-orange-600 hover:to-red-600 text-white font-bold rounded-xl shadow-lg hover:shadow-xl transition-all duration-200 hover:scale-105 active:scale-95 disabled:opacity-50 disabled:cursor-not-allowed disabled:hover:scale-100"
                                    >
                                        <span
                                            v-if="isSubmittingLeave"
                                            class="flex items-center justify-center gap-3"
                                        >
                                            <svg
                                                class="animate-spin h-6 w-6"
                                                fill="none"
                                                viewBox="0 0 24 24"
                                            >
                                                <circle
                                                    class="opacity-25"
                                                    cx="12"
                                                    cy="12"
                                                    r="10"
                                                    stroke="currentColor"
                                                    stroke-width="4"
                                                ></circle>
                                                <path
                                                    class="opacity-75"
                                                    fill="currentColor"
                                                    d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"
                                                ></path>
                                            </svg>
                                            <span>Mengirim...</span>
                                        </span>
                                        <span
                                            v-else
                                            class="flex items-center justify-center gap-2"
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
                                                    d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"
                                                />
                                            </svg>
                                            Ajukan Izin
                                        </span>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </Transition>
            </div>
        </div>
    </Transition>

    <!-- Camera Modal -->
    <div v-if="showCameraModal" class="fixed inset-0 z-50 overflow-y-auto">
        <div class="flex min-h-screen items-center justify-center p-4">
            <div
                class="fixed inset-0 bg-black bg-opacity-50"
                @click="closeCameraModal"
            ></div>

            <div
                class="relative bg-white rounded-lg shadow-xl max-w-4xl w-full max-h-[90vh] overflow-y-auto"
            >
                <div class="p-6">
                    <div class="flex items-center justify-between mb-4">
                        <h3 class="text-lg font-medium text-gray-900">
                            {{
                                currentAction === "checkin"
                                    ? "Check-in"
                                    : "Check-out"
                            }}
                            - {{ currentSchedule?.subject }}
                        </h3>
                        <button
                            @click="closeCameraModal"
                            class="text-gray-400 hover:text-gray-600"
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
                                ></path>
                            </svg>
                        </button>
                    </div>

                    <!-- Location Map -->
                    <div v-if="currentSchedule?.location" class="mb-6">
                        <h4
                            class="text-sm font-semibold text-gray-700 mb-3 flex items-center gap-2"
                        >
                            <svg
                                class="w-5 h-5 text-blue-600"
                                fill="none"
                                stroke="currentColor"
                                viewBox="0 0 24 24"
                            >
                                <path
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    stroke-width="2"
                                    d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"
                                />
                                <path
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    stroke-width="2"
                                    d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"
                                />
                            </svg>
                            Verifikasi Lokasi
                        </h4>
                        <LocationMap
                            v-if="
                                currentSchedule.location.latitude &&
                                currentSchedule.location.longitude
                            "
                            :target-latitude="
                                parseFloat(currentSchedule.location.latitude)
                            "
                            :target-longitude="
                                parseFloat(currentSchedule.location.longitude)
                            "
                            :radius="parseInt(currentSchedule.location.radius)"
                            :location-name="currentSchedule.location.name"
                            @location-update="handleLocationUpdate"
                        />
                        <div
                            v-else
                            class="p-4 bg-yellow-50 border-l-4 border-yellow-400 rounded"
                        >
                            <p class="text-sm text-yellow-800 font-medium">
                                ⚠️ Data lokasi tidak lengkap untuk jadwal ini.
                            </p>
                        </div>

                        <!-- Warning if outside radius -->
                        <div
                            v-if="locationDistance !== null && !isWithinRadius"
                            class="mt-3 p-3 bg-red-50 border-l-4 border-red-500 rounded"
                        >
                            <div class="flex items-start gap-2">
                                <svg
                                    class="w-5 h-5 text-red-600 flex-shrink-0 mt-0.5"
                                    fill="currentColor"
                                    viewBox="0 0 20 20"
                                >
                                    <path
                                        fill-rule="evenodd"
                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z"
                                        clip-rule="evenodd"
                                    />
                                </svg>
                                <div>
                                    <p
                                        class="text-sm font-semibold text-red-800"
                                    >
                                        Anda berada di luar radius lokasi!
                                    </p>
                                    <p class="text-xs text-red-700 mt-1">
                                        Jarak Anda:
                                        {{ locationDistance.toFixed(0) }}m dari
                                        lokasi. Radius yang diperbolehkan:
                                        {{ currentSchedule.location.radius }}m
                                    </p>
                                </div>
                            </div>
                        </div>

                        <!-- Success if within radius -->
                        <div
                            v-else-if="isWithinRadius"
                            class="mt-3 p-3 bg-green-50 border-l-4 border-green-500 rounded"
                        >
                            <div class="flex items-start gap-2">
                                <svg
                                    class="w-5 h-5 text-green-600 flex-shrink-0 mt-0.5"
                                    fill="currentColor"
                                    viewBox="0 0 20 20"
                                >
                                    <path
                                        fill-rule="evenodd"
                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                        clip-rule="evenodd"
                                    />
                                </svg>
                                <div>
                                    <p
                                        class="text-sm font-semibold text-green-800"
                                    >
                                        Lokasi Anda sesuai!
                                    </p>
                                    <p class="text-xs text-green-700 mt-1">
                                        Jarak:
                                        {{ locationDistance.toFixed(0) }}m dari
                                        lokasi
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mb-4">
                        <h4
                            class="text-sm font-semibold text-gray-700 mb-3 flex items-center gap-2"
                        >
                            <svg
                                class="w-5 h-5 text-purple-600"
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
                            Foto Selfie
                        </h4>

                        <!-- Camera Preview -->
                        <div
                            v-if="!capturedImage"
                            class="relative bg-gray-100 rounded-lg overflow-hidden"
                        >
                            <video
                                ref="videoRef"
                                autoplay
                                playsinline
                                class="w-full h-64 object-cover"
                                @loadedmetadata="() => {}"
                            ></video>
                            <canvas ref="canvasRef" class="hidden"></canvas>
                        </div>

                        <!-- Captured Image Preview -->
                        <div
                            v-else
                            class="relative bg-gray-100 rounded-lg overflow-hidden"
                        >
                            <img
                                :src="capturedImage"
                                alt="Captured selfie"
                                class="w-full h-64 object-cover"
                            />
                        </div>
                    </div>

                    <div class="flex space-x-3">
                        <button
                            v-if="!capturedImage"
                            @click="capturePhoto"
                            class="flex-1 bg-blue-600 text-white px-4 py-3 rounded-lg hover:bg-blue-700 transition-colors font-medium shadow-md"
                        >
                            📸 Ambil Foto
                        </button>

                        <button
                            v-if="capturedImage"
                            @click="retakePhoto"
                            class="flex-1 bg-gray-600 text-white px-4 py-3 rounded-lg hover:bg-gray-700 transition-colors font-medium shadow-md"
                        >
                            🔄 Ambil Ulang
                        </button>

                        <button
                            v-if="capturedImage"
                            @click="submitAttendance"
                            :disabled="
                                !isWithinRadius ||
                                loadingStates[
                                    `${currentAction}-${currentSchedule?.id}`
                                ]
                            "
                            class="flex-1 bg-green-600 text-white px-4 py-3 rounded-lg hover:bg-green-700 transition-colors disabled:opacity-50 disabled:cursor-not-allowed font-medium shadow-md"
                        >
                            <span
                                v-if="
                                    loadingStates[
                                        `${currentAction}-${currentSchedule?.id}`
                                    ]
                                "
                            >
                                ⏳ Memproses...
                            </span>
                            <span v-else-if="!isWithinRadius">
                                ⚠️ Di Luar Radius
                            </span>
                            <span v-else> ✅ Kirim </span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref } from "vue";
import axios from "axios";
import { router, Link, Head } from "@inertiajs/vue3";
import AppLayout from "@/Layouts/AppLayout.vue";
import LocationMap from "@/Components/LocationMap.vue";

const props = defineProps({
    schedules: { type: Array, required: true },
});

defineOptions({ layout: AppLayout });

const loadingStates = ref({});
const showCameraModal = ref(false);
const currentSchedule = ref(null);
const currentAction = ref(""); // 'checkin' or 'checkout'
const capturedImage = ref(null);
const videoRef = ref(null);
const canvasRef = ref(null);
const stream = ref(null);

// Location tracking
const userLocation = ref(null);
const locationDistance = ref(null);
const isWithinRadius = ref(false);

// Leave form states
const showLeaveModal = ref(false);
const isSubmittingLeave = ref(false);
const leaveForm = ref({
    leave_date: "",
    leave_type: "izin",
    schedule_id: "",
    reason: "",
    attachment: null,
});

function getAttendance(schedule) {
    return schedule.attendances && schedule.attendances.length
        ? schedule.attendances[0]
        : null;
}

function isCheckedIn(schedule) {
    const a = getAttendance(schedule);
    return !!(a && a.check_in_time);
}

function isCheckedOut(schedule) {
    const a = getAttendance(schedule);
    return !!(a && a.check_out_time);
}

// Check if the schedule has an approved leave
function isLeave(schedule) {
    const a = getAttendance(schedule);
    return !!(a && a.status === 'izin' && a.notes && a.notes.startsWith('Izin disetujui:'));
}

// Check if the schedule is marked as absent
function isAbsent(schedule) {
    const a = getAttendance(schedule);
    return !!(a && a.status === 'alpha');
}

async function getCurrentPosition() {
    return new Promise((resolve, reject) => {
        if (!navigator.geolocation) {
            reject(new Error("Geolocation tidak didukung oleh browser Anda."));
            return;
        }
        navigator.geolocation.getCurrentPosition(
            (pos) =>
                resolve({
                    latitude: pos.coords.latitude,
                    longitude: pos.coords.longitude,
                }),
            (err) => {
                if (err.code === 1) {
                    reject(
                        new Error(
                            "Akses lokasi ditolak. Silakan izinkan akses lokasi untuk melakukan presensi."
                        )
                    );
                } else if (err.code === 3) {
                    reject(
                        new Error(
                            "Timeout saat mengambil lokasi. Silakan coba lagi."
                        )
                    );
                } else {
                    reject(new Error("Gagal mengambil lokasi: " + err.message));
                }
            },
            { enableHighAccuracy: true, timeout: 10000, maximumAge: 60000 }
        );
    });
}

async function onCheckIn(schedule) {
    console.log("Opening check-in modal for schedule:", schedule);
    console.log("Location data:", schedule.location);
    currentSchedule.value = schedule;
    currentAction.value = "checkin";
    showCameraModal.value = true;
    await startCamera();
}

async function onCheckOut(schedule) {
    currentSchedule.value = schedule;
    currentAction.value = "checkout";
    showCameraModal.value = true;
    await startCamera();
}

// Camera functions
async function startCamera() {
    try {
        stream.value = await navigator.mediaDevices.getUserMedia({
            video: {
                facingMode: "user",
                width: { ideal: 640 },
                height: { ideal: 480 },
            },
        });
        if (videoRef.value) {
            videoRef.value.srcObject = stream.value;
        }
    } catch (error) {
        alert("Tidak dapat mengakses kamera: " + error.message);
        closeCameraModal();
    }
}

function capturePhoto() {
    if (videoRef.value && canvasRef.value) {
        const canvas = canvasRef.value;
        const video = videoRef.value;
        const context = canvas.getContext("2d");

        canvas.width = video.videoWidth;
        canvas.height = video.videoHeight;
        context.drawImage(video, 0, 0);

        capturedImage.value = canvas.toDataURL("image/jpeg", 0.8);
        stopCamera();
    }
}

function retakePhoto() {
    capturedImage.value = null;
    startCamera();
}

function stopCamera() {
    if (stream.value) {
        stream.value.getTracks().forEach((track) => track.stop());
        stream.value = null;
    }
}

function closeCameraModal() {
    showCameraModal.value = false;
    capturedImage.value = null;
    userLocation.value = null;
    locationDistance.value = null;
    isWithinRadius.value = false;
    stopCamera();
}

function handleLocationUpdate(locationData) {
    userLocation.value = {
        latitude: locationData.latitude,
        longitude: locationData.longitude,
    };
    locationDistance.value = locationData.distance;
    isWithinRadius.value = locationData.isInRadius;
}

async function submitAttendance() {
    if (!capturedImage.value || !currentSchedule.value) return;

    if (!isWithinRadius.value) {
        alert("Anda berada di luar radius lokasi yang diperbolehkan!");
        return;
    }

    if (!userLocation.value) {
        alert("Lokasi belum terdeteksi. Mohon tunggu sebentar...");
        return;
    }

    const loadingKey = `${currentAction.value}-${currentSchedule.value.id}`;
    loadingStates.value[loadingKey] = true;

    try {
        // Use location from map component
        const { latitude, longitude } = userLocation.value;

        // Convert base64 to blob
        const response = await fetch(capturedImage.value);
        const blob = await response.blob();
        const file = new File([blob], "selfie.jpg", { type: "image/jpeg" });

        const formData = new FormData();
        formData.append("schedule_id", currentSchedule.value.id);
        formData.append("latitude", latitude);
        formData.append("longitude", longitude);
        formData.append("selfie", file);

        // Get CSRF token from meta tag
        const csrfToken = document
            .querySelector('meta[name="csrf-token"]')
            ?.getAttribute("content");
        if (csrfToken) {
            formData.append("_token", csrfToken);
        }

        const endpoint =
            currentAction.value === "checkin"
                ? "/attendance/check-in"
                : "/attendance/check-out";
        const { data: serverResponse } = await axios.post(endpoint, formData, {
            headers: {
                "Content-Type": "multipart/form-data",
                "X-CSRF-TOKEN": csrfToken,
            },
        });

        console.log("Server response:", serverResponse);

        if (serverResponse.success) {
            router.reload({ only: ["schedules"] });
            closeCameraModal();
        } else {
            alert(serverResponse.error || `Gagal ${currentAction.value}`);
        }
    } catch (e) {
        console.error("Error during attendance submission:", e);
        const errorMessage =
            e?.response?.data?.error ||
            e.message ||
            `Gagal ${currentAction.value}`;
        alert(errorMessage);
    } finally {
        loadingStates.value[loadingKey] = false;
    }
}

// Leave Modal Functions
function closeLeaveModal() {
    showLeaveModal.value = false;
    leaveForm.value = {
        leave_date: "",
        leave_type: "izin",
        schedule_id: "",
        reason: "",
        attachment: null,
    };
}

function handleFileUpload(event) {
    const file = event.target.files[0];
    if (file) {
        // Validate file size (2MB max)
        if (file.size > 2 * 1024 * 1024) {
            alert("Ukuran file maksimal 2MB");
            event.target.value = "";
            return;
        }

        // Validate file type
        const allowedTypes = [
            "application/pdf",
            "image/jpeg",
            "image/jpg",
            "image/png",
        ];
        if (!allowedTypes.includes(file.type)) {
            alert("Format file harus PDF, JPG, atau PNG");
            event.target.value = "";
            return;
        }

        leaveForm.value.attachment = file;
    }
}

function formatFileSize(bytes) {
    if (bytes === 0) return "0 Bytes";
    const k = 1024;
    const sizes = ["Bytes", "KB", "MB"];
    const i = Math.floor(Math.log(bytes) / Math.log(k));
    return Math.round((bytes / Math.pow(k, i)) * 100) / 100 + " " + sizes[i];
}

async function submitLeave() {
    // Validation
    if (!leaveForm.value.leave_date) {
        alert("Tanggal izin harus diisi");
        return;
    }

    if (!leaveForm.value.reason || leaveForm.value.reason.length < 10) {
        alert("Alasan minimal 10 karakter");
        return;
    }

    isSubmittingLeave.value = true;

    try {
        const formData = new FormData();
        formData.append("leave_date", leaveForm.value.leave_date);
        formData.append("leave_type", leaveForm.value.leave_type);
        formData.append("reason", leaveForm.value.reason);

        if (leaveForm.value.schedule_id) {
            formData.append("schedule_id", leaveForm.value.schedule_id);
        }

        if (leaveForm.value.attachment) {
            formData.append("attachment", leaveForm.value.attachment);
        }

        // Get CSRF token
        const csrfToken = document
            .querySelector('meta[name="csrf-token"]')
            ?.getAttribute("content");

        const { data: response } = await axios.post(
            "/attendance/leave",
            formData,
            {
                headers: {
                    "Content-Type": "multipart/form-data",
                    "X-CSRF-TOKEN": csrfToken,
                },
            }
        );

        if (response.success) {
            alert(response.message || "Pengajuan izin berhasil dikirim!");
            closeLeaveModal();
            router.reload({ only: ["schedules"] });
        } else {
            alert(response.error || "Gagal mengajukan izin");
        }
    } catch (error) {
        console.error("Error submitting leave:", error);
        const errorMessage =
            error?.response?.data?.error ||
            error.message ||
            "Gagal mengajukan izin";
        alert(errorMessage);
    } finally {
        isSubmittingLeave.value = false;
    }
}
</script>