<template>
  <div class="w-full">
    <label v-if="label" :for="id" class="block text-sm font-medium text-gray-700 mb-1">
      {{ label }}
      <span v-if="required" class="text-red-500">*</span>
    </label>
    <div class="relative rounded-md shadow-sm">
      <div v-if="icon" class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
        <component :is="icon" class="h-5 w-5 text-gray-400" />
      </div>
      <input
        :id="id"
        :type="type"
        :value="modelValue"
        :placeholder="placeholder"
        :disabled="disabled"
        :class="[
          'block w-full rounded-md border-gray-300 shadow-sm focus:border-primary-500 focus:ring-primary-500 sm:text-sm',
          {
            'pl-10': icon,
            'border-red-300 text-red-900 placeholder-red-300 focus:border-red-500 focus:outline-none focus:ring-red-500': error,
            'opacity-60 cursor-not-allowed': disabled,
          },
          inputClass,
        ]"
        v-bind="$attrs"
        @input="$emit('update:modelValue', $event.target.value)"
      >
    </div>
    <p v-if="error" class="mt-1 text-sm text-red-600">
      {{ error }}
    </p>
    <p v-else-if="hint" class="mt-1 text-sm text-gray-500">
      {{ hint }}
    </p>
  </div>
</template>

<script setup>
import { v4 as uuidv4 } from 'uuid';
import { defineProps, defineEmits } from 'vue';

const props = defineProps({
  modelValue: {
    type: [String, Number],
    default: '',
  },
  type: {
    type: String,
    default: 'text',
  },
  label: {
    type: String,
    default: '',
  },
  placeholder: {
    type: String,
    default: '',
  },
  error: {
    type: String,
    default: '',
  },
  hint: {
    type: String,
    default: '',
  },
  icon: {
    type: Object,
    default: null,
  },
  disabled: {
    type: Boolean,
    default: false,
  },
  required: {
    type: Boolean,
    default: false,
  },
  inputClass: {
    type: String,
    default: '',
  },
  id: {
    type: String,
    default: () => `input-${uuidv4()}`,
  },
});

const emit = defineEmits(['update:modelValue']);
</script>
