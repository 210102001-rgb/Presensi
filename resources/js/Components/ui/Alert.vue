<template>
  <div
    :class="[
      'rounded-md p-4 mb-4',
      {
        'bg-green-50': variant === 'success',
        'bg-yellow-50': variant === 'warning',
        'bg-red-50': variant === 'error',
        'bg-blue-50': variant === 'info',
      },
    ]"
  >
    <div class="flex">
      <div class="flex-shrink-0">
        <component
          :is="iconComponent"
          :class="[
            'h-5 w-5',
            {
              'text-green-400': variant === 'success',
              'text-yellow-400': variant === 'warning',
              'text-red-400': variant === 'error',
              'text-blue-400': variant === 'info',
            },
          ]"
          aria-hidden="true"
        />
      </div>
      <div class="ml-3">
        <h3
          :class="[
            'text-sm font-medium',
            {
              'text-green-800': variant === 'success',
              'text-yellow-800': variant === 'warning',
              'text-red-800': variant === 'error',
              'text-blue-800': variant === 'info',
            },
          ]"
        >
          {{ title }}
        </h3>
        <div
          v-if="$slots.default || message"
          :class="[
            'mt-2 text-sm',
            {
              'text-green-700': variant === 'success',
              'text-yellow-700': variant === 'warning',
              'text-red-700': variant === 'error',
              'text-blue-700': variant === 'info',
            },
          ]"
        >
          <slot>{{ message }}</slot>
        </div>
        <div v-if="actions && actions.length > 0" class="mt-4">
          <div class="-mx-2 -my-1.5 flex">
            <button
              v-for="(action, index) in actions"
              :key="index"
              type="button"
              class="rounded-md px-2 py-1.5 text-sm font-medium focus:outline-none focus:ring-2 focus:ring-offset-2"
              :class="{
                'bg-green-50 text-green-800 hover:bg-green-100 focus:ring-green-500 focus:ring-offset-green-50': variant === 'success',
                'bg-yellow-50 text-yellow-800 hover:bg-yellow-100 focus:ring-yellow-500 focus:ring-offset-yellow-50': variant === 'warning',
                'bg-red-50 text-red-800 hover:bg-red-100 focus:ring-red-500 focus:ring-offset-red-50': variant === 'error',
                'bg-blue-50 text-blue-800 hover:bg-blue-100 focus:ring-blue-500 focus:ring-offset-blue-50': variant === 'info',
              }"
              @click="action.handler"
            >
              {{ action.label }}
            </button>
          </div>
        </div>
      </div>
      <div v-if="dismissible" class="ml-auto pl-3">
        <div class="-mx-1.5 -my-1.5">
          <button
            type="button"
            class="inline-flex rounded-md p-1.5 focus:outline-none focus:ring-2 focus:ring-offset-2"
            :class="{
              'bg-green-50 text-green-500 hover:bg-green-100 focus:ring-green-500 focus:ring-offset-green-50': variant === 'success',
              'bg-yellow-50 text-yellow-500 hover:bg-yellow-100 focus:ring-yellow-500 focus:ring-offset-yellow-50': variant === 'warning',
              'bg-red-50 text-red-500 hover:bg-red-100 focus:ring-red-500 focus:ring-offset-red-50': variant === 'error',
              'bg-blue-50 text-blue-500 hover:bg-blue-100 focus:ring-blue-500 focus:ring-offset-blue-50': variant === 'info',
            }"
            @click="$emit('dismiss')"
          >
            <span class="sr-only">Tutup</span>
            <svg class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
              <path d="M6.28 5.22a.75.75 0 00-1.06 1.06L8.94 10l-3.72 3.72a.75.75 0 101.06 1.06L10 11.06l3.72 3.72a.75.75 0 101.06-1.06L11.06 10l3.72-3.72a.75.75 0 00-1.06-1.06L10 8.94 6.28 5.22z" />
            </svg>
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { computed } from 'vue';
import { CheckCircleIcon, ExclamationTriangleIcon, XCircleIcon, InformationCircleIcon } from '@heroicons/vue/24/outline';

const props = defineProps({
  variant: {
    type: String,
    default: 'info',
    validator: (value) => ['success', 'warning', 'error', 'info'].includes(value),
  },
  title: {
    type: String,
    required: true,
  },
  message: {
    type: String,
    default: '',
  },
  dismissible: {
    type: Boolean,
    default: false,
  },
  actions: {
    type: Array,
    default: () => [],
  },
});

const emit = defineEmits(['dismiss']);

const iconComponent = computed(() => {
  const icons = {
    success: CheckCircleIcon,
    warning: ExclamationTriangleIcon,
    error: XCircleIcon,
    info: InformationCircleIcon,
  };
  return icons[props.variant] || InformationCircleIcon;
});
</script>
