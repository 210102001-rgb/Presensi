<template>
  <button
    :type="type"
    :disabled="disabled || loading"
    :class="[
      'inline-flex items-center justify-center rounded-md text-sm font-medium transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-offset-2 disabled:opacity-50 disabled:pointer-events-none',
      {
        'opacity-70 cursor-wait': loading,
        'w-full': block,
        'px-4 py-2': size === 'default',
        'px-3 py-1.5 text-sm': size === 'sm',
        'px-6 py-3 text-base': size === 'lg',
        'bg-primary text-white hover:bg-primary/90': variant === 'primary',
        'bg-white border border-gray-300 text-gray-700 hover:bg-gray-50': variant === 'outline',
        'bg-success text-white hover:bg-success/90': variant === 'success',
        'bg-warning text-white hover:bg-warning/90': variant === 'warning',
        'bg-danger text-white hover:bg-danger/90': variant === 'danger',
        'bg-transparent text-primary hover:bg-primary/10': variant === 'ghost',
        'bg-transparent hover:bg-gray-100 text-gray-700': variant === 'link',
      },
      className,
    ]"
    v-bind="$attrs"
  >
    <span v-if="loading" class="mr-2">
      <svg class="animate-spin h-4 w-4 text-current" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
        <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
        <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
      </svg>
    </span>
    <slot></slot>
  </button>
</template>

<script setup>
import { defineProps } from 'vue';

defineProps({
  type: {
    type: String,
    default: 'button',
  },
  variant: {
    type: String,
    default: 'primary',
    validator: (value) => ['primary', 'outline', 'success', 'warning', 'danger', 'ghost', 'link'].includes(value),
  },
  size: {
    type: String,
    default: 'default',
    validator: (value) => ['sm', 'default', 'lg'].includes(value),
  },
  loading: {
    type: Boolean,
    default: false,
  },
  disabled: {
    type: Boolean,
    default: false,
  },
  block: {
    type: Boolean,
    default: false,
  },
  className: {
    type: String,
    default: '',
  },
});
</script>
