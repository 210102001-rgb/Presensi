import { usePage } from "@inertiajs/vue3";
import { watch } from "vue";
import axios from "axios";

export function useCsrf() {
    const page = usePage();

    // Watch for CSRF token changes and update axios headers
    watch(
        () => page.props.csrf_token,
        (newToken) => {
            if (newToken) {
                axios.defaults.headers.common["X-CSRF-TOKEN"] = newToken;

                // Update meta tag as well
                const metaTag = document.querySelector(
                    'meta[name="csrf-token"]'
                );
                if (metaTag) {
                    metaTag.setAttribute("content", newToken);
                }
            }
        },
        { immediate: true }
    );

    const getCsrfToken = () => {
        return (
            page.props.csrf_token ||
            document.querySelector('meta[name="csrf-token"]')?.content
        );
    };

    return {
        getCsrfToken,
    };
}
