<template>
    <div class="min-h-screen bg-gray-50">
        <!-- Header -->
        <header class="bg-white shadow-sm border-b border-gray-200">
            <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                <div class="flex h-16 items-center justify-between">
                    <div class="flex items-center">
                        <div class="flex-shrink-0">
                            <h1
                                class="text-lg sm:text-xl font-bold text-gray-900"
                            >
                                📚 Absensi Pengajar
                            </h1>
                        </div>
                    </div>

                    <!-- Desktop Navigation -->
                    <nav class="hidden md:flex space-x-8">
                        <!-- Pengajar Navigation -->
                        <div
                            v-if="$page.props.auth?.user?.role === 'pengajar'"
                            class="flex items-center space-x-6"
                        >
                            <Link
                                href="/dashboard"
                                class="inline-flex items-center px-1 pt-1 text-sm font-medium transition-colors duration-200"
                                :class="
                                    $page.url === '/dashboard'
                                        ? 'text-blue-600 border-b-2 border-blue-600'
                                        : 'text-gray-500 hover:text-gray-700'
                                "
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
                                        d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2H5a2 2 0 00-2-2z"
                                    ></path>
                                    <path
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        stroke-width="2"
                                        d="M8 5a2 2 0 012-2h4a2 2 0 012 2v2H8V5z"
                                    ></path>
                                </svg>
                                Dashboard
                            </Link>
                            <Link
                                href="/attendance"
                                class="inline-flex items-center px-1 pt-1 text-sm font-medium transition-colors duration-200"
                                :class="
                                    $page.url === '/attendance'
                                        ? 'text-blue-600 border-b-2 border-blue-600'
                                        : 'text-gray-500 hover:text-gray-700'
                                "
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
                                Presensi
                            </Link>
                            <Link
                                href="/attendance/history"
                                class="inline-flex items-center px-1 pt-1 text-sm font-medium transition-colors duration-200"
                                :class="
                                    $page.url === '/attendance/history'
                                        ? 'text-blue-600 border-b-2 border-blue-600'
                                        : 'text-gray-500 hover:text-gray-700'
                                "
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
                                        d="M9 5H7a2 2 0 00-2 2v10a2 2 0 002 2h8a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002-2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"
                                    ></path>
                                </svg>
                                Riwayat
                            </Link>
                            <Link
                                href="/schedules"
                                class="inline-flex items-center px-1 pt-1 text-sm font-medium transition-colors duration-200"
                                :class="
                                    $page.url === '/schedules'
                                        ? 'text-blue-600 border-b-2 border-blue-600'
                                        : 'text-gray-500 hover:text-gray-700'
                                "
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
                                        d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"
                                    ></path>
                                </svg>
                                Jadwal
                            </Link>
                            <Link
                                href="/attendance/leaves"
                                class="inline-flex items-center px-1 pt-1 text-sm font-medium transition-colors duration-200"
                                :class="
                                    $page.url === '/attendance/leaves'
                                        ? 'text-blue-600 border-b-2 border-blue-600'
                                        : 'text-gray-500 hover:text-gray-700'
                                "
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
                                Izin
                            </Link>
                        </div>

                        <!-- Admin Navigation -->
                        <div
                            v-if="$page.props.auth?.user?.role === 'admin'"
                            class="flex items-center space-x-6"
                        >
                            <Link
                                href="/admin/dashboard"
                                class="inline-flex items-center px-1 pt-1 text-sm font-medium transition-colors duration-200"
                                :class="
                                    $page.url === '/admin/dashboard'
                                        ? 'text-purple-600 border-b-2 border-purple-600'
                                        : 'text-purple-500 hover:text-purple-700'
                                "
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
                                        d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2H5a2 2 0 00-2-2z"
                                    ></path>
                                    <path
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        stroke-width="2"
                                        d="M8 5a2 2 0 012-2h4a2 2 0 012 2v2H8V5z"
                                    ></path>
                                </svg>
                                Dashboard
                            </Link>
                            <Link
                                href="/admin/users"
                                class="inline-flex items-center px-1 pt-1 text-sm font-medium transition-colors duration-200"
                                :class="
                                    $page.url.startsWith('/admin/users')
                                        ? 'text-purple-600 border-b-2 border-purple-600'
                                        : 'text-purple-500 hover:text-purple-700'
                                "
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
                                        d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197m13.5-9a2.5 2.5 0 11-5 0 2.5 2.5 0 015 0z"
                                    ></path>
                                </svg>
                                Pengajar
                            </Link>
                            <Link
                                href="/admin/schedules"
                                class="inline-flex items-center px-1 pt-1 text-sm font-medium transition-colors duration-200"
                                :class="
                                    $page.url.startsWith('/admin/schedules')
                                        ? 'text-purple-600 border-b-2 border-purple-600'
                                        : 'text-purple-500 hover:text-purple-700'
                                "
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
                                        d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"
                                    ></path>
                                </svg>
                                Jadwal
                            </Link>
                            <Link
                                href="/admin/locations"
                                class="inline-flex items-center px-1 pt-1 text-sm font-medium transition-colors duration-200"
                                :class="
                                    $page.url.startsWith('/admin/locations')
                                        ? 'text-purple-600 border-b-2 border-purple-600'
                                        : 'text-purple-500 hover:text-purple-700'
                                "
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
                                        d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"
                                    ></path>
                                    <path
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        stroke-width="2"
                                        d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"
                                    ></path>
                                </svg>
                                Lokasi
                            </Link>
                            <Link
                                href="/admin/attendances"
                                class="inline-flex items-center px-1 pt-1 text-sm font-medium transition-colors duration-200"
                                :class="
                                    $page.url.startsWith('/admin/attendances')
                                        ? 'text-purple-600 border-b-2 border-purple-600'
                                        : 'text-purple-500 hover:text-purple-700'
                                "
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
                                Presensi
                            </Link>
                            <Link
                                href="/admin/leaves"
                                class="inline-flex items-center px-1 pt-1 text-sm font-medium transition-colors duration-200"
                                :class="
                                    $page.url.startsWith('/admin/leaves')
                                        ? 'text-purple-600 border-b-2 border-purple-600'
                                        : 'text-purple-500 hover:text-purple-700'
                                "
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
                                Izin
                            </Link>
                        </div>
                    </nav>

                    <!-- Mobile menu button -->
                    <div class="md:hidden flex items-center space-x-2">
                        <span class="text-xs text-gray-700 hidden sm:block">{{
                            $page.props.auth?.user?.name
                        }}</span>
                        <button
                            @click="mobileMenuOpen = !mobileMenuOpen"
                            class="inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-gray-500 hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-blue-500"
                        >
                            <svg
                                class="h-6 w-6"
                                fill="none"
                                stroke="currentColor"
                                viewBox="0 0 24 24"
                            >
                                <path
                                    v-if="!mobileMenuOpen"
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    stroke-width="2"
                                    d="M4 6h16M4 12h16M4 18h16"
                                ></path>
                                <path
                                    v-else
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    stroke-width="2"
                                    d="M6 18L18 6M6 6l12 12"
                                ></path>
                            </svg>
                        </button>
                    </div>

                    <!-- Desktop User menu -->
                    <div class="hidden md:flex items-center space-x-4">
                        <div class="flex items-center space-x-2">
                            <span class="text-sm text-gray-700">{{
                                $page.props.auth?.user?.name
                            }}</span>
                            <span
                                class="inline-flex items-center px-2 py-0.5 rounded-full text-xs font-medium"
                                :class="{
                                    'bg-purple-100 text-purple-800':
                                        $page.props.auth?.user?.role ===
                                        'admin',
                                    'bg-blue-100 text-blue-800':
                                        $page.props.auth?.user?.role ===
                                        'pengajar',
                                }"
                            >
                                {{
                                    $page.props.auth?.user?.role === "admin"
                                        ? "Admin"
                                        : "Pengajar"
                                }}
                            </span>
                        </div>
                        <button
                            @click="handleLogout"
                            :disabled="logoutProcessing"
                            class="inline-flex items-center text-sm text-gray-500 hover:text-gray-700 transition-colors duration-200 disabled:opacity-50"
                        >
                            <svg
                                v-if="!logoutProcessing"
                                class="w-4 h-4"
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
                            <svg
                                v-else
                                class="w-4 h-4 animate-spin text-gray-500"
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
                                    d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z"
                                ></path>
                            </svg>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Mobile Navigation Menu -->
            <div
                v-show="mobileMenuOpen"
                class="md:hidden border-t border-gray-200 bg-white"
            >
                <div class="px-2 pt-2 pb-3 space-y-1">
                    <!-- Pengajar Mobile Menu -->
                    <div v-if="$page.props.auth?.user?.role === 'pengajar'">
                        <div
                            class="px-3 py-2 text-xs font-medium text-blue-600 uppercase tracking-wider"
                        >
                            Menu Pengajar
                        </div>
                        <Link
                            href="/dashboard"
                            @click="mobileMenuOpen = false"
                            class="block px-3 py-2 rounded-md text-base font-medium transition-colors duration-200"
                            :class="
                                $page.url === '/dashboard'
                                    ? 'text-blue-600 bg-blue-50'
                                    : 'text-gray-500 hover:text-gray-700 hover:bg-gray-50'
                            "
                        >
                            <div class="flex items-center">
                                <svg
                                    class="w-5 h-5 mr-3"
                                    fill="none"
                                    stroke="currentColor"
                                    viewBox="0 0 24 24"
                                >
                                    <path
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        stroke-width="2"
                                        d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2H5a2 2 0 00-2-2z"
                                    ></path>
                                    <path
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        stroke-width="2"
                                        d="M8 5a2 2 0 012-2h4a2 2 0 012 2v2H8V5z"
                                    ></path>
                                </svg>
                                Dashboard
                            </div>
                        </Link>
                        <Link
                            href="/attendance"
                            @click="mobileMenuOpen = false"
                            class="block px-3 py-2 rounded-md text-base font-medium transition-colors duration-200"
                            :class="
                                $page.url === '/attendance'
                                    ? 'text-blue-600 bg-blue-50'
                                    : 'text-gray-500 hover:text-gray-700 hover:bg-gray-50'
                            "
                        >
                            <div class="flex items-center">
                                <svg
                                    class="w-5 h-5 mr-3"
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
                                Presensi
                            </div>
                        </Link>
                        <Link
                            href="/attendance/history"
                            @click="mobileMenuOpen = false"
                            class="block px-3 py-2 rounded-md text-base font-medium transition-colors duration-200"
                            :class="
                                $page.url === '/attendance/history'
                                    ? 'text-blue-600 bg-blue-50'
                                    : 'text-gray-500 hover:text-gray-700 hover:bg-gray-50'
                            "
                        >
                            <div class="flex items-center">
                                <svg
                                    class="w-5 h-5 mr-3"
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
                                Riwayat
                            </div>
                        </Link>
                        <Link
                            href="/schedules"
                            @click="mobileMenuOpen = false"
                            class="block px-3 py-2 rounded-md text-base font-medium transition-colors duration-200"
                            :class="
                                $page.url === '/schedules'
                                    ? 'text-blue-600 bg-blue-50'
                                    : 'text-gray-500 hover:text-gray-700 hover:bg-gray-50'
                            "
                        >
                            <div class="flex items-center">
                                <svg
                                    class="w-5 h-5 mr-3"
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
                                Jadwal
                            </div>
                        </Link>
                    </div>

                    <!-- Admin Mobile Menu -->
                    <div v-if="$page.props.auth?.user?.role === 'admin'">
                        <div
                            class="px-3 py-2 text-xs font-medium text-purple-600 uppercase tracking-wider"
                        >
                            Menu Admin
                        </div>
                        <Link
                            href="/admin/dashboard"
                            @click="mobileMenuOpen = false"
                            class="block px-3 py-2 rounded-md text-base font-medium transition-colors duration-200"
                            :class="
                                $page.url === '/admin/dashboard'
                                    ? 'text-purple-600 bg-purple-50'
                                    : 'text-purple-500 hover:text-purple-700 hover:bg-purple-50'
                            "
                        >
                            <div class="flex items-center">
                                <svg
                                    class="w-5 h-5 mr-3"
                                    fill="none"
                                    stroke="currentColor"
                                    viewBox="0 0 24 24"
                                >
                                    <path
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        stroke-width="2"
                                        d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2H5a2 2 0 00-2-2z"
                                    ></path>
                                    <path
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        stroke-width="2"
                                        d="M8 5a2 2 0 012-2h4a2 2 0 012 2v2H8V5z"
                                    ></path>
                                </svg>
                                Dashboard
                            </div>
                        </Link>
                        <Link
                            href="/admin/users"
                            @click="mobileMenuOpen = false"
                            class="block px-3 py-2 rounded-md text-base font-medium transition-colors duration-200"
                            :class="
                                $page.url.startsWith('/admin/users')
                                    ? 'text-purple-600 bg-purple-50'
                                    : 'text-purple-500 hover:text-purple-700 hover:bg-purple-50'
                            "
                        >
                            <div class="flex items-center">
                                <svg
                                    class="w-5 h-5 mr-3"
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
                                Pengajar
                            </div>
                        </Link>
                        <Link
                            href="/admin/schedules"
                            @click="mobileMenuOpen = false"
                            class="block px-3 py-2 rounded-md text-base font-medium transition-colors duration-200"
                            :class="
                                $page.url.startsWith('/admin/schedules')
                                    ? 'text-purple-600 bg-purple-50'
                                    : 'text-purple-500 hover:text-purple-700 hover:bg-purple-50'
                            "
                        >
                            <div class="flex items-center">
                                <svg
                                    class="w-5 h-5 mr-3"
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
                                Jadwal
                            </div>
                        </Link>
                        <Link
                            href="/admin/locations"
                            @click="mobileMenuOpen = false"
                            class="block px-3 py-2 rounded-md text-base font-medium transition-colors duration-200"
                            :class="
                                $page.url.startsWith('/admin/locations')
                                    ? 'text-purple-600 bg-purple-50'
                                    : 'text-purple-500 hover:text-purple-700 hover:bg-purple-50'
                            "
                        >
                            <div class="flex items-center">
                                <svg
                                    class="w-5 h-5 mr-3"
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
                                Lokasi
                            </div>
                        </Link>
                        <Link
                            href="/admin/attendances"
                            @click="mobileMenuOpen = false"
                            class="block px-3 py-2 rounded-md text-base font-medium transition-colors duration-200"
                            :class="
                                $page.url.startsWith('/admin/attendances')
                                    ? 'text-purple-600 bg-purple-50'
                                    : 'text-purple-500 hover:text-purple-700 hover:bg-purple-50'
                            "
                        >
                            <div class="flex items-center">
                                <svg
                                    class="w-5 h-5 mr-3"
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
                                Presensi
                            </div>
                        </Link>
                    </div>

                    <div class="border-t border-gray-200 pt-2">
                        <div class="px-3 py-2">
                            <div class="text-sm text-gray-900">
                                {{ $page.props.auth?.user?.name }}
                            </div>
                            <div class="text-xs text-gray-500">
                                <span
                                    class="inline-flex items-center px-2 py-0.5 rounded-full text-xs font-medium"
                                    :class="{
                                        'bg-purple-100 text-purple-800':
                                            $page.props.auth?.user?.role ===
                                            'admin',
                                        'bg-blue-100 text-blue-800':
                                            $page.props.auth?.user?.role ===
                                            'pengajar',
                                    }"
                                >
                                    {{
                                        $page.props.auth?.user?.role === "admin"
                                            ? "Admin"
                                            : "Pengajar"
                                    }}
                                </span>
                            </div>
                        </div>
                        <Link
                            as="button"
                            method="post"
                            href="/logout"
                            @click="mobileMenuOpen = false"
                            class="block w-full text-left px-3 py-2 rounded-md text-base font-medium text-gray-500 hover:text-gray-700 hover:bg-gray-50 transition-colors duration-200"
                        >
                            <div class="flex items-center">
                                <svg
                                    class="w-5 h-5 mr-3"
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
                                Logout
                            </div>
                        </Link>
                    </div>
                </div>
            </div>
        </header>

        <!-- Main content -->
        <main class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-4 sm:py-8">
            <slot />
        </main>

        <!-- Toast notifications -->
        <div
            v-if="$page.props.flash?.success"
            class="fixed top-4 right-4 z-40 max-w-sm"
        >
            <div
                class="bg-green-500 text-white px-4 py-3 rounded-lg shadow-lg flex items-center space-x-2"
            >
                <svg
                    class="w-5 h-5 flex-shrink-0"
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
                <span class="text-sm">{{ $page.props.flash.success }}</span>
            </div>
        </div>

        <div
            v-if="$page.props.flash?.error"
            class="fixed top-4 right-4 z-40 max-w-sm"
        >
            <div
                class="bg-red-500 text-white px-4 py-3 rounded-lg shadow-lg flex items-center space-x-2"
            >
                <svg
                    class="w-5 h-5 flex-shrink-0"
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
                <span class="text-sm">{{ $page.props.flash.error }}</span>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref } from "vue";
import { Link, router } from "@inertiajs/vue3";
import { useCsrf } from "@/Composables/useCsrf";

const mobileMenuOpen = ref(false);
const logoutProcessing = ref(false);

// Initialize CSRF token handling
useCsrf();

function handleLogout() {
    if (logoutProcessing.value) return;
    logoutProcessing.value = true;
    router.post(
        "/logout",
        {},
        {
            replace: true,
            onFinish: () => {
                logoutProcessing.value = false;
            },
        }
    );
}
</script>
