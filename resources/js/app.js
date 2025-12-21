import "./bootstrap";
import { createApp, h } from "vue";
import { createInertiaApp } from "@inertiajs/vue3";
import { resolvePageComponent } from "laravel-vite-plugin/inertia-helpers";
import axios from "axios";

const el = document.getElementById("app");
if (el) {
    createInertiaApp({
        resolve: (name) =>
            resolvePageComponent(
                `./Pages/${name}.vue`,
                // Support nested pages directories
                import.meta.glob("./Pages/**/*.vue")
            ),
        setup({ App, props, plugin }) {
            // Update CSRF token in axios headers when page props change
            if (props.initialPage.props.csrf_token) {
                axios.defaults.headers.common["X-CSRF-TOKEN"] =
                    props.initialPage.props.csrf_token;
            }

            const app = createApp({ render: () => h(App, props) }).use(plugin);

            // Provide a global method to update CSRF token
            app.config.globalProperties.$updateCsrfToken = (token) => {
                axios.defaults.headers.common["X-CSRF-TOKEN"] = token;
            };

            app.mount(el);
        },
        progress: {
            delay: 250,
            color: "#3B82F6",
            includeCSS: true,
            showSpinner: true,
        },
    });
}
