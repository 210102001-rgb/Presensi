<script setup>
import { computed, onMounted, onUnmounted, watch } from "vue";

const props = defineProps({
    show: {
        type: Boolean,
        default: false,
    },
    maxWidth: {
        type: String,
        default: "2xl",
    },
    closeable: {
        type: Boolean,
        default: true,
    },
});

const emit = defineEmits(["close"]);

watch(
    () => props.show,
    () => {
        if (props.show) {
            document.body.style.overflow = "hidden";
        } else {
            document.body.style.overflow = null;
        }
    }
);

const close = () => {
    if (props.closeable) {
        emit("close");
    }
};

const closeOnEscape = (e) => {
    if (e.key === "Escape" && props.show) {
        close();
    }
};

onMounted(() => document.addEventListener("keydown", closeOnEscape));
onUnmounted(() => {
    document.removeEventListener("keydown", closeOnEscape);
    document.body.style.overflow = null;
});

const maxWidthClass = computed(() => {
    return {
        sm: "sm:max-w-sm",
        md: "sm:max-w-md",
        lg: "sm:max-w-lg",
        xl: "sm:max-w-xl",
        "2xl": "sm:max-w-2xl",
    }[props.maxWidth];
});
</script>

<template>
    <teleport to="body">
        <div
            v-if="show"
            class="fixed inset-0 overflow-y-auto px-4 py-6 sm:px-0 z-[9999] flex items-center justify-center"
            @click.self="close"
        >
            <!-- Background Overlay -->
            <div
                class="fixed inset-0 bg-gray-500 opacity-75"
                @click="close"
            ></div>

            <!-- Modal Content -->
            <div
                class="relative bg-white rounded-lg overflow-hidden shadow-xl transform transition-all w-full max-w-lg z-10"
                @click.stop
            >
                <div class="px-6 py-4">
                    <div class="flex items-center justify-between">
                        <slot name="title"></slot>
                        <button
                            v-if="closeable"
                            @click="close"
                            class="text-gray-400 hover:text-gray-500 focus:outline-none"
                        >
                            <svg
                                class="h-6 w-6"
                                fill="none"
                                viewBox="0 0 24 24"
                                stroke="currentColor"
                            >
                                <path
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    stroke-width="2"
                                    d="M6 18L18 6M6 6l12 12"
                                />
                            </svg>
                        </button>
                    </div>

                    <div class="mt-4">
                        <slot name="content"></slot>
                    </div>

                    <div class="mt-6 flex justify-end">
                        <slot name="footer"></slot>
                    </div>
                </div>
            </div>
        </div>
    </teleport>
</template>
