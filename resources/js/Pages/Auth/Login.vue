<template>
    <Head title="Login - Absensi Pengajar" />
    <div
        class="min-h-screen flex items-center justify-center bg-gradient-to-b from-blue-50 to-gray-100 py-12 px-4 sm:px-6 lg:px-8"
    >
        <div
            class="max-w-md w-full bg-white rounded-xl shadow-2xl overflow-hidden p-8 space-y-6 sm:space-y-8 transition-all duration-300 hover:shadow-xl"
        >
            <div class="text-center">
                <div
                    class="mx-auto h-20 w-20 flex items-center justify-center rounded-full bg-gradient-to-r from-blue-500 to-blue-600 shadow-lg transform transition-all duration-300 hover:scale-105 mb-6"
                >
                    <svg
                        class="h-10 w-10 text-white"
                        fill="none"
                        stroke="currentColor"
                        viewBox="0 0 24 24"
                    >
                        <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            stroke-width="2"
                            d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"
                        ></path>
                    </svg>
                </div>
                <h2
                    class="text-center text-3xl font-extrabold text-gray-800 tracking-tight"
                >
                    Masuk ke Akun Anda
                </h2>
                <p
                    class="mt-3 text-center text-md text-gray-600 max-w-sm mx-auto"
                >
                    Sistem Presensi Pengajar
                </p>
                <div
                    class="h-1 w-16 bg-blue-500 mx-auto mt-4 rounded-full"
                ></div>
            </div>

            <form @submit.prevent="submit" class="mt-8 space-y-6" novalidate>
                <div class="space-y-4 mt-8">
                    <div class="relative">
                        <label
                            for="email"
                            class="block text-sm font-medium text-gray-700 mb-1"
                            >Email</label
                        >
                        <div class="relative rounded-md shadow-sm">
                            <div
                                class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none"
                            >
                                <svg
                                    class="h-5 w-5 text-gray-400"
                                    xmlns="http://www.w3.org/2000/svg"
                                    viewBox="0 0 20 20"
                                    fill="currentColor"
                                    aria-hidden="true"
                                >
                                    <path
                                        d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"
                                    />
                                    <path
                                        d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"
                                    />
                                </svg>
                            </div>
                            <input
                                id="email"
                                v-model="form.email"
                                name="email"
                                type="email"
                                autocomplete="username"
                                required
                                class="appearance-none block w-full pl-10 pr-3 py-3 border border-gray-300 rounded-lg placeholder-gray-400 text-gray-900 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition duration-150 ease-in-out text-sm"
                                placeholder="Alamat email"
                                inputmode="email"
                                autofocus
                            />
                        </div>
                    </div>
                    <div class="relative">
                        <label
                            for="password"
                            class="block text-sm font-medium text-gray-700 mb-1"
                            >Kata Sandi</label
                        >
                        <div class="relative rounded-md shadow-sm">
                            <div
                                class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none"
                            >
                                <svg
                                    class="h-5 w-5 text-gray-400"
                                    xmlns="http://www.w3.org/2000/svg"
                                    viewBox="0 0 20 20"
                                    fill="currentColor"
                                    aria-hidden="true"
                                >
                                    <path
                                        fill-rule="evenodd"
                                        d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z"
                                        clip-rule="evenodd"
                                    />
                                </svg>
                            </div>
                            <input
                                id="password"
                                v-model="form.password"
                                name="password"
                                :type="showPassword ? 'text' : 'password'"
                                autocomplete="current-password"
                                required
                                class="appearance-none block w-full pl-10 pr-10 py-3 border border-gray-300 rounded-lg placeholder-gray-400 text-gray-900 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition duration-150 ease-in-out text-sm"
                                placeholder="Kata sandi"
                            />
                            <button
                                type="button"
                                @click="showPassword = !showPassword"
                                class="absolute inset-y-0 right-0 pr-3 flex items-center text-sm leading-5 text-gray-500 hover:text-gray-700 focus:outline-none transition duration-150 ease-in-out"
                            >
                                <svg
                                    v-if="showPassword"
                                    class="h-5 w-5"
                                    xmlns="http://www.w3.org/2000/svg"
                                    viewBox="0 0 20 20"
                                    fill="currentColor"
                                >
                                    <path d="M10 12a2 2 0 100-4 2 2 0 000 4z" />
                                    <path
                                        fill-rule="evenodd"
                                        d="M.458 10C1.732 5.943 5.522 3 10 3s8.268 2.943 9.542 7c-1.274 4.057-5.064 7-9.542 7S1.732 14.057.458 10zM14 10a4 4 0 11-8 0 4 4 0 018 0z"
                                        clip-rule="evenodd"
                                    />
                                </svg>
                                <svg
                                    v-else
                                    class="h-5 w-5"
                                    xmlns="http://www.w3.org/2000/svg"
                                    viewBox="0 0 20 20"
                                    fill="currentColor"
                                >
                                    <path
                                        fill-rule="evenodd"
                                        d="M3.707 2.293a1 1 0 00-1.414 1.414l14 14a1 1 0 001.414-1.414l-1.473-1.473A10.014 10.014 0 0019.542 10C18.268 5.943 14.478 3 10 3a9.958 9.958 0 00-4.512 1.074l-1.78-1.781zm4.261 4.26l1.514 1.515a2.003 2.003 0 012.45 2.45l1.514 1.514a4 4 0 00-5.478-5.478z"
                                        clip-rule="evenodd"
                                    />
                                    <path
                                        d="M12.454 16.697L9.75 13.992a4 4 0 01-3.742-3.741L2.335 6.578A9.98 9.98 0 00.458 10c1.274 4.057 5.065 7 9.542 7 .847 0 1.669-.105 2.454-.303z"
                                    />
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Error Messages -->
                <div
                    v-if="$page.props.errors?.email"
                    class="rounded-md bg-red-50 p-4"
                >
                    <div class="flex">
                        <div class="flex-shrink-0">
                            <svg
                                class="h-5 w-5 text-red-400"
                                fill="none"
                                stroke="currentColor"
                                viewBox="0 0 24 24"
                            >
                                <path
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    stroke-width="2"
                                    d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"
                                ></path>
                            </svg>
                        </div>
                        <div class="ml-3">
                            <h3 class="text-sm font-medium text-red-800">
                                {{ $page.props.errors.email }}
                            </h3>
                        </div>
                    </div>
                </div>

                <!-- CSRF Error Message -->
                <div v-if="csrfError" class="rounded-md bg-yellow-50 p-4">
                    <div class="flex">
                        <div class="flex-shrink-0">
                            <svg
                                class="h-5 w-5 text-yellow-400"
                                fill="none"
                                stroke="currentColor"
                                viewBox="0 0 24 24"
                            >
                                <path
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    stroke-width="2"
                                    d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"
                                ></path>
                            </svg>
                        </div>
                        <div class="ml-3">
                            <h3 class="text-sm font-medium text-yellow-800">
                                Sesi Anda telah berakhir. Silakan muat ulang
                                halaman dan coba lagi.
                            </h3>
                            <div class="mt-2">
                                <button
                                    @click="reloadPage"
                                    class="text-sm font-medium text-yellow-800 hover:text-yellow-900 underline"
                                >
                                    Muat Ulang Halaman
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="mt-6 space-y-4">
                    <div class="flex items-center">
                        <label
                            class="flex items-center space-x-3 text-sm text-gray-700 cursor-pointer select-none"
                        >
                            <div class="relative inline-flex items-center">
                                <input
                                    type="checkbox"
                                    v-model="form.remember"
                                    class="h-5 w-5 text-blue-600 border-gray-300 rounded focus:ring-blue-500 transition duration-150 ease-in-out"
                                />
                                <span class="ml-2">Ingat saya</span>
                            </div>
                        </label>
                    </div>

                    <button
                        type="submit"
                        :disabled="processing || !isValid"
                        class="group relative w-full flex justify-center py-3 px-4 border border-transparent text-sm font-medium rounded-lg text-white bg-gradient-to-r from-blue-600 to-blue-700 hover:from-blue-700 hover:to-blue-800 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 disabled:opacity-50 disabled:cursor-not-allowed transform transition-all duration-150 hover:shadow-lg hover:-translate-y-0.5 active:translate-y-0"
                    >
                        <span
                            class="absolute left-0 inset-y-0 flex items-center pl-3"
                        >
                            <svg
                                v-if="processing"
                                class="animate-spin h-5 w-5 text-blue-300"
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
                                class="h-5 w-5 text-blue-300 group-hover:text-blue-200"
                                fill="none"
                                stroke="currentColor"
                                viewBox="0 0 24 24"
                            >
                                <path
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    stroke-width="2"
                                    d="M11 16l-4-4m0 0l4-4m-4 4h14m-5 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h7a3 3 0 013 3v1"
                                ></path>
                            </svg>
                        </span>
                        <span class="ml-1">{{
                            processing ? "Memproses..." : "Masuk"
                        }}</span>
                    </button>
                </div>

                <!-- Demo Credentials -->
                <div
                    class="mt-6 sm:mt-8 overflow-hidden rounded-lg border border-blue-100 bg-gradient-to-r from-blue-50 to-indigo-50 shadow-sm"
                >
                    <div class="px-4 py-3 bg-blue-100 border-b border-blue-200">
                        <div class="flex items-center">
                            <svg
                                class="h-5 w-5 text-blue-600 mr-2"
                                xmlns="http://www.w3.org/2000/svg"
                                viewBox="0 0 20 20"
                                fill="currentColor"
                            >
                                <path
                                    fill-rule="evenodd"
                                    d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z"
                                    clip-rule="evenodd"
                                />
                            </svg>
                            <h4 class="text-sm font-semibold text-blue-800">
                                Demo Credentials
                            </h4>
                        </div>
                    </div>
                    <div class="p-4 text-sm text-blue-700 space-y-3">
                        <div
                            class="flex items-center p-2 rounded-md hover:bg-blue-100 transition-colors duration-150"
                        >
                            <svg
                                class="h-5 w-5 text-blue-500 mr-3"
                                xmlns="http://www.w3.org/2000/svg"
                                viewBox="0 0 20 20"
                                fill="currentColor"
                            >
                                <path
                                    fill-rule="evenodd"
                                    d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z"
                                    clip-rule="evenodd"
                                />
                            </svg>
                            <div>
                                <span class="font-medium">Admin:</span>
                                admin@presensi.test / password
                            </div>
                        </div>
                        <div
                            class="flex items-center p-2 rounded-md hover:bg-blue-100 transition-colors duration-150"
                        >
                            <svg
                                class="h-5 w-5 text-blue-500 mr-3"
                                xmlns="http://www.w3.org/2000/svg"
                                viewBox="0 0 20 20"
                                fill="currentColor"
                            >
                                <path
                                    d="M10.394 2.08a1 1 0 00-.788 0l-7 3a1 1 0 000 1.84L5.25 8.051a.999.999 0 01.356-.257l4-1.714a1 1 0 11.788 1.838L7.667 9.088l1.94.831a1 1 0 00.787 0l7-3a1 1 0 000-1.838l-7-3zM3.31 9.397L5 10.12v4.102a8.969 8.969 0 00-1.05-.174 1 1 0 01-.89-.89 11.115 11.115 0 01.25-3.762zM9.3 16.573A9.026 9.026 0 007 14.935v-3.957l1.818.78a3 3 0 002.364 0l5.508-2.361a11.026 11.026 0 01.25 3.762 1 1 0 01-.89.89 8.968 8.968 0 00-5.35 2.524 1 1 0 01-1.4 0zM6 18a1 1 0 001-1v-2.065a8.935 8.935 0 00-2-.712V17a1 1 0 001 1z"
                                />
                            </svg>
                            <div>
                                <span class="font-medium">Pengajar:</span>
                                budi@presensi.test / password
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</template>

<script setup>
import { reactive, ref, computed } from "vue";
import { router, Head, usePage } from "@inertiajs/vue3";

const form = reactive({ email: "", password: "", remember: false });
const processing = ref(false);
const showPassword = ref(false);
const csrfError = ref(false);

const isValid = computed(() => {
    return form.email.trim().length > 3 && form.password.trim().length >= 6;
});

function reloadPage() {
    window.location.reload();
}

function submit() {
    if (!isValid.value || processing.value) return;

    csrfError.value = false;
    processing.value = true;

    router.post("/login", form, {
        preserveScroll: true,
        preserveState: (page) => Object.keys(page.props.errors).length > 0,
        onSuccess: () => {
            const userRole = usePage().props.auth?.user?.role;
            if (userRole === "admin") {
                router.visit("/admin/dashboard", { replace: true });
            } else {
                router.visit("/dashboard", { replace: true });
            }
        },
        onError: (errors) => {
            console.error("Login error:", errors);
            // Check if it's a CSRF error (419)
            if (
                errors &&
                typeof errors === "object" &&
                Object.keys(errors).length === 0
            ) {
                csrfError.value = true;
            }
            processing.value = false;
        },
        onFinish: () => {
            processing.value = false;
        },
    });
}
</script>
