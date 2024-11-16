import { createRouter, createWebHistory } from 'vue-router';
import SignupForm from '../components/SignupForm.vue';
import LoginForm from '../components/LoginForm.vue';
import ProductsList from '../components/ProductsList.vue';
import { useAuthStore } from '@/stores/auth';

const routes = [
    {
        path: '/',
        name: 'Home',
        component: LoginForm,
        beforeEnter: (to, from, next) => {
          const authStore = useAuthStore();
          if (localStorage.getItem('token')) {
            next('/products');
          } else {
            next();
          }
        },
      },

  {
    path: '/login',
    name: 'Login',
    component: LoginForm,
    beforeEnter: (to, from, next) => {
      const authStore = useAuthStore();
      if (localStorage.getItem('token')) {
        next('/products');
      } else {
        next();
      }
    },
  },
  {
    path: '/signup',
    name: 'Signup',
    component: SignupForm,
    beforeEnter: (to, from, next) => {
      const authStore = useAuthStore();
      if (localStorage.getItem('token')) {
        next('/products');
      } else {
        next();
      }
    },
  },

  {
    path: '/products',
    name: 'Products',
    component: ProductsList,
    beforeEnter: (to, from, next) => {
      const authStore = useAuthStore();
      if (! localStorage.getItem('token')) {
        next('/login');
      } else {
        next();
      }
    },
  },

];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
