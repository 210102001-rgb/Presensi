<template>
    <AppLayout>
        <div class="space-y-8">
            <!-- Header -->
            <div class="md:flex md:items-center md:justify-between">
                <div class="min-w-0 flex-1">
                    <h2 class="text-xl sm:text-2xl font-bold leading-7 text-gray-900 sm:truncate sm:text-3xl sm:tracking-tight">
                        Edit Presensi
                    </h2>
                    <p class="mt-1 text-sm text-gray-500">
                        Edit data presensi pengajar.
                    </p>
                </div>
                <div class="mt-4 flex md:ml-4 md:mt-0">
                    <Link
                        href="/admin/attendances"
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

                        <!-- Schedule -->
                        <div class="sm:col-span-2">
                            <label for="schedule_id" class="block text-sm font-medium text-gray-700">
                                Jadwal <span class="text-red-500">*</span>
                            </label>
                            <select
                                id="schedule_id"
                                v-model="form.schedule_id"
                                 class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 px-3 py-2 text-sm"
                                :class="{ 'border-red-300 focus:border-red-500 focus:ring-red-500': errors.schedule_id }"
                            >
                                <option value="">Pilih Jadwal</option>
                                <option v-for="schedule in schedules" :key="schedule.id" :value="schedule.id">
                                    {{ schedule.subject }} - {{ schedule.class }} ({{ getDayName(schedule.day) }} {{ schedule.start_time }}-{{ schedule.end_time }})
                                </option>
                            </select>
                            <p v-if="errors.schedule_id" class="mt-1 text-sm text-red-600">{{ errors.schedule_id }}</p>
                        </div>

                        <!-- Date -->
                        <div>
                            <label for="date" class="block text-sm font-medium text-gray-700">
                                Tanggal <span class="text-red-500">*</span>
                            </label>
                            <input
                                type="date"
                                id="date"
                                v-model="form.date"
                                 class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 px-3 py-2 text-sm"
                                :class="{ 'border-red-300 focus:border-red-500 focus:ring-red-500': errors.date }"
                            />
                            <p v-if="errors.date" class="mt-1 text-sm text-red-600">{{ errors.date }}</p>
                        </div>

                        <!-- Status -->
                        <div>
                            <label for="status" class="block text-sm font-medium text-gray-700">
                                Status <span class="text-red-500">*</span>
                            </label>
                            <select
                                id="status"
                                v-model="form.status"
                                 class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 px-3 py-2 text-sm"
                                :class="{ 'border-red-300 focus:border-red-500 focus:ring-red-500': errors.status }"
                            >
                                <option value="">Pilih Status</option>
                                <option value="hadir">Hadir</option>
                                <option value="terlambat">Terlambat</option>
                                <option value="izin">Izin</option>
                                <option value="alpha">Alpha</option>
                            </select>
                            <p v-if="errors.status" class="mt-1 text-sm text-red-600">{{ errors.status }}</p>
                        </div>

                        <!-- Check In Time -->
                        <div>
                            <label for="check_in_time" class="block text-sm font-medium text-gray-700">
                                Waktu Check In
                            </label>
                            <input
                                type="time"
                                id="check_in_time"
                                v-model="form.check_in_time"
                                 class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 px-3 py-2 text-sm"
                                :class="{ 'border-red-300 focus:border-red-500 focus:ring-red-500': errors.check_in_time }"
                            />
                            <p v-if="errors.check_in_time" class="mt-1 text-sm text-red-600">{{ errors.check_in_time }}</p>
                        </div>

                        <!-- Check Out Time -->
                        <div>
                            <label for="check_out_time" class="block text-sm font-medium text-gray-700">
                                Waktu Check Out
                            </label>
                            <input
                                type="time"
                                id="check_out_time"
                                v-model="form.check_out_time"
                                 class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 px-3 py-2 text-sm"
                                :class="{ 'border-red-300 focus:border-red-500 focus:ring-red-500': errors.check_out_time }"
                            />
                            <p v-if="errors.check_out_time" class="mt-1 text-sm text-red-600">{{ errors.check_out_time }}</p>
                        </div>

                        <!-- Notes -->
                        <div class="sm:col-span-2">
                            <label for="notes" class="block text-sm font-medium text-gray-700">
                                Catatan
                            </label>
                            <textarea
                                id="notes"
                                v-model="form.notes"
                                rows="3"
                                 class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 px-3 py-2 text-sm"
                                placeholder="Catatan tambahan tentang presensi"
                            ></textarea>
                        </div>
                    </div>

                    <!-- Form Actions -->
                    <div class="mt-6 flex items-center justify-end space-x-3">
                        <Link
                            href="/admin/attendances"
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
    attendance: Object,
    teachers: Array,
    schedules: Array,
    errors: Object
})

const form = reactive({
    teacher_id: props.attendance.teacher_id,
    schedule_id: props.attendance.schedule_id,
    date: props.attendance.date,
    status: props.attendance.status,
    check_in_time: props.attendance.check_in_time || '',
    check_out_time: props.attendance.check_out_time || '',
    notes: props.attendance.notes || '',
})

function submit() {
    processing.value = true
    router.put(`/admin/attendances/${props.attendance.id}`, form, {
        onFinish: () => {
            processing.value = false
        }
    })
}

function getDayName(day) {
    const days = {
        'monday': 'Senin',
        'tuesday': 'Selasa',
        'wednesday': 'Rabu',
        'thursday': 'Kamis',
        'friday': 'Jumat',
        'saturday': 'Sabtu',
        'sunday': 'Minggu'
    }
    return days[day] || day
}
</script>
