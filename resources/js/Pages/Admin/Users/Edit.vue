<template>
    <AppLayout>
        <div class="space-y-8">
        <!-- Header -->
        <div class="md:flex md:items-center md:justify-between">
            <div class="min-w-0 flex-1">
                <h2 class="text-xl sm:text-2xl font-bold leading-7 text-gray-900 sm:truncate sm:text-3xl sm:tracking-tight">
                    Edit Pengajar
                </h2>
                <p class="mt-1 text-sm text-gray-500">
                    Edit data {{ user.name }}.
                </p>
            </div>
            <div class="mt-4 flex md:ml-4 md:mt-0">
                <Link
                    href="/admin/users"
                    class="inline-flex items-center rounded-md bg-white px-3 py-2 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50"
                >
                    <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path>
                    </svg>
                    Kembali
                </Link>
            </div>
        </div>

        <!-- Form -->
        <div class="bg-white shadow rounded-lg">
            <form @submit.prevent="submit" class="px-4 py-5 sm:p-6">
                <div class="grid grid-cols-1 gap-6 sm:grid-cols-2">
                    <!-- Name -->
                    <div class="sm:col-span-2">
                        <label for="name" class="block text-sm font-medium text-gray-700">
                            Nama Lengkap <span class="text-red-500">*</span>
                        </label>
                        <input
                            type="text"
                            id="name"
                            v-model="form.name"
                            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 px-3 py-2 text-sm"
                            :class="{ 'border-red-300 focus:border-red-500 focus:ring-red-500': errors.name }"
                            placeholder="Masukkan nama lengkap"
                        />
                        <p v-if="errors.name" class="mt-1 text-sm text-red-600">{{ errors.name }}</p>
                    </div>

                    <!-- Email -->
                    <div>
                        <label for="email" class="block text-sm font-medium text-gray-700">
                            Email <span class="text-red-500">*</span>
                        </label>
                        <input
                            type="email"
                            id="email"
                            v-model="form.email"
                            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 px-3 py-2 text-sm"
                            :class="{ 'border-red-300 focus:border-red-500 focus:ring-red-500': errors.email }"
                            placeholder="contoh@email.com"
                        />
                        <p v-if="errors.email" class="mt-1 text-sm text-red-600">{{ errors.email }}</p>
                    </div>

                    <!-- NIP -->
                    <div>
                        <label for="nip" class="block text-sm font-medium text-gray-700">
                            NIP <span class="text-red-500">*</span>
                        </label>
                        <input
                            type="text"
                            id="nip"
                            v-model="form.nip"
                            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 px-3 py-2 text-sm"
                            :class="{ 'border-red-300 focus:border-red-500 focus:ring-red-500': errors.nip }"
                            placeholder="Nomor Induk Pegawai"
                        />
                        <p v-if="errors.nip" class="mt-1 text-sm text-red-600">{{ errors.nip }}</p>
                    </div>

                    <!-- Password -->
                    <div>
                        <label for="password" class="block text-sm font-medium text-gray-700">
                            Password Baru
                        </label>
                        <input
                            type="password"
                            id="password"
                            v-model="form.password"
                            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 px-3 py-2 text-sm"
                            :class="{ 'border-red-300 focus:border-red-500 focus:ring-red-500': errors.password }"
                            placeholder="Kosongkan jika tidak ingin mengubah"
                        />
                        <p v-if="errors.password" class="mt-1 text-sm text-red-600">{{ errors.password }}</p>
                        <p class="mt-1 text-sm text-gray-500">Kosongkan jika tidak ingin mengubah password.</p>
                    </div>

                    <!-- Password Confirmation -->
                    <div>
                        <label for="password_confirmation" class="block text-sm font-medium text-gray-700">
                            Konfirmasi Password Baru
                        </label>
                        <input
                            type="password"
                            id="password_confirmation"
                            v-model="form.password_confirmation"
                            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 px-3 py-2 text-sm"
                            placeholder="Ulangi password baru"
                        />
                    </div>

                    <!-- Role -->
                    <div>
                        <label for="role" class="block text-sm font-medium text-gray-700">
                            Role <span class="text-red-500">*</span>
                        </label>
                        <select
                            id="role"
                            v-model="form.role"
                            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 px-3 py-2 text-sm"
                            :class="{ 'border-red-300 focus:border-red-500 focus:ring-red-500': errors.role }"
                        >
                            <option value="">Pilih Role</option>
                            <option value="pengajar">Pengajar</option>
                            <option value="admin">Admin</option>
                        </select>
                        <p v-if="errors.role" class="mt-1 text-sm text-red-600">{{ errors.role }}</p>
                    </div>

                    <!-- Phone -->
                    <div>
                        <label for="phone" class="block text-sm font-medium text-gray-700">
                            Nomor Telepon
                        </label>
                        <input
                            type="tel"
                            id="phone"
                            v-model="form.phone"
                            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 px-3 py-2 text-sm"
                            placeholder="08xxxxxxxxxx"
                        />
                    </div>

                    <!-- Subject -->
                    <div>
                        <label for="subject" class="block text-sm font-medium text-gray-700">
                            Mata Pelajaran
                        </label>
                        <input
                            type="text"
                            id="subject"
                            v-model="form.subject"
                            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 px-3 py-2 text-sm"
                            placeholder="Contoh: Matematika, Bahasa Indonesia"
                        />
                    </div>

                    <!-- Address -->
                    <div class="sm:col-span-2">
                        <label for="address" class="block text-sm font-medium text-gray-700">
                            Alamat
                        </label>
                        <textarea
                            id="address"
                            v-model="form.address"
                            rows="3"
                            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 px-3 py-2 text-sm"
                            placeholder="Masukkan alamat lengkap"
                        ></textarea>
                    </div>

                    <!-- Is Active -->
                    <div class="sm:col-span-2">
                        <div class="flex items-center">
                            <input
                                id="is_active"
                                type="checkbox"
                                v-model="form.is_active"
                                class="h-4 w-4 text-blue-600 focus:ring-blue-500 border-gray-300 rounded"
                            />
                            <label for="is_active" class="ml-2 block text-sm text-gray-900">
                                Akun Aktif
                            </label>
                        </div>
                        <p class="mt-1 text-sm text-gray-500">
                            Jika tidak dicentang, pengajar tidak dapat login ke sistem.
                        </p>
                    </div>
                </div>

                <!-- Form Actions -->
                <div class="mt-6 flex items-center justify-end space-x-3">
                    <Link
                        href="/admin/users"
                        class="inline-flex items-center rounded-md bg-white px-3 py-2 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50"
                    >
                        Batal
                    </Link>
                    <button
                        type="submit"
                        :disabled="processing"
                        class="inline-flex items-center rounded-md bg-blue-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-blue-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-blue-600 disabled:opacity-50 disabled:cursor-not-allowed"
                    >
                        <svg v-if="processing" class="animate-spin -ml-1 mr-2 h-4 w-4 text-white" fill="none" viewBox="0 0 24 24">
                            <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                            <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                        </svg>
                        {{ processing ? 'Menyimpan...' : 'Simpan Perubahan' }}
                    </button>
                </div>
            </form>
        </div>
    </div>
    </AppLayout>
</template>

<script setup>
import { reactive, ref } from 'vue'
import { Link, router } from '@inertiajs/vue3'
import AppLayout from '@/Layouts/AppLayout.vue'

const processing = ref(false)

const props = defineProps({
    user: Object,
    errors: Object
})

const form = reactive({
    name: props.user.name,
    email: props.user.email,
    nip: props.user.nip,
    password: '',
    password_confirmation: '',
    role: props.user.role,
    phone: props.user.phone || '',
    subject: props.user.subject || '',
    address: props.user.address || '',
    is_active: props.user.is_active,
})

function submit() {
    processing.value = true
    router.put(`/admin/users/${props.user.id}`, form, {
        onFinish: () => {
            processing.value = false
        }
    })
}
</script>
