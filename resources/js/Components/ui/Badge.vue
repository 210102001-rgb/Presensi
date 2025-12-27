<template>
  <span
    :class="[
      'inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium',
      {
        'bg-green-100 text-green-800': variant === 'success',
        'bg-yellow-100 text-yellow-800': variant === 'warning',
        'bg-red-100 text-red-800': variant === 'danger',
        'bg-blue-100 text-blue-800': variant === 'info',
        'bg-gray-100 text-gray-800': variant === 'default',
        'bg-purple-100 text-purple-800': variant === 'primary',
        'px-2 py-0.5 text-xs': size === 'sm',
        'px-3 py-1 text-sm': size === 'lg',
      },
      className,
    ]"
  >
    <span v-if="icon" class="mr-1.5">
      <component :is="icon" class="h-3.5 w-3.5" />
    </span>
    <slot></slot>
  </span>
</template>

<script setup>
import { defineProps } from 'vue';

defineProps({
  variant: {
    type: String,
    default: 'default',
    validator: (value) => ['default', 'primary', 'success', 'warning', 'danger', 'info'].includes(value),
  },
  size: {
    type: String,
    default: 'default',
    validator: (value) => ['sm', 'default', 'lg'].includes(value),
  },
  icon: {
    type: Object,
    default: null,
  },
  className: {
    type: String,
    default: '',
  },
});
</script>
