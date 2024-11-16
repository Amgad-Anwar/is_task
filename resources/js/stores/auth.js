import { defineStore } from 'pinia';
import axios from 'axios';
import { toast } from 'vue3-toastify';
import 'vue3-toastify/dist/index.css';


export const useAuthStore = defineStore('auth', {
    state: () => ({
        user: null,
        token: localStorage.getItem('token') || null,
        isAuthenticated: false,
    }),
    actions: {
        async signup(userData, router) {
            try {
                const response = await axios.post('/api/sign-up', userData);
                this.user = response.data.customer;
                this.token = response.data.token;

                localStorage.setItem('token', this.token);
                this.isAuthenticated = true;

                toast.success('Signup successful!');
                router.push('/products');
            } catch (error) {
                toast.error(error.response?.data?.message || 'Signup failed');
                throw error;
            }
        },

        async login(credentials, router) {
            try {
                const response = await axios.post('/api/sign-in', credentials);
                this.user = response.data.customer;
                this.token = response.data.token;

                localStorage.setItem('token', this.token);
                this.isAuthenticated = true;
                toast.success('Login successful!');
                router.push('/products');
            } catch (error) {
                toast.error(error.response?.data?.message || 'Login failed');
                throw error;
            }
        },

        async logout() {
            const token = localStorage.getItem('token');

            const headers = token ? { Authorization: `Bearer ${token}` } : {};
            const response = await axios.post('/api/sign-out', {}, { headers });
            this.user = null;
            this.token = null;
            this.isAuthenticated = false;
            localStorage.removeItem('token');
            toast.info('Logged out successfully');
        },

        setUserData(userData) {
            this.user = userData;
        }

    },

    persist: true,  // Optional: Persist the state across page reloads.
});
