<template>
  <div 
    class="rounded-xl border bg-card text-card-foreground shadow transition-all hover:shadow-md"
    :class="[padding, { 'cursor-pointer hover:border-primary/50': isClickable }]"
    @click="$emit('click')"
  >
    <div v-if="$slots.header || title" class="p-6 pb-0">
      <h3 v-if="title" class="text-lg font-semibold text-gray-900 dark:text-white">
        {{ title }}
      </h3>
      <p v-if="description" class="mt-1 text-sm text-gray-500 dark:text-gray-400">
        {{ description }}
      </p>
      <slot name="header"></slot>
    </div>
    
    <div :class="contentClasses">
      <slot></slot>
    </div>
    
    <div v-if="$slots.footer" class="p-6 pt-0">
      <slot name="footer"></slot>
    </div>
  </div>
</template>

<script setup>
import { computed } from 'vue';

const props = defineProps({
  title: {
    type: String,
    default: '',
  },
  description: {
    type: String,
    default: '',
  },
  padding: {
    type: String,
    default: 'p-6',
  },
  noPadding: {
    type: Boolean,
    default: false,
  },
  isClickable: {
    type: Boolean,
    default: false,
  },
});

const contentClasses = computed(() => ({
  'p-6': !props.noPadding && !props.padding,
  [props.padding]: !props.noPadding && props.padding,
  'p-0': props.noPadding,
}));
</script>
