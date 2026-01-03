const defaultTheme = require('tailwindcss/defaultTheme');

/** @type {import('tailwindcss').Config} */
module.exports = {
    content: [
        './vendor/laravel/framework/src/Illuminate/Pagination/resources/views/*.blade.php',
        './storage/framework/views/*.php',
        './resources/views/**/*.blade.php',
        './resources/js/**/*.js',
        './resources/js/**/*.vue',
    ],

    theme: {
        extend: {
            fontFamily: {
                sans: ['Inter var', ...defaultTheme.fontFamily.sans],
            },
            colors: {
                primary: {
                    DEFAULT: '#4F46E5',
                    '50': '#EEF2FF',
                    '100': '#E0E7FF',
                    '200': '#C7D2FE',
                    '300': '#A5B4FC',
                    '400': '#818CF8',
                    '500': '#6366F1',
                    '600': '#4F46E5',
                    '700': '#4338CA',
                    '800': '#3730A3',
                    '900': '#312E81',
                },
                success: {
                    DEFAULT: '#10B981',
                    '50': '#ECFDF5',
                    '100': '#D1FAE5',
                    '200': '#A7F3D0',
                    '300': '#6EE7B7',
                    '400': '#34D399',
                    '500': '#10B981',
                    '600': '#059669',
                    '700': '#047857',
                    '800': '#065F46',
                    '900': '#064E3B',
                },
                warning: {
                    DEFAULT: '#F59E0B',
                    '50': '#FFFBEB',
                    '100': '#FEF3C7',
                    '200': '#FDE68A',
                    '300': '#FCD34D',
                    '400': '#FBBF24',
                    '500': '#F59E0B',
                    '600': '#D97706',
                    '700': '#B45309',
                    '800': '#92400E',
                    '900': '#78350F',
                },
                danger: {
                    DEFAULT: '#EF4444',
                    '50': '#FEF2F2',
                    '100': '#FEE2E2',
                    '200': '#FECACA',
                    '300': '#FCA5A5',
                    '400': '#F87171',
                    '500': '#EF4444',
                    '600': '#DC2626',
                    '700': '#B91C1C',
                    '800': '#991B1B',
                    '900': '#7F1D1D',
                },
            },
            boxShadow: {
                'card': '0 1px 3px 0 rgb(0 0 0 / 0.1), 0 1px 2px -1px rgb(0 0 0 / 0.1)',
                'card-hover': '0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1)',
            },
        },
    },

    plugins: [
        require('@tailwindcss/forms'),
        require('@tailwindcss/typography'),
    ],
};
