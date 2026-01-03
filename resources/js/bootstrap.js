import axios from "axios";
import { router } from "@inertiajs/vue3";

window.axios = axios;

window.axios.defaults.headers.common["X-Requested-With"] = "XMLHttpRequest";

// Set initial CSRF token from meta tag
const token = document.querySelector('meta[name="csrf-token"]');
if (token) {
    const csrfToken = token.getAttribute("content");
    window.axios.defaults.headers.common["X-CSRF-TOKEN"] = csrfToken;
} else {
    console.error("CSRF token meta tag not found");
}

// Add response interceptor to handle CSRF token mismatch
window.axios.interceptors.response.use(
    (response) => response,
    async (error) => {
        if (error.response?.status === 419) {
            console.warn(
                "CSRF token expired (419), reloading page to get fresh token..."
            );
            // Reload the page to get a fresh CSRF token
            window.location.reload();
        }
        return Promise.reject(error);
    }
);

// Update CSRF token after each Inertia navigation
if (typeof router !== "undefined") {
    router.on("navigate", (event) => {
        const page = event.detail.page;
        if (page.props && page.props.csrf_token) {
            const newToken = page.props.csrf_token;
            window.axios.defaults.headers.common["X-CSRF-TOKEN"] = newToken;

            // Also update meta tag
            const metaTag = document.querySelector('meta[name="csrf-token"]');
            if (metaTag) {
                metaTag.setAttribute("content", newToken);
            }
        }
    });
}
