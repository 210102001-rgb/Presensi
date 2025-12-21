<template>
    <AppLayout>
        <div class="space-y-8">
            <!-- Header -->
            <div class="md:flex md:items-center md:justify-between">
                <div class="min-w-0 flex-1">
                    <h2 class="text-xl sm:text-2xl font-bold leading-7 text-gray-900 sm:truncate sm:text-3xl sm:tracking-tight">
                        Tambah Jadwal
                    </h2>
                    <p class="mt-1 text-sm text-gray-500">
                        Tambahkan jadwal mengajar baru.
                    </p>
                </div>
                <div class="mt-4 flex md:ml-4 md:mt-0">
                    <Link
                        href="/admin/schedules"
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
                        <!-- Teacher -->
                        <div class="sm:col-span-2">
                            <label for="teacher_id" class="block text-sm font-medium text-gray-700">
                                Pengajar <span class="text-red-500">*</span>
                            </label>
                            <select
                                id="teacher_id"
                                v-model="form.teacher_id"
                                 class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 px-3 py-2 text-sm"
                                :class="{ 'border-red-300 focus:border-red-500 focus:ring-red-500': errors.teacher_id }"
                            >
                                <option value="">Pilih Pengajar</option>
                                <option v-for="teacher in teachers" :key="teacher.id" :value="teacher.id">
                                    {{ teacher.name }} ({{ teacher.nip }})
                                </option>
                            </select>
                            <p v-if="errors.teacher_id" class="mt-1 text-sm text-red-600">{{ errors.teacher_id }}</p>
                        </div>

                        <!-- Location -->
                        <div class="sm:col-span-2">
                            <label for="location_id" class="block text-sm font-medium text-gray-700">
                                Lokasi <span class="text-red-500">*</span>
                            </label>
                            <select
                                id="location_id"
                                v-model="form.location_id"
                                 class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 px-3 py-2 text-sm"
                                :class="{ 'border-red-300 focus:border-red-500 focus:ring-red-500': errors.location_id }"
                            >
                                <option value="">Pilih Lokasi</option>
                                <option v-for="location in locations" :key="location.id" :value="location.id">
                                    {{ location.name }}
                                </option>
                            </select>
                            <p v-if="errors.location_id" class="mt-1 text-sm text-red-600">{{ errors.location_id }}</p>
                        </div>

                        <!-- Subject -->
                        <div class="sm:col-span-2">
                            <label for="subject" class="block text-sm font-medium text-gray-700">
                                Mata Pelajaran <span class="text-red-500">*</span>
                            </label>
                            <input
                                type="text"
                                id="subject"
                                v-model="form.subject"
                                 class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 px-3 py-2 text-sm"
                                :class="{ 'border-red-300 focus:border-red-500 focus:ring-red-500': errors.subject }"
                                placeholder="Contoh: Matematika, Bahasa Indonesia"
                            />
                            <p v-if="errors.subject" class="mt-1 text-sm text-red-600">{{ errors.subject }}</p>
                        </div>

                        <!-- Class -->
                        <div class="sm:col-span-2">
                            <label for="class" class="block text-sm font-medium text-gray-700">
                                Kelas <span class="text-red-500">*</span>
                            </label>
                            <input
                                type="text"
                                id="class"
                                v-model="form.class"
                                 class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 px-3 py-2 text-sm"
                                :class="{ 'border-red-300 focus:border-red-500 focus:ring-red-500': errors.class }"
                                placeholder="Contoh: 10A, 11B, 12C"
                            />
                            <p v-if="errors.class" class="mt-1 text-sm text-red-600">{{ errors.class }}</p>
                        </div>

                        <!-- Day -->
                        <div>
                            <label for="day" class="block text-sm font-medium text-gray-700">
                                Hari <span class="text-red-500">*</span>
                            </label>
                            <select
                                id="day"
                                v-model="form.day"
                                 class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 px-3 py-2 text-sm"
                                :class="{ 'border-red-300 focus:border-red-500 focus:ring-red-500': errors.day }"
                            >
                                <option value="">Pilih Hari</option>
                                <option value="monday">Senin</option>
                                <option value="tuesday">Selasa</option>
                                <option value="wednesday">Rabu</option>
                                <option value="thursday">Kamis</option>
                                <option value="friday">Jumat</option>
                                <option value="saturday">Sabtu</option>
                                <option value="sunday">Minggu</option>
                            </select>
                            <p v-if="errors.day" class="mt-1 text-sm text-red-600">{{ errors.day }}</p>
                        </div>

                        <!-- Start Time -->
                        <div>
                            <label for="start_time" class="block text-sm font-medium text-gray-700">
                                Waktu Mulai <span class="text-red-500">*</span>
                            </label>
                            <input
                                type="time"
                                id="start_time"
                                v-model="form.start_time"
                                 class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 px-3 py-2 text-sm"
                                :class="{ 'border-red-300 focus:border-red-500 focus:ring-red-500': errors.start_time }"
                            />
                            <p v-if="errors.start_time" class="mt-1 text-sm text-red-600">{{ errors.start_time }}</p>
                        </div>

                        <!-- End Time -->
                        <div>
                            <label for="end_time" class="block text-sm font-medium text-gray-700">
                                Waktu Selesai <span class="text-red-500">*</span>
                            </label>
                            <input
                                type="time"
                                id="end_time"
                                v-model="form.end_time"
                                 class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 px-3 py-2 text-sm"
                                :class="{ 'border-red-300 focus:border-red-500 focus:ring-red-500': errors.end_time }"
                            />
                            <p v-if="errors.end_time" class="mt-1 text-sm text-red-600">{{ errors.end_time }}</p>
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
                                    Jadwal Aktif
                                </label>
                            </div>
                            <p class="mt-1 text-sm text-gray-500">Centang jika jadwal ini aktif dan dapat digunakan untuk presensi.</p>
                        </div>
                    </div>

                    <!-- Form Actions -->
                    <div class="mt-6 flex items-center justify-end space-x-3">
                        <Link
                            href="/admin/schedules"
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
                            {{ processing ? 'Menyimpan...' : 'Simpan' }}
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

const form = reactive({
    teacher_id: '',
    location_id: '',
    subject: '',
    class: '',
    day: '',
    start_time: '',
    end_time: '',
    is_active: true,
})

const props = defineProps({
    teachers: Array,
    locations: Array,
    errors: Object
})

function submit() {
    processing.value = true
    router.post('/admin/schedules', form, {
        onFinish: () => {
            processing.value = false
        }
    })
}
</script>
